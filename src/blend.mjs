#!/usr/bin/env node
// blend.mjs — generate ReScript bindings for @juspay/blend-design-system at a
// specific version, by INSTALLING that version from npm first (source of truth).
//
//   node src/blend.mjs --version 0.0.36            # stable
//   node src/blend.mjs --version latest            # latest published
//   node src/blend.mjs --version 0.0.37-beta.2     # beta
//   node src/blend.mjs --version "https://pkg.pr.new/@juspay/blend-design-system@<sha>"  # PR preview
//   node src/blend.mjs --version 0.0.36 --only Button --stdout
//   node src/blend.mjs --version 0.0.36 --out generated --compile

import { extractComponent } from './extract.mjs'
import { emit, report } from './emit.mjs'
import {
    existsSync, mkdirSync, writeFileSync, readdirSync, readFileSync, rmSync, cpSync,
} from 'fs'
import { join, resolve as pathResolve } from 'path'
import { execSync } from 'child_process'

const PKG = '@juspay/blend-design-system'
const CACHE = pathResolve(new URL('../.bindgen-cache', import.meta.url).pathname)

function parseArgs(argv) {
    const o = { out: 'generated' }
    for (let i = 0; i < argv.length; i++) {
        const a = argv[i]
        if (a === '--out' || a === '-o') o.out = argv[++i]
        else if (a === '--only') o.only = argv[++i]
        else if (a === '--stdout') o.stdout = true
        else if (a === '--compile') o.compile = true
        else if (a === '--help' || a === '-h') o.help = true
        else if (a === '--version' || a === '-v') o.spec = `${PKG}@${argv[++i]}` // back-compat: --version -> full spec
        else if (!a.startsWith('-')) o.spec = a // positional: full package spec
    }
    if (!o.spec) o.spec = PKG // default: latest
    return o
}

const HELP = `gen:blend — bindings for @juspay/blend-design-system

Usage:
  npm run gen:blend -- <package-spec> [--out dir] [--only Comp] [--compile] [--stdout]

The <package-spec> is the full npm spec you'd give to "npm install":
  npm run gen:blend -- @juspay/blend-design-system@0.0.37-beta.4
  npm run gen:blend -- @juspay/blend-design-system@latest --compile
  npm run gen:blend -- @juspay/blend-design-system@0.0.36 --only Button --stdout
  npm run gen:blend -- "https://pkg.pr.new/@juspay/blend-design-system@<sha>"
`

// Derive the package NAME (without version) from a full spec, for locating the install.
function specName(spec) {
    if (spec.startsWith('http')) return PKG // pkg.pr.new URL -> still the blend package
    const at = spec.lastIndexOf('@')
    return at > 0 ? spec.slice(0, at) : spec // at===0 is the scope '@', meaning no version given
}

// Install the requested spec into the scratch cache and return its dist path.
function installBlend(spec) {
    mkdirSync(CACHE, { recursive: true })
    if (!existsSync(join(CACHE, 'package.json')))
        writeFileSync(join(CACHE, 'package.json'), JSON.stringify({ name: 'bindgen-scratch', private: true }) + '\n')
    const name = specName(spec)
    console.error(`[blend] installing ${spec} …`)
    execSync(`npm install --no-save --silent ${spec}`, { cwd: CACHE, stdio: 'inherit' })
    const pkgDir = join(CACHE, 'node_modules', ...name.split('/'))
    if (!existsSync(pkgDir)) throw new Error(`Install did not produce ${pkgDir}`)
    const installed = JSON.parse(readFileSync(join(pkgDir, 'package.json'), 'utf-8')).version
    const compDir = join(pkgDir, 'dist', 'components')
    if (!existsSync(compDir)) throw new Error(`No dist/components in installed package (${pkgDir})`)
    return { compDir, installed }
}

