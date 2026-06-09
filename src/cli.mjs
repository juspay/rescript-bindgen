#!/usr/bin/env node
// ============================================================================
// cli.mjs — the `rescript-bindgen` command. Orchestrates the whole pipeline:
//   resolve (find the .d.ts) -> extract (TS -> IR) -> emit (IR -> ReScript)
//   -> write .res files (+ optional _REPORT.md with --report).
// This file is thin: it parses args and wires the four src/ modules together.
//
//   rescript-bindgen --pkg <name[@ver]>   [--out dir] [--report] [--from name]
//   rescript-bindgen --file <path.d.ts>   [--out dir] [--stdout]
//   rescript-bindgen --dir  <folder>      [--out dir]
//
// Examples:
//   rescript-bindgen --pkg @mui/material --out generated --report
//   rescript-bindgen --pkg react-day-picker
//   rescript-bindgen --file ./types/Button.d.ts --stdout
// ============================================================================

import { extractComponent, extractModule } from './extract.mjs'
import { emit, emitFunction, emitClass, report, planSharedModules, emitSharedModule, makeResolveRef } from './emit.mjs'
import { resolveInput } from './resolve.mjs'
import { writeReport } from './report.mjs'
import { writeFileSync, mkdirSync, existsSync, readFileSync, readdirSync, unlinkSync } from 'fs'
import { join, resolve as pathResolve, basename, dirname, relative } from 'path'
import { createInterface } from 'readline'

/**
 * Walk up from `startDir` to find the nearest package.json and return its
 * combined dependency names (deps + devDeps). Empty set if none found.
 * @param {string} startDir
 * @returns {Set<string>}
 */
function detectDeps(startDir) {
    let dir = pathResolve(startDir)
    for (let i = 0; i < 6; i++) {
        const pj = join(dir, 'package.json')
        if (existsSync(pj)) {
            try {
                const j = JSON.parse(readFileSync(pj, 'utf-8'))
                return new Set([...Object.keys(j.dependencies || {}), ...Object.keys(j.devDependencies || {})])
            } catch { /* ignore */ }
        }
        const up = dirname(dir)
        if (up === dir) break
        dir = up
    }
    return new Set()
}

/**
 * Walk an IR type tree and collect the `text` of every `opaque` node that is a
 * Web type gated on rescript-webapi (`File`/`FileList`). These are the props that
 * WOULD be typed precisely if the project depended on rescript-webapi.
 * @param {object} t  an IR type node
 * @param {Set<string>} out  accumulator of names seen (e.g. "File")
 */
function collectWebapiFallbacks(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'opaque' && (t.text === 'File' || t.text === 'FileList')) out.add(t.text)
    for (const k of ['of', 'ret', 'arg']) if (t[k]) collectWebapiFallbacks(t[k], out)
    if (Array.isArray(t.params)) for (const p of t.params) collectWebapiFallbacks(p, out)
}

/**
 * Derive the ReScript module name for the bundled function-bindings file from the
 * `@module` name: strip an npm scope, split on non-alphanumerics, PascalCase, suffix
 * `Bindings`. `hono` -> `HonoBindings`, `@scope/date-fns` -> `DateFnsBindings`.
 * @param {string} from
 * @returns {string}
 */
