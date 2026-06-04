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
import { emit, report } from './emit.mjs'
import { resolveInput } from './resolve.mjs'
import { writeReport } from './report.mjs'
import { writeFileSync, mkdirSync, existsSync } from 'fs'
import { join, resolve as pathResolve, basename } from 'path'

/**
 * Parse `process.argv` flags into an options object.
 * @param {string[]} argv  args after `node cli.mjs`
 * @returns {{out:string, install:boolean, report:boolean, pkg?:string, file?:string, dir?:string, from?:string, only?:string, stdout?:boolean, nm?:string, help?:boolean}}
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

Add --report to also generate _REPORT.md alongside the bindings: a checklist of
which components are ready, which props were loosely typed, and which need review.
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

    // --file => single component; --pkg/--dir => whole module (many components)
    const single = !!opts.file
    let units // [{ name, ir }]
    let skipped = []
    if (single) {
        const ir = extractComponent(entry, { from })
        units = [{ name: ir.import.name, ir }]
    } else {
        const res = extractModule(entry, { from })
        units = res.components
        skipped = res.skipped
        if (opts.only) units = units.filter((u) => u.name === opts.only)
    }

    if (!units.length) {
        console.error('[bindgen] No React components found to generate.')
        if (skipped.length) console.error('[bindgen] skipped: ' + skipped.slice(0, 20).map((s) => `${s.name}(${s.reason})`).join(', '))
        process.exit(1)
    }

    if (opts.stdout && units.length === 1) {
        process.stdout.write(emit(units[0].ir))
        return
    }

    const outDir = pathResolve(opts.out)
    if (!existsSync(outDir)) mkdirSync(outDir, { recursive: true })

    let totalDefects = 0
    const rows = []      // counts per component
    const reports = []   // per-prop detail, for --report
    for (const { name, ir } of units) {
        const code = emit(ir)
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

    if (opts.report) {
        const reportPath = join(outDir, '_REPORT.md')
        writeReport(reportPath, opts.pkg || from, rows, reports)
        console.error(`[bindgen] 📄 report written to ${reportPath}`)
    } else {
        console.error(`[bindgen] (add --report to also write _REPORT.md)`)
    }
}

main().catch((e) => { console.error('[bindgen] error: ' + e.message); process.exit(1) })