// Write the report: a checklist of components (✅ done / 🛑 broken), with detail
// ONLY for components that have defect props (things that won't work as typed).
// Loose (string-fallback) props still WORK, so they are not treated as broken —
// just noted as a count next to the component.
function writeReport(path, version, okRows, reports) {
    const detailByName = new Map(reports.map((r) => [r.name, r]))
    const broken = okRows.filter((r) => r.defects > 0).map((r) => r.name)
    const needsReview = okRows.filter((r) => r.defects === 0 && r.review > 0).map((r) => r.name)
    const clean = okRows.filter((r) => r.defects === 0 && r.review === 0)

    const L = []
    L.push(`# Binding report — \`@juspay/blend-design-system@${version}\``)
    L.push(``)
    L.push(`- **${okRows.length}** components generated`)
    L.push(`- **${clean.length}** ✅ ready to use (no broken props, no review needed)`)
    L.push(`- **${needsReview.length}** 🔍 need human review (a multi-type prop couldn't be auto-bound)`)
    L.push(`- **${broken.length}** 🛑 have broken props that WON'T WORK${broken.length ? `: ${broken.join(', ')}` : ''}`)
    L.push(``)

    // ── Checklist ──────────────────────────────────────────────
    L.push(`## Components`)
    L.push(``)
    L.push(`\`[x]\` ready · \`[~]\` needs review · \`[ ]\` broken · "(n loose)" = n props widened to \`string\` but still usable`)
    L.push(``)
    for (const r of okRows.slice().sort((a, b) => a.name.localeCompare(b.name))) {
        const looseNote = r.loose ? `  _(${r.loose} loose)_` : ''
        if (r.defects > 0) L.push(`- [ ] **${r.name}** — 🛑 ${r.defects} broken${r.review ? `, 🔍 ${r.review} review` : ''}${looseNote}`)
        else if (r.review > 0) L.push(`- [~] **${r.name}** — 🔍 ${r.review} to review${looseNote}`)
        else L.push(`- [x] ${r.name}${looseNote}`)
    }
    L.push(``)

    // ── 🛑 Broken ──────────────────────────────────────────────
    if (broken.length) {
        L.push(`## 🛑 Broken props (won't work as typed)`)
        L.push(``)
        L.push(`Resolved to \`unknown\`/\`any\` (usually a generic \`T\`). Emitted as a placeholder so the component compiles, but **these props will not work** — fix concretely in blend, or add generic support.`)
        L.push(``)
        for (const name of broken) {
            const r = detailByName.get(name)
            if (!r || !r.defects.length) continue
            L.push(`### ${name}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript | Why it won't work |`)
            L.push(`|------|-----------------|-------------------|`)
            for (const d of r.defects) {
                const decl = (d.declText || d.tsType || '').replace(/\|/g, '\\|')
                const why = /\(.*\)\s*=>/.test(d.declText || '')
                    ? "It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing."
                    : "Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly."
                L.push(`| \`${d.prop}\` | \`${decl}\` | ${why} |`)
            }
            L.push(``)
        }
    }

    // ── 🔍 Needs review ────────────────────────────────────────
    if (needsReview.length) {
        L.push(`## 🔍 Needs human review (multi-type, not auto-discriminable)`)
        L.push(``)
        L.push(`These are unions of types we can't tell apart at runtime (e.g. two object shapes), so an \`@unboxed\` variant won't work and we **refuse to use \`%identity\`/unsafe casts**. Emitted as a \`string\` placeholder + an inline \`// ⚠️ REVIEW\` comment. Bind by hand or raise with blend.`)
        L.push(``)
        for (const name of needsReview) {
            const r = detailByName.get(name)
            if (!r || !r.review.length) continue
            L.push(`### ${name}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript |`)
            L.push(`|------|-----------------|`)
            for (const d of r.review) L.push(`| \`${d.prop}\` | \`${(d.declText || d.tsType || '').replace(/\|/g, '\\|')}\` |`)
            L.push(``)
        }
    }

    if (!broken.length && !needsReview.length) {
        L.push(`## 🎉 All clear`)
        L.push(``)
        L.push(`Every prop is bound type-safely (multi-types via \`@unboxed\` variants). Nothing needs fixing.`)
    }
    writeFileSync(path, L.join('\n') + '\n')
}