function bindingsModuleName(from) {
    const base = String(from).replace(/^@[^/]+\//, '').split(/[^a-zA-Z0-9]+/).filter(Boolean)
    const pascal = base.map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join('')
    return (pascal || 'Module') + 'Bindings'
}

/** Ask a yes/no question on the terminal; resolves to boolean. Non-TTY -> defaultVal. */
function confirm(question, defaultVal) {
    if (!process.stdin.isTTY) return Promise.resolve(defaultVal)
    const rl = createInterface({ input: process.stdin, output: process.stderr })
    return new Promise((res) => rl.question(question, (a) => {
        rl.close()
        const t = a.trim().toLowerCase()
        res(t === '' ? defaultVal : t === 'y' || t === 'yes')
    }))
}

/**
 * Parse `process.argv` flags into an options object.
 * @param {string[]} argv  args after `node cli.mjs`
 * @returns {{out:string, install:boolean, report:boolean, pkg?:string, file?:string, dir?:string, from?:string, only?:string, stdout?:boolean, nm?:string, project?:string, webapi?:boolean, yes?:boolean, help?:boolean}}
 */
function parseArgs(argv) {
    const o = { out: 'generated', install: true, report: false }
    for (let i = 0; i < argv.length; i++) {
        const a = argv[i]
        if (a === '--pkg' || a === '-p') o.pkg = argv[++i]
        else if (a === '--file' || a === '-f') o.file = argv[++i]
        else if (a === '--dir' || a === '-d') o.dir = argv[++i]
        else if (a === '--out' || a === '-o') o.out = argv[++i]
        else if (a === '--from') o.from = argv[++i]
        else if (a === '--only') o.only = argv[++i]
        else if (a === '--no-install') o.install = false
        else if (a === '--report') o.report = true
        else if (a === '--stdout') o.stdout = true
        else if (a === '--node-modules') o.nm = argv[++i]
        else if (a === '--project') o.project = argv[++i]
        else if (a === '--types-dir') o.typesDir = argv[++i]
        else if (a === '--webapi') o.webapi = true
        else if (a === '--no-webapi') o.webapi = false
        else if (a === '--yes' || a === '-y') o.yes = true
        else if (a === '--clean') o.clean = true
        else if (a === '--help' || a === '-h') o.help = true
    }
    return o
}

const HELP = `rescript-bindgen — TypeScript -> ReScript binding generator

Usage:
  rescript-bindgen --pkg <name[@ver]> [--out dir] [--from name] [--only Comp]
  rescript-bindgen --file <path.d.ts>  [--out dir] [--stdout]
  rescript-bindgen --dir  <folder>     [--out dir]

Options:
  --pkg, -p     npm package to bind (installed into a scratch cache if absent)
  --file, -f    a single .d.ts file (one component)
  --dir, -d     a folder containing an index.d.ts
  --out, -o     output directory (default: ./generated)
  --from        @module import name to emit (default: inferred from pkg/file)
  --only        only emit the component with this export name
  --stdout      print to stdout instead of writing files (single component)
  --report      ALSO write _REPORT.md to --out (ready / loose / review / defects)
  --no-install  do not auto-install a missing --pkg
  --node-modules <dir>  extra node_modules root to resolve --pkg from
  --project <dir>  target ReScript project whose package.json gates optional
                   deps (default: inferred from --out, then cwd)
  --webapi       force-emit rescript-webapi types (File -> Webapi.File.t)
  --no-webapi    never emit rescript-webapi types (File props stay flagged)
  --yes, -y      assume "yes" to dependency prompts (non-interactive)
  --clean        remove existing *.res / *.resi / _REPORT.md in --out before
                 generating (avoids stale "orphan" files from a previous run or a
                 different generator). Use only when --out is entirely generated.

Each run writes a .bindgen-manifest.json in --out listing the files it generated.
The next run automatically removes only those previously-generated files it no longer
produces — hand-written files (never in the manifest) are always left untouched.

Add --report to also generate _REPORT.md alongside the bindings: a checklist of
which components are ready, which props were loosely typed, and which need review.

Optional ReScript deps (e.g. rescript-webapi for File/FileList) are auto-detected
from the target project's package.json. If a needed dep is missing, bindgen asks
whether to generate without it (those props fall back to a flagged string) — use
--webapi/--no-webapi to decide non-interactively.
`

/**
 * Entry point. Resolves the input, extracts each component, emits ReScript,
 * writes the `.res` files, and (with `--report`) writes `_REPORT.md`.
 * @returns {Promise<void>}
 */
async function main() {
    const opts = parseArgs(process.argv.slice(2))
    if (opts.help || (!opts.pkg && !opts.file && !opts.dir)) {
        process.stdout.write(HELP)
        process.exit(opts.help ? 0 : 1)
    }

    const roots = []
    if (opts.nm) roots.push(pathResolve(opts.nm))
    roots.push(pathResolve('node_modules'))

    const { entry, from: resolvedFrom, untyped } = resolveInput({
        file: opts.file, dir: opts.dir, pkg: opts.pkg,
        install: opts.install, nodeModulesRoots: roots,
    })
    const from = opts.from || resolvedFrom || basename(entry).replace(/\.d\.ts$/, '')
    console.error(`[bindgen] entry: ${entry}`)
    console.error(`[bindgen] @module("${from}")`)
    if (untyped) console.error('[bindgen] note: using @types/* — package shipped no own types')

    // ── Dependency-aware generation ────────────────────────────────────────────
    // Optional ReScript deps (rescript-webapi) gate some precise types. Detect what
    // the TARGET project depends on (from --project, else the --out project root,
    // else cwd) and decide whether to emit those types or fall back + flag.
    const projectDir = opts.project ? pathResolve(opts.project) : pathResolve(opts.out)
    const deps = detectDeps(projectDir)
    const hasWebapi = deps.has('rescript-webapi')
    // Explicit --webapi/--no-webapi wins; otherwise follow what's installed.
    let webapi = opts.webapi != null ? opts.webapi : hasWebapi
    if (opts.webapi === true && !hasWebapi) {
        console.error('[bindgen] ⚠ --webapi set but rescript-webapi not found in the target project — emitted Webapi.* types may not compile until you install it.')
    }

    // --file => single component; --pkg/--dir => whole module (many components)
    const single = !!opts.file
    let units // [{ name, ir }]  — React components
    let functions = [] // [{ name, ir }] — standalone function/const-fn exports (generic TS)
    let classes = []   // [{ name, ir }] — class exports -> `@new`/`@send`/`@get` modules
    let skipped = []
    let shared = null // module-level shared-type registry (multi-component runs only)
    if (single) {
        const ir = extractComponent(entry, { from, webapi })
        units = [{ name: ir.import.name, ir }]
    } else {
        const res = extractModule(entry, { from, webapi })
        units = res.components
        functions = res.functions || []
        classes = res.classes || []
        skipped = res.skipped
        shared = res.shared
        if (opts.only) {
            units = units.filter((u) => u.name === opts.only)
            functions = functions.filter((f) => f.name === opts.only)
            classes = classes.filter((c) => c.name === opts.only)
        }
    }

    if (!units.length && !functions.length && !classes.length) {
        console.error('[bindgen] No React components, functions, or classes found to generate.')
        if (skipped.length) console.error('[bindgen] skipped: ' + skipped.slice(0, 20).map((s) => `${s.name}(${s.reason})`).join(', '))
        process.exit(1)
    }

    // How many props fell back because rescript-webapi is absent? (File/FileList)
    const fileFallback = new Set()
    let fileFallbackProps = 0
    if (!webapi) {
        for (const { ir } of units) for (const p of ir.props) {
            const before = fileFallback.size
            collectWebapiFallbacks(p.type, fileFallback)
            if (fileFallback.size > before || (p.type && p.type.kind === 'opaque' && (p.type.text === 'File' || p.type.text === 'FileList'))) fileFallbackProps++
        }
    }

    // If webapi is off only because it isn't installed (not an explicit --no-webapi),
    // and real props need it, ask whether to generate without it or abort to install.
    if (fileFallbackProps && opts.webapi == null) {
        const list = [...fileFallback].join('/')
        if (process.stdin.isTTY && !opts.yes) {
            const ok = await confirm(
                `\n⚠ rescript-webapi is not installed, but ${fileFallbackProps} prop(s) use ${list}.\n` +
                `  Generate without it? Those props fall back to a flagged \`string\` placeholder. [Y/n] `, true)
            if (!ok) {
                console.error('[bindgen] aborted — run `npm i rescript-webapi` in the target project, then re-run (or pass --webapi).')
                process.exit(1)
            }
        } else {
            console.error(`[bindgen] note: rescript-webapi not installed; ${fileFallbackProps} ${list} prop(s) flagged as \`string\`. Install it + re-run (or pass --webapi) to type them.`)
        }
    }

    // Dependency summary — what's required (always emitted) vs optional (gated).
    const depSummary = {
        required: [{ pkg: '@rescript/react + stdlib', provides: 'JsxDOM, Dom, React, ReactEvent', present: true }],
        optional: [{ pkg: 'rescript-webapi', provides: 'File, FileList', present: hasWebapi, used: webapi, propCount: fileFallbackProps }],
    }

    // Module mode: plan per-domain type modules (SCC-merged). Component files then
    // reference types qualified (e.g. `MenuTypes.menuItemType`) instead of redeclaring.
    const plan = shared ? planSharedModules(shared) : null
    const compRef = plan ? { resolveRef: makeResolveRef(plan.finalOf, null) } : {}

    if (opts.stdout && units.length === 1) {
        process.stdout.write(emit(units[0].ir, compRef))
        return
    }

    const outDir = pathResolve(opts.out)
    if (!existsSync(outDir)) mkdirSync(outDir, { recursive: true })
    const typesDir = opts.typesDir ? join(outDir, opts.typesDir) : outDir
    if (plan && !existsSync(typesDir)) mkdirSync(typesDir, { recursive: true })

    // --clean: remove prior generated artifacts so a stale file from a previous run (or a
    // different generator) can't linger and shadow/duplicate the fresh output. Only touches
    // `.res`/`.resi`/`_REPORT.md` in the output dir(s) — never .gitignore, configs, or JS.
    if (opts.clean) {
        let removed = 0
        for (const dir of new Set([outDir, typesDir])) {
            for (const f of readdirSync(dir)) {
                if (/\.resi?$/.test(f) || f === '_REPORT.md') { try { unlinkSync(join(dir, f)); removed++ } catch { /* ignore */ } }
            }
        }
        console.error(`[bindgen] --clean: removed ${removed} prior file(s) from ${outDir}`)
    }

    // Every `.res` this run writes, relative to outDir — recorded in a manifest so the
    // NEXT run can delete only the files WE previously generated (never hand-written ones).
    const written = new Set()

    // Write the shared `*Types.res` modules once.
    if (plan) {
        for (const [mod, entries] of plan.byModule) {
            const p = join(typesDir, `${mod}.res`)
            writeFileSync(p, emitSharedModule(mod, entries, plan.finalOf))
            written.add(relative(outDir, p))
        }
        console.error(`[bindgen] wrote ${plan.byModule.size} shared type module(s) (${shared.entries.length} unique types) to ${typesDir}`)
    }

    let totalDefects = 0
    const rows = []      // counts per component
    const reports = []   // per-prop detail, for --report
    for (const { name, ir } of units) {
        const code = emit(ir, compRef)
        const rep = report(ir)
        totalDefects += rep.defects.length
        writeFileSync(join(outDir, `${name}.res`), code)
        written.add(`${name}.res`)
        rows.push({ name, props: ir.props.length, enums: ir.enums.length, loose: rep.loose.length, defects: rep.defects.length, review: rep.review.length })
        if (rep.loose.length || rep.defects.length || rep.review.length) reports.push({ name, ...rep })
    }

    // Standalone function exports (generic TS): all `@module external` bindings for a
    // package go into ONE `<Pkg>Bindings.res` file, referencing the shared `*Types.res`
    // qualified via the same resolveRef the component files use.
    const fnFile = functions.length ? `${bindingsModuleName(from)}.res` : null
    if (fnFile) {
        const body = functions.map(({ ir }) => emitFunction(ir, compRef)).join('\n')
        writeFileSync(join(outDir, fnFile), body + '\n')
        written.add(fnFile)
        console.error(`[bindgen] wrote ${functions.length} function binding(s) to ${fnFile}`)
    }

    // Class exports: one `<ClassName>.res` module per class (the file IS the module, so
    // cross-class `Other.t` references resolve across files with no ordering concerns).
    for (const { name, ir } of classes) {
        writeFileSync(join(outDir, `${name}.res`), emitClass(ir, compRef) + '\n')
        written.add(`${name}.res`)
    }
    if (classes.length) console.error(`[bindgen] wrote ${classes.length} class module(s): ${classes.map((c) => `${c.name}.res`).join(', ')}`)

    // Manifest-based orphan cleanup: remove files a PREVIOUS bindgen run wrote that this run
    // no longer produces (e.g. a component renamed/dropped upstream). Only ever touches files
    // recorded in our own manifest — hand-written files are never listed, so never deleted.
    const manifestPath = join(outDir, '.bindgen-manifest.json')
    let staleRemoved = 0
    if (existsSync(manifestPath)) {
        try {
            const prior = JSON.parse(readFileSync(manifestPath, 'utf-8')).files || []
            for (const rel of prior) {
                if (!written.has(rel)) {
                    const p = join(outDir, rel)
                    if (existsSync(p)) { try { unlinkSync(p); staleRemoved++ } catch { /* ignore */ } }
                }
            }
        } catch { /* corrupt manifest — ignore, it'll be overwritten */ }
    }
    writeFileSync(manifestPath, JSON.stringify({ files: [...written].sort() }, null, 2) + '\n')
    if (staleRemoved) console.error(`[bindgen] removed ${staleRemoved} stale binding(s) from a previous run (per .bindgen-manifest.json)`)

    console.error(`\n[bindgen] wrote ${units.length} component + ${functions.length} function + ${classes.length} class binding(s) to ${outDir}`)
    for (const r of rows) console.error(`  ${r.name.padEnd(24)} props=${String(r.props).padStart(3)} enums=${String(r.enums).padStart(2)} loose=${String(r.loose).padStart(2)} review=${r.review} defects=${r.defects}`)
    if (skipped.length) console.error(`\n[bindgen] skipped ${skipped.length} non-component export(s): ${skipped.slice(0, 15).map((s) => s.name).join(', ')}${skipped.length > 15 ? '…' : ''}`)
    if (totalDefects) console.error(`\n[bindgen] ⚠ ${totalDefects} unknown/any prop(s) flagged as defects — review.`)

    // Dependencies
    console.error(`\n[bindgen] dependencies:`)
    for (const d of depSummary.required) console.error(`  required  ${d.pkg.padEnd(24)} ${d.present ? '✓ present' : '✗ MISSING'}  (${d.provides})`)
    for (const d of depSummary.optional) {
        const status = d.present ? (d.used ? '✓ present → used' : '✓ present') : `✗ not installed${d.propCount ? ` → ${d.propCount} prop(s) flagged` : ''}`
        console.error(`  optional  ${d.pkg.padEnd(24)} ${status}  (${d.provides})`)
    }

    if (opts.report) {
        const reportPath = join(outDir, '_REPORT.md')
        const sharedInfo = plan ? { modules: plan.byModule.size, types: shared.entries.length } : null
        const fnInfo = fnFile ? { file: fnFile, names: functions.map((f) => f.name) } : null
        const classInfo = classes.length ? classes.map((c) => ({ name: c.name, methods: c.ir.methods.length, getters: c.ir.getters.length, ctor: !!c.ir.ctor })) : null
        writeReport(reportPath, opts.pkg || from, rows, reports, depSummary, sharedInfo, fnInfo, classInfo)
        console.error(`[bindgen] 📄 report written to ${reportPath}`)
    } else {
        console.error(`[bindgen] (add --report to also write _REPORT.md)`)
    }
}

main().catch((e) => { console.error('[bindgen] error: ' + e.message); process.exit(1) })
