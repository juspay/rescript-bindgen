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
import { emit, report, planSharedModules, emitSharedModule, makeResolveRef } from './emit.mjs'
import { resolveInput } from './resolve.mjs'
import { writeReport } from './report.mjs'
import { writeFileSync, mkdirSync, existsSync, readFileSync } from 'fs'
import { join, resolve as pathResolve, basename, dirname } from 'path'
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
    let units // [{ name, ir }]
    let skipped = []
    let shared = null // module-level shared-type registry (multi-component runs only)
    if (single) {
        const ir = extractComponent(entry, { from, webapi })
        units = [{ name: ir.import.name, ir }]
    } else {
        const res = extractModule(entry, { from, webapi })
        units = res.components
        skipped = res.skipped
        shared = res.shared
        if (opts.only) units = units.filter((u) => u.name === opts.only)
    }

    if (!units.length) {
        console.error('[bindgen] No React components found to generate.')
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

    // Write the shared `*Types.res` modules once.
    if (plan) {
        for (const [mod, entries] of plan.byModule) {
            writeFileSync(join(typesDir, `${mod}.res`), emitSharedModule(mod, entries, plan.finalOf))
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
        rows.push({ name, props: ir.props.length, enums: ir.enums.length, loose: rep.loose.length, defects: rep.defects.length, review: rep.review.length })
        if (rep.loose.length || rep.defects.length || rep.review.length) reports.push({ name, ...rep })
    }

    console.error(`\n[bindgen] wrote ${units.length} binding(s) to ${outDir}`)
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
        writeReport(reportPath, opts.pkg || from, rows, reports, depSummary, sharedInfo)
        console.error(`[bindgen] 📄 report written to ${reportPath}`)
    } else {
        console.error(`[bindgen] (add --report to also write _REPORT.md)`)
    }
}

main().catch((e) => { console.error('[bindgen] error: ' + e.message); process.exit(1) })