function main() {
    const opts = parseArgs(process.argv.slice(2))
    if (opts.help) { process.stdout.write(HELP); return }

    const { compDir, installed } = installBlend(opts.spec)
    console.error(`[blend] resolved version: ${installed}`)
    console.error(`[blend] reading: ${compDir}\n`)

    const dirs = readdirSync(compDir, { withFileTypes: true })
        .filter((d) => d.isDirectory())
        .map((d) => d.name)
        .filter((n) => !opts.only || n === opts.only)

    const outDir = pathResolve(opts.out)
    if (!opts.stdout) { if (!existsSync(outDir)) mkdirSync(outDir, { recursive: true }) }

    const rows = []
    const generated = []
    const reports = [] // { name, loose:[], defects:[] }
    for (const name of dirs) {
        const entry = [join(compDir, name, `${name}.d.ts`), join(compDir, name, 'index.d.ts')].find(existsSync)
        if (!entry) { rows.push({ name, status: 'no-dts' }); continue }
        try {
            const ir = extractComponent(entry, { from: PKG, importName: name })
            if (!ir.props.length) { rows.push({ name, status: 'no-props' }); continue }
            const code = emit(ir)
            const rep = report(ir)
            if (opts.stdout) { process.stdout.write(code) }
            else { writeFileSync(join(outDir, `${name}.res`), code); generated.push(name) }
            if (rep.loose.length || rep.defects.length || rep.review.length) reports.push({ name, ...rep })
            rows.push({ name, status: 'ok', props: ir.props.length, enums: ir.enums.length, loose: rep.loose.length, defects: rep.defects.length, review: rep.review.length })
        } catch (e) {
            rows.push({ name, status: 'err', err: e.message.split('\n')[0].slice(0, 50) })
        }
    }

    if (opts.stdout) return

    // Write the report: a checklist of components + detail only for the broken ones.
    writeReport(join(outDir, '_REPORT.md'), installed, rows.filter((r) => r.status === 'ok'), reports)

    const ok = rows.filter((r) => r.status === 'ok')
    console.error(`[blend] generated ${ok.length}/${dirs.length} → ${outDir}\n`)
    for (const r of rows) {
        if (r.status === 'ok') console.error(`  ${r.name.padEnd(22)} props=${String(r.props).padStart(3)} enums=${String(r.enums).padStart(2)} loose=${String(r.loose).padStart(2)} defects=${r.defects}`)
        else console.error(`  ${r.name.padEnd(22)} [${r.status}] ${r.err || ''}`)
    }
    const defects = ok.reduce((a, r) => a + r.defects, 0)
    if (defects) console.error(`\n[blend] ⚠ ${defects} unknown/any prop(s) flagged as upstream type defects.`)
    console.error(`[blend] 📄 report written to ${join(outDir, '_REPORT.md')}`)

    if (opts.compile) {
        const sandboxSrc = pathResolve(new URL('../test/sandbox/src', import.meta.url).pathname)
        console.error(`\n[blend] compile check in sandbox …`)
        rmSync(sandboxSrc, { recursive: true, force: true }); mkdirSync(sandboxSrc, { recursive: true })
        for (const name of generated) cpSync(join(outDir, `${name}.res`), join(sandboxSrc, `${name}.res`))
        try {
            execSync('npx rescript clean && npx rescript build', { cwd: pathResolve(sandboxSrc, '..'), stdio: 'pipe' })
            const n = readdirSync(sandboxSrc).filter((f) => f.endsWith('.res.mjs')).length
            console.error(`[blend] ✅ COMPILE PASS — ${n}/${generated.length} compiled on ReScript 12.`)
        } catch (e) {
            console.error(`[blend] ❌ COMPILE FAIL:\n` + ((e.stdout?.toString() || '') + (e.stderr?.toString() || '')).split('\n').filter((l) => /error|Error|\.res:/.test(l)).slice(0, 20).join('\n'))
            process.exit(1)
        }
    }
}

main()
