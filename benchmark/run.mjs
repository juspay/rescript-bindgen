// ============================================================================
// run.mjs — real-world benchmark gate for the generator.
//
// For each version-pinned package in benchmark/packages.json it:
//   1. builds a ReScript 12 sandbox (template + pinned package, lockfile-exact)
//   2. runs THIS CHECKOUT's CLI against the package's .d.ts
//   3. diffs the generated bindings against benchmark/baselines/<slug>/bindings/
//   4. compiles the bindings (`npx rescript build`, golden-compile rules)
//   5. compares quality metrics against baselines/<slug>/metrics.json
//
// Verdict per package (vs baseline):
//   FAIL — generator crashes / compile breaks / new warnings / buckets regress
//          (broken↑, usable↓, review↑)
//   WARN — output differs but compiles and metrics are equal-or-better
//          (intentional change? accept with `npm run bench:update` + commit)
//   PASS — byte-identical to baseline (incl. an unchanged known-gap package)
//
// Run:   node benchmark/run.mjs                  # verify (exit 1 on any FAIL)
//        node benchmark/run.mjs --update         # (re)seed baselines
//        node benchmark/run.mjs --only <slug>    # one package (slug or pkg name)
//
// Writes benchmark/.work/results.json + results.md (CI job summary / PR comment).
// ============================================================================
import { execSync, execFileSync } from 'child_process'
import { mkdirSync, rmSync, cpSync, readFileSync, writeFileSync, existsSync, readdirSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'
import { createHash } from 'crypto'
import { GREEN, RED, DIM, readDir, diffDirs } from '../test/lib/diff.mjs'

const HERE = dirname(fileURLToPath(import.meta.url))
const ROOT = dirname(HERE)
const CLI = join(ROOT, 'src', 'cli.mjs')
const TEMPLATE = join(HERE, 'sandbox-template')
const BASELINES = join(HERE, 'baselines')
const WORK = join(HERE, '.work')

const UPDATE = process.argv.includes('--update')
const onlyIx = process.argv.indexOf('--only')
const ONLY = onlyIx === -1 ? null : process.argv[onlyIx + 1]
// #203: the pre-release gate — resolve the LATEST blend beta dist-tag (not a pinned version) and
// prove the shipped checkout still generates + compiles it. blend is the primary downstream target
// and moves faster than our pins; twice a regression compiled on the pins but broke on the newer
// real one (#110, #198 — the latter a crash-before-emit that compile gates can't see, since there
// is no output to compile). Only running the LATEST catches that class before it ships.
const LATEST_BLEND = process.argv.includes('--latest-blend')
const BLEND_PKG = '@juspay/blend-design-system'

const YELLOW = (s) => `\x1b[33m${s}\x1b[0m`
const slugOf = (name) => name.replace(/[@/]/g, '_') // "@s/p" -> "_s_p" (a leading @ already becomes _)
const stripAnsi = (s) => s.replace(/\x1b\[\d+m/g, '')

/** Run a shell command, returning { ok, out } instead of throwing. */
function sh(cmd, cwd) {
    try { return { ok: true, out: execSync(cmd + ' 2>&1', { cwd, encoding: 'utf-8', maxBuffer: 64 * 1024 * 1024 }) } }
    catch (e) { return { ok: false, out: (e.stdout || e.message || '').toString() } }
}

/**
 * Prepare the sandbox for one package: template + exact-pinned dep + (verify mode)
 * the committed lockfile. node_modules is kept across runs and only reinstalled
 * when the lockfile stamp changes (so CI can cache it).
 */
function setupSandbox(pkg, slug, sandbox, { freshInstall = false } = {}) {
    mkdirSync(sandbox, { recursive: true })
    const tpl = JSON.parse(readFileSync(join(TEMPLATE, 'package.json'), 'utf-8'))
    tpl.dependencies[pkg.name] = pkg.version // exact pin, no range
    writeFileSync(join(sandbox, 'package.json'), JSON.stringify(tpl, null, 2) + '\n')
    cpSync(join(TEMPLATE, 'rescript.json'), join(sandbox, 'rescript.json'))

    const committedLock = join(BASELINES, slug, 'package-lock.json')
    if (UPDATE || freshInstall) {
        // Fresh resolve. Under --update the resulting lockfile becomes the committed baseline; under
        // --latest-blend (fresh) the version floats and has no committed lockfile to reuse anyway.
        rmSync(join(sandbox, 'package-lock.json'), { force: true })
        const r = sh('npm install --silent --no-audit --no-fund', sandbox)
        if (!r.ok) throw new Error(`npm install failed:\n${r.out.slice(0, 2000)}`)
        return
    }
    if (!existsSync(committedLock)) throw new Error(`no baseline lockfile — run \`npm run bench:update\` first`)
    cpSync(committedLock, join(sandbox, 'package-lock.json'))

    // Skip `npm ci` when node_modules already matches this lockfile (CI cache hit).
    const stamp = createHash('sha256').update(readFileSync(committedLock)).digest('hex')
    const stampFile = join(sandbox, '.lock-stamp')
    // Read the prior stamp directly (try/catch) rather than existsSync-then-read — the latter is a
    // check-then-read TOCTOU race that CodeQL flags; a missing/unreadable stamp just means "not fresh".
    let priorStamp = null
    try { priorStamp = readFileSync(stampFile, 'utf-8') } catch { /* no prior stamp -> rebuild */ }
    const fresh = priorStamp === stamp && existsSync(join(sandbox, 'node_modules', 'rescript'))
    if (!fresh) {
        const r = sh('npm ci --silent --no-audit --no-fund', sandbox)
        if (!r.ok) throw new Error(`npm ci failed (template/pin changed? run \`npm run bench:update\`):\n${r.out.slice(0, 2000)}`)
        writeFileSync(stampFile, stamp)
    }
}

/** Run this checkout's CLI against the sandbox-installed package. */
function generate(pkg, sandbox, workDir) {
    const srcDir = join(sandbox, 'src')
    rmSync(srcDir, { recursive: true, force: true })
    mkdirSync(srcDir, { recursive: true })
    const summaryPath = join(workDir, 'summary.json')
    rmSync(summaryPath, { force: true })
    const args = [
        CLI,
        '--pkg', `${pkg.name}@${pkg.version}`,
        '--out', srcDir,
        '--from', pkg.name,
        '--report', '--yes', '--no-install',
        '--node-modules', join(sandbox, 'node_modules'),
        '--json-summary', summaryPath,
        ...(pkg.flags || []),
    ]
    let exit = 0
    let log = ''
    try {
        log = execFileSync('node', args, { encoding: 'utf-8', stdio: ['ignore', 'pipe', 'pipe'] })
    } catch (e) {
        exit = e.status ?? 1
        log = (e.stderr || e.message || '').toString()
    }
    writeFileSync(join(workDir, 'generate.log'), `# exit ${exit}\n${log}`)
    const summary = existsSync(summaryPath) ? JSON.parse(readFileSync(summaryPath, 'utf-8')) : null
    return { exit, summary }
}

/** Compile the sandbox with ReScript; same warning-counting rule as test/golden-compile.mjs. */
function compile(sandbox, workDir, hasFiles) {
    if (!hasFiles) return { ok: true, warnings: 0, errors: '' } // known-gap package: nothing to compile
    const r = sh('npx rescript build', sandbox)
    writeFileSync(join(workDir, 'compile.log'), r.out)
    const warnings = (r.out.match(/Warning number \d+/g) || []).length
    const errors = r.ok ? '' : r.out.split('\n').filter((l) => /[Ee]rror|Syntax|\.res:/.test(l)).slice(0, 12).join('\n')
    return { ok: r.ok, warnings, errors }
}

/** FAIL / WARN / PASS for one package, vs its committed baseline. */
function verdictFor(metrics, baseline, diffProblems) {
    if (!baseline) return { verdict: 'FAIL', reason: 'no baseline — run `npm run bench:update` and commit it' }
    const b = baseline, m = metrics
    if (b.generatorExit === 0 && m.generatorExit !== 0) return { verdict: 'FAIL', reason: 'generator crashed (baseline ran clean)' }
    if (b.compileOk && !m.compileOk) return { verdict: 'FAIL', reason: 'bindings no longer compile' }
    if (m.warnings > b.warnings) return { verdict: 'FAIL', reason: `compile warnings ${b.warnings} -> ${m.warnings}` }
    if (m.buckets.broken > b.buckets.broken) return { verdict: 'FAIL', reason: `broken ${b.buckets.broken} -> ${m.buckets.broken}` }
    if (m.buckets.usable < b.buckets.usable) return { verdict: 'FAIL', reason: `usable ${b.buckets.usable} -> ${m.buckets.usable}` }
    if (m.buckets.review > b.buckets.review) return { verdict: 'FAIL', reason: `review ${b.buckets.review} -> ${m.buckets.review}` }
    if (diffProblems.length) return { verdict: 'WARN', reason: 'output changed (metrics equal-or-better) — accept with `npm run bench:update`' }
    return { verdict: 'PASS', reason: '' }
}

/** Pick the newest pinned blend baseline (by semver-ish version sort) to diff a floating latest
 *  build against — informational only; a newer version legitimately differs from every pin. */
function newestPinnedBlendSlug(allPackages) {
    const blends = allPackages.filter((p) => p.name === BLEND_PKG)
    if (!blends.length) return null
    const rank = (v) => v.split(/[.-]/).map((x) => (/^\d+$/.test(x) ? String(x).padStart(6, '0') : x)).join('.')
    blends.sort((a, b) => rank(a.version).localeCompare(rank(b.version)))
    const newest = blends[blends.length - 1]
    return slugOf(nameCountHas(allPackages, newest.name) ? `${newest.name}@${newest.version}` : newest.name)
}
const nameCountHas = (all, name) => all.filter((p) => p.name === name).length > 1

/** #203 pre-release gate: resolve the LATEST blend beta and prove the shipped checkout generates
 *  non-empty output that compiles on ReScript 12. Fails on crash / empty output / compile break —
 *  the three ways a "compiles on pinned, breaks on latest" regression shows up. Diff vs the newest
 *  pinned blend baseline is surfaced for review but never fails the gate (a newer version differs). */
function runLatestBlendGate(allPackages) {
    const ver = sh(`npm view ${BLEND_PKG}@beta version`)
    const version = ver.ok ? ver.out.trim().split('\n').pop().trim() : ''
    if (!/^\d+\.\d+\.\d+/.test(version)) {
        console.error(RED(`✗ could not resolve ${BLEND_PKG}@beta version:\n${ver.out.slice(0, 500)}`))
        process.exit(1)
    }
    const pkg = { name: BLEND_PKG, version, flags: ['--webapi'] }
    const label = `${pkg.name}@${version} (latest beta)`
    const slug = slugOf(`${pkg.name}@${version}`)
    const workDir = join(WORK, 'latest-blend')
    const sandbox = join(workDir, 'sandbox')
    mkdirSync(workDir, { recursive: true })
    console.error(DIM(`── ${label} ──`))

    const pinnedSlug = newestPinnedBlendSlug(allPackages)
    const alreadyPinned = allPackages.some((p) => p.name === BLEND_PKG && p.version === version)
    if (alreadyPinned) console.error(DIM(`  (latest beta ${version} is already pinned in packages.json — the benchmark covers it; this gate re-verifies the LATEST regardless)`))

    let res
    try {
        setupSandbox(pkg, slug, sandbox, { freshInstall: true })
        const gen = generate(pkg, sandbox, workDir)
        const generated = readDir(join(sandbox, 'src'))
        const hasRes = [...generated.keys()].some((f) => f.endsWith('.res'))
        const cmp = compile(sandbox, workDir, hasRes)

        const failures = []
        if (gen.exit !== 0) failures.push(`generator exited ${gen.exit} (crash-before-emit — invisible to compile gates)`)
        if (!hasRes || generated.size === 0) failures.push('no output produced')
        if (hasRes && !cmp.ok) failures.push('generated bindings do not compile on ReScript 12')

        // Informational diff vs the newest pinned blend baseline.
        let diff = []
        if (pinnedSlug && existsSync(join(BASELINES, pinnedSlug, 'bindings'))) {
            diff = diffDirs(readDir(join(BASELINES, pinnedSlug, 'bindings')), generated).map(stripAnsi)
        }
        const metrics = {
            resolvedVersion: version, generatorExit: gen.exit, compileOk: cmp.ok, warnings: cmp.warnings,
            files: generated.size, buckets: gen.summary?.components ?? null,
        }
        const verdict = failures.length ? 'FAIL' : 'PASS'
        res = { pkg: label, slug, verdict, reason: failures.join('; '), metrics, diffVsPinned: pinnedSlug, diff, compileErrors: cmp.errors }
        const color = verdict === 'PASS' ? GREEN : RED
        console.error(color(`${verdict === 'PASS' ? '✓' : '✗'} ${label}${res.reason ? ' — ' + res.reason : ''}`))
        if (verdict === 'PASS') console.error(DIM(`  generated ${generated.size} file(s), compiled clean${diff.length ? `; ${diff.filter((d) => !d.startsWith('  ')).length} diff(s) vs pinned ${pinnedSlug}` : ''}`))
    } catch (e) {
        console.error(RED(`✗ ${label} — ${e.message.split('\n')[0]}`))
        res = { pkg: label, slug, verdict: 'FAIL', reason: e.message.split('\n')[0], metrics: null, diff: [] }
    }

    mkdirSync(WORK, { recursive: true })
    writeFileSync(join(WORK, 'latest-blend.json'), JSON.stringify(res, null, 2) + '\n')
    const md = [`## Latest-blend gate: ${res.verdict === 'PASS' ? '✅ PASS' : '❌ FAIL'}`, '', `- Resolved \`${BLEND_PKG}@beta\` → \`${res.metrics?.resolvedVersion || '?'}\``,
        `- Generator exit: ${res.metrics?.generatorExit ?? '—'} · Compiles: ${res.metrics ? (res.metrics.compileOk ? '✅' : '❌') : '—'} · Files: ${res.metrics?.files ?? '—'}`,
        res.reason ? `- **Failure:** ${res.reason}` : '', res.diff?.length ? `- Diff vs pinned \`${res.diffVsPinned}\`: ${res.diff.filter((d) => !d.startsWith('  ')).length} file(s) changed (informational)` : '']
    if (res.compileErrors) md.push('', '```', res.compileErrors, '```')
    writeFileSync(join(WORK, 'latest-blend.md'), md.filter(Boolean).join('\n') + '\n')

    console.error('')
    if (res.verdict === 'FAIL') { console.error(RED(`❌ latest-blend gate FAILED — ${res.reason}`)); process.exit(1) }
    console.error(GREEN(`✅ latest-blend gate PASS — ${BLEND_PKG}@${version} generates + compiles`))
    process.exit(0)
}

// ── main ────────────────────────────────────────────────────────────────────
const allPackages = JSON.parse(readFileSync(join(HERE, 'packages.json'), 'utf-8'))
if (LATEST_BLEND) runLatestBlendGate(allPackages)
// Two pinned versions of the SAME package (blend 0.0.36 stable + the 0.0.37 beta line that
// blend-rescript actually regenerates from) need separate baselines — a duplicated name gets a
// version-qualified slug; single-version packages keep their existing baseline dirs.
const nameCount = new Map()
for (const p of allPackages) nameCount.set(p.name, (nameCount.get(p.name) || 0) + 1)
const slugFor = (p) => slugOf(nameCount.get(p.name) > 1 ? `${p.name}@${p.version}` : p.name)
const packages = allPackages.filter((p) => !ONLY || slugFor(p) === ONLY || slugOf(p.name) === ONLY || p.name === ONLY)
if (!packages.length) {
    console.error(RED(`no package matches --only ${ONLY}`))
    process.exit(1)
}

const results = []
for (const pkg of packages) {
    const slug = slugFor(pkg)
    const label = `${pkg.name}@${pkg.version}`
    const workDir = join(WORK, slug)
    const sandbox = join(workDir, 'sandbox')
    const baseDir = join(BASELINES, slug)
    mkdirSync(workDir, { recursive: true })
    console.error(DIM(`── ${label} ──`))

    let res
    try {
        setupSandbox(pkg, slug, sandbox)
        const gen = generate(pkg, sandbox, workDir)
        const generated = readDir(join(sandbox, 'src')) // snapshot BEFORE compile adds .res.mjs
        const cmp = compile(sandbox, workDir, [...generated.keys()].some((f) => f.endsWith('.res')))
        const metrics = {
            generatorExit: gen.exit,
            compileOk: cmp.ok,
            warnings: cmp.warnings,
            buckets: gen.summary?.components ?? { total: 0, usable: 0, review: 0, broken: 0, loose: 0 },
            functions: gen.summary?.functions ?? 0,
            classes: gen.summary?.classes ?? 0,
            files: generated.size,
        }

        if (UPDATE) {
            // LOUD degradation warning: --update legitimizes whatever it writes, so a
            // compile or bucket regression accepted here silently disappears from the
            // gate. (A blend compile break slipped through exactly this way once.)
            const prev = existsSync(join(baseDir, 'metrics.json')) ? JSON.parse(readFileSync(join(baseDir, 'metrics.json'), 'utf-8')) : null
            if (prev) {
                const regressions = []
                if (prev.compileOk && !cmp.ok) regressions.push('COMPILE BROKE')
                if (gen.summary && prev.buckets && gen.summary.components.usable < prev.buckets.usable) regressions.push(`usable ${prev.buckets.usable} -> ${gen.summary.components.usable}`)
                if (gen.summary && prev.buckets && gen.summary.components.broken > prev.buckets.broken) regressions.push(`broken ${prev.buckets.broken} -> ${gen.summary.components.broken}`)
                if (regressions.length) console.error(RED(`!! ${label} — BASELINE DEGRADED by this update: ${regressions.join(', ')} — are you sure?`))
            }
            rmSync(join(baseDir, 'bindings'), { recursive: true, force: true })
            mkdirSync(join(baseDir, 'bindings'), { recursive: true })
            for (const [fn, content] of generated) writeFileSync(join(baseDir, 'bindings', fn), content)
            writeFileSync(join(baseDir, 'metrics.json'), JSON.stringify(metrics, null, 2) + '\n')
            cpSync(join(sandbox, 'package-lock.json'), join(baseDir, 'package-lock.json'))
            console.error(GREEN(`↻ ${label} — baseline written (${generated.size} file(s), compile ${cmp.ok ? 'ok' : 'FAILED'})`))
            res = { pkg: label, slug, verdict: 'UPDATED', reason: '', metrics, baseline: null, diff: [] }
        } else {
            const baseline = existsSync(join(baseDir, 'metrics.json')) ? JSON.parse(readFileSync(join(baseDir, 'metrics.json'), 'utf-8')) : null
            const diffProblems = baseline ? diffDirs(readDir(join(baseDir, 'bindings')), generated) : []
            const { verdict, reason } = verdictFor(metrics, baseline, diffProblems)
            const color = verdict === 'PASS' ? GREEN : verdict === 'WARN' ? YELLOW : RED
            console.error(color(`${verdict === 'PASS' ? '✓' : verdict === 'WARN' ? '⚠' : '✗'} ${label}${reason ? ' — ' + reason : ''}`))
            res = { pkg: label, slug, verdict, reason, metrics, baseline, diff: diffProblems.map(stripAnsi), compileErrors: cmp.errors }
        }
    } catch (e) {
        console.error(RED(`✗ ${label} — ${e.message.split('\n')[0]}`))
        res = { pkg: label, slug, verdict: 'FAIL', reason: e.message.split('\n')[0], metrics: null, baseline: null, diff: [] }
    }
    results.push(res)
}

// ── results.json + results.md ───────────────────────────────────────────────
const failed = results.filter((r) => r.verdict === 'FAIL')
const warned = results.filter((r) => r.verdict === 'WARN')
const overall = UPDATE ? 'UPDATED' : failed.length ? 'FAIL' : warned.length ? 'WARN' : 'PASS'

mkdirSync(WORK, { recursive: true })
writeFileSync(join(WORK, 'results.json'), JSON.stringify({ overall, results }, null, 2) + '\n')

const icon = { PASS: '✅', WARN: '⚠️', FAIL: '❌', UPDATED: '↻' }
const span = (b, m) => (b === undefined || b === m ? String(m) : `${b}→${m}`)
const M = []
M.push(`## Benchmark: ${icon[overall]} ${overall}`)
M.push('')
M.push('| Package | Compile | Diff vs baseline | usable | review | broken | Verdict |')
M.push('|---|---|---|---|---|---|---|')
for (const r of results) {
    const m = r.metrics, b = r.baseline
    if (!m) { M.push(`| ${r.pkg} | — | — | — | — | — | ❌ FAIL — ${r.reason} |`); continue }
    const diffCell = r.verdict === 'UPDATED' ? 'baseline rewritten' : r.diff.length ? `${r.diff.filter((d) => !d.startsWith('  ')).length} problem(s)` : 'identical'
    M.push(`| ${r.pkg} | ${m.compileOk ? '✅' : '❌'}${m.warnings ? ` (${m.warnings}⚠)` : ''} | ${diffCell} | ${span(b?.buckets.usable, m.buckets.usable)} | ${span(b?.buckets.review, m.buckets.review)} | ${span(b?.buckets.broken, m.buckets.broken)} | ${icon[r.verdict]} ${r.verdict}${r.reason ? ' — ' + r.reason : ''} |`)
}
for (const r of results) {
    if (!r.diff?.length && !r.compileErrors) continue
    M.push('', `<details><summary>${r.pkg} — details</summary>`, '')
    if (r.compileErrors) M.push('```', r.compileErrors, '```')
    if (r.diff?.length) M.push('```diff', ...r.diff.slice(0, 120).map((d) => d.replace(/^ {2}([-+]) /, '$1 ')), '```')
    M.push('', '</details>')
}
if (warned.length) M.push('', '> ⚠️ WARN = output changed but compiles with equal-or-better quality. If intentional, run `npm run bench:update` and commit the baseline diff in this PR.')
writeFileSync(join(WORK, 'results.md'), M.join('\n') + '\n')

console.error('')
if (UPDATE) { console.error(GREEN(`↻ baselines written for ${results.length} package(s).`)); process.exit(0) }
if (overall === 'FAIL') { console.error(RED(`❌ benchmark FAILED — ${failed.length} package(s): ${failed.map((r) => r.pkg).join(', ')}`)); process.exit(1) }
if (overall === 'WARN') { console.error(YELLOW(`⚠ benchmark passed with ${warned.length} WARN(s) — see benchmark/.work/results.md`)); process.exit(0) }
console.error(GREEN(`✅ benchmark PASS — all ${results.length} package(s) identical to baseline`))
