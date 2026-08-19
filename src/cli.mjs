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
import { emit, emitFunction, emitClass, emitNamespace, report, planSharedModules, emitSharedModule, makeResolveRef } from './emit.mjs'
import { resolveInput } from './resolve.mjs'
import { writeReport } from './report.mjs'
import { planHtmlAttrs, HTML_ATTRS_PIN } from './html-attrs.mjs'
import { RESCRIPT_RESERVED } from './stdlib-types.mjs'
import { writeFileSync, mkdirSync, existsSync, readFileSync, readdirSync, unlinkSync, renameSync } from 'fs'
import { join, resolve as pathResolve, basename, dirname, relative } from 'path'
import { createInterface } from 'readline'

// The shared `JsFn.res` module (#120): the honest, zero-cost handle for a bare untyped global
// `Function` (no call signature to model). A `.res` file IS its module, so the body is top-level —
// references qualify as `JsFn.t` / `JsFn.fromFn1`. Arity 0–3 covers observed bare-`Function`
// callbacks (Highcharts `complete`/`step`/formatters are 0–2 args); each external is independently
// generalized, so reused `'a`/`'b` names are fine. `from*`/`as*` %identity views satisfy the
// no-unsafe-cast contract (an opaque-module constructor/accessor, the value passes through unchanged).
const JS_FN_SOURCE = `// The bare, untyped JS \`Function\` (#120) — a callable runtime leaf with no typed signature.
// Construct with the arity matching your callback, read back with the matching \`asFnN\`.
// Zero-cost: the function passes through unchanged.
type t
external fromFn0: (unit => 'a) => t = "%identity"
external fromFn1: ('a => 'b) => t = "%identity"
external fromFn2: (('a, 'b) => 'c) => t = "%identity"
external fromFn3: (('a, 'b, 'c) => 'd) => t = "%identity"
external asFn0: t => (unit => 'a) = "%identity"
external asFn1: t => ('a => 'b) = "%identity"
external asFn2: t => (('a, 'b) => 'c) = "%identity"
external asFn3: t => (('a, 'b, 'c) => 'd) = "%identity"
`

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
    // Since #41 the module-mode webapi-off fallback is a WebTypes sink ref, not an
    // opaque — count those too so the "install rescript-webapi?" upsell still fires.
    if (t.kind === 'classRef' && t.home === 'WebTypes' && (t.to === 'file' || t.to === 'fileList')) out.add(t.to === 'file' ? 'File' : 'FileList')
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

/** Read the generated-file list and permanent public-name registry from a previous run. Legacy
 *  manifests (no `schemaVersion`) contain only `files` and stay tolerant — they carry no registry to
 *  lose. A schema-v2 manifest is validated strictly (whole + every row) because it drives permanent
 *  name assignment: unparseable JSON, an unknown schema version, a non-object `publicTypes`, or an
 *  invalid row would otherwise silently reset the registry or emit uncompilable names. Any of those
 *  fails loudly and leaves the bad file in place for diagnosis; delete it to opt into a fresh start. */
function readBindgenManifest(path) {
    if (!existsSync(path)) return { scope: null, files: [], publicTypes: {} }
    let value
    try {
        value = JSON.parse(readFileSync(path, 'utf-8'))
    } catch (e) {
        throw new Error(
            `corrupt .bindgen-manifest.json at ${path}: ${e.message}\n` +
            `This file is the permanent public-name registry; refusing to overwrite it with recomputed ` +
            `names. Restore it from version control, or delete it to regenerate names from scratch.`,
        )
    }
    const isPlainObject = (v) => v != null && typeof v === 'object' && !Array.isArray(v)
    const fail = (msg) => {
        throw new Error(
            `malformed .bindgen-manifest.json at ${path}: ${msg}.\n` +
            `This file is the permanent public-name registry; refusing to overwrite it with recomputed ` +
            `names. Restore it from version control, or delete it to regenerate names from scratch.`,
        )
    }
    // An UNKNOWN schema version is not silently rewritten as v2: a future format may carry semantics
    // we'd corrupt. Absent version = legacy (files-only) manifest, tolerated as a bootstrap below.
    if (value.schemaVersion !== undefined && value.schemaVersion !== 2) {
        fail(`unsupported schemaVersion ${JSON.stringify(value.schemaVersion)} (this bindgen understands schemaVersion 2, or a legacy files-only manifest)`)
    }
    // schemaVersion 2 REQUIRES a plain-object `publicTypes` (a present-but-malformed value is corruption,
    // not a legacy shape — coercing it to `{}` would recompute and overwrite every locked name).
    if (value.schemaVersion === 2 && !isPlainObject(value.publicTypes)) {
        fail(`schemaVersion 2 requires a plain-object "publicTypes" (got ${Array.isArray(value.publicTypes) ? 'array' : value.publicTypes === undefined ? 'missing' : typeof value.publicTypes})`)
    }
    // Validate the registry row-by-row whenever `publicTypes` is PRESENT — not only under schemaVersion 2.
    // The rows are loaded (and drive name/module assignment) below regardless of the version tag, so a
    // manifest that merely lacks `schemaVersion` (a legacy files-only file a user annotated, a foreign
    // writer) must not slip an invalid row (`name: 42`, lower-case `module`) through to uncompilable
    // output. A true legacy manifest has no `publicTypes` at all and skips this entirely. (#190)
    if (isPlainObject(value.publicTypes)) {
        const ident = /^[A-Za-z_][A-Za-z0-9_']*$/ // ReScript type/module identifier (leaf casing checked downstream by kind)
        // A leaf `name` becomes a bare `type <name>` / `module <Name>`, so a ReScript RESERVED word
        // (`type`, `and`, `let`, …) is uncompilable — the generator's own `lower()` suffixes these, but
        // a locked manifest name bypasses that, so reject it here.
        const isReserved = (s) => RESCRIPT_RESERVED.has(s)
        // A home `module` is ALWAYS a single upper-case identifier (it becomes the `.res` FILE name);
        // a dotted value like `Foo.Bar` would write a file literally named `Foo.Bar.res`. So no dots,
        // and the segment must start upper-case (a lower-case module emits `legacytypes.left`).
        const isModuleName = (s) => typeof s === 'string' && /^[A-Z][A-Za-z0-9_']*$/.test(s)
        for (const [id, row] of Object.entries(value.publicTypes)) {
            if (!isPlainObject(row)) fail(`registry row ${JSON.stringify(id)} is not an object`)
            if (typeof row.name !== 'string' || !ident.test(row.name)) fail(`registry row ${JSON.stringify(id)} has an invalid "name" ${JSON.stringify(row.name)} (must be an identifier)`)
            if (typeof row.name === 'string' && isReserved(row.name)) fail(`registry row ${JSON.stringify(id)} has a reserved-word "name" ${JSON.stringify(row.name)}`)
            if (row.module !== undefined && !isModuleName(row.module)) fail(`registry row ${JSON.stringify(id)} has an invalid "module" ${JSON.stringify(row.module)} (must be a single upper-case module name, no dots)`)
            if (row.formerModules !== undefined && (!Array.isArray(row.formerModules) || !row.formerModules.every(isModuleName))) fail(`registry row ${JSON.stringify(id)} has an invalid "formerModules" (must be an array of single upper-case module names)`)
            if (row.aliases !== undefined && (!Array.isArray(row.aliases) || !row.aliases.every((a) => typeof a === 'string' && ident.test(a)))) fail(`registry row ${JSON.stringify(id)} has an invalid "aliases" (must be an array of identifiers)`)
            if (row.kind !== undefined && typeof row.kind !== 'string') fail(`registry row ${JSON.stringify(id)} has a non-string "kind"`)
            if (row.signature !== undefined && typeof row.signature !== 'string') fail(`registry row ${JSON.stringify(id)} has a non-string "signature"`)
            if (row.active !== undefined && typeof row.active !== 'boolean') fail(`registry row ${JSON.stringify(id)} has a non-boolean "active"`)
        }
    }
    return {
        scope: typeof value.scope === 'string' ? value.scope : null,
        files: Array.isArray(value.files) ? value.files.filter((f) => typeof f === 'string') : [],
        publicTypes: isPlainObject(value.publicTypes) ? value.publicTypes : {},
    }
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
        else if (a === '--json-summary') o.jsonSummary = argv[++i]
        else if (a === '--stdout') o.stdout = true
        else if (a === '--node-modules') o.nm = argv[++i]
        else if (a === '--project') o.project = argv[++i]
        else if (a === '--types-dir') o.typesDir = argv[++i]
        else if (a === '--augment') (o.augment || (o.augment = [])).push(...argv[++i].split(',').map((s) => s.trim()).filter(Boolean))
        else if (a === '--webapi') o.webapi = true
        else if (a === '--no-webapi') o.webapi = false
        else if (a === '--no-html-attrs') o.htmlAttrs = false
        else if (a === '--subpaths') o.subpaths = true
        else if (a === '--variant-props') o.variantProps = true
        // #155: `--record-props` is ACCEPTED as a no-op — the record-props form is now the only
        // output form (every component with props gets a nameable `type props`), so any script
        // that adopted the flag during the preview keeps working.
        else if (a === '--record-props') { /* default behaviour since #155 */ }
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
  --json-summary <path>  write a machine-readable run summary (component buckets,
                 file count) as JSON — for CI / benchmark tooling
  --no-install  do not auto-install a missing --pkg
  --subpaths    also bind every exports-map subpath (e.g. @mui/material/styles,
                @radix-ui/react-*), each stamped @module("pkg/sub"); shared types
                are emitted once. Off by default (#147)
  --variant-props  a component whose props are a discriminated union with a clean
                string discriminant (mode: "single" | "multi") binds a @tag variant
                that keeps per-branch requiredness, instead of one all-optional
                signature. Rendered via React.createElement. Off by default (#65)
  --node-modules <dir>  extra node_modules root to resolve --pkg from
  --project <dir>  target ReScript project whose package.json gates optional
                   deps (default: inferred from --out, then cwd)
  --augment <mod>  load a module-AUGMENTATION .d.ts as a program root so its
                 "declare module ... { interface X {...} }" additions merge onto
                 the base interface (e.g. --augment highcharts/modules/xrange
                 adds Point.x2). Repeatable, or comma-separated. Mirrors the app's
                 opt-in "import highcharts/modules/xrange" side-effect.
  --webapi       force-emit rescript-webapi types (File -> Webapi.File.t)
  --no-webapi    never emit rescript-webapi types (File props stay flagged)
  --no-html-attrs  disable the shared HtmlAttrs.res spread for components extending
                 *HTMLAttributes — every attribute is inlined as a labeled arg (legacy)
  --yes, -y      assume "yes" to dependency prompts (non-interactive)
  --clean        remove existing *.res / *.resi / _REPORT.md in --out before
                 generating (avoids stale "orphan" files from a previous run or a
                 different generator). Use only when --out is entirely generated.

Each run writes a .bindgen-manifest.json in --out. It lists generated files AND permanently
assigns public type names to upstream source identities. Keep it with generated bindings:
the next run reuses those exact names, reserves removed names, and removes only stale files
listed there. Hand-written files (never in the manifest) are always left untouched.

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

    // Read this BEFORE extraction: public type-name assignments are inputs to generation, not just
    // an after-the-fact file inventory. Once an upstream source identity owns a name, every future
    // bindgen version must reuse it; inactive rows remain tombstones so newcomers cannot steal it.
    const outDir = pathResolve(opts.out)
    const manifestPath = join(outDir, '.bindgen-manifest.json')
    const priorManifest = readBindgenManifest(manifestPath)

    const roots = []
    if (opts.nm) roots.push(pathResolve(opts.nm))
    roots.push(pathResolve('node_modules'))

    const { entry, from: resolvedFrom, untyped, subEntries } = resolveInput({
        file: opts.file, dir: opts.dir, pkg: opts.pkg,
        install: opts.install, nodeModulesRoots: roots, subpaths: opts.subpaths,
    })
    const from = opts.from || resolvedFrom || basename(entry).replace(/\.d\.ts$/, '')
    // Every registry row's anchor ID is SCOPE-PREFIXED (`scope:<from>|…`), so rows from different
    // `@module` scopes co-exist safely — only the current scope's rows can ever match this run's
    // identities. Pass them all: a foreign-scope row simply never locks, and (crucially) is preserved
    // rather than wiped. A scope change must NEVER destroy another scope's frozen names. (#190)
    const priorPublicTypes = priorManifest.publicTypes
    if (priorManifest.scope != null && priorManifest.scope !== from) {
        console.error(`[bindgen] note: registry also holds @module("${priorManifest.scope}") assignments; @module("${from}") is added alongside them (both preserved).`)
    }
    // #147: one binding-entry per exports subpath, each stamped `@module("<from><suffix>")` — e.g.
    // `@mui/material` for the main entry, `@mui/material/styles` for `"./styles"`. Without --subpaths
    // this is just the single main entry, so behaviour is unchanged.
    const entries = (subEntries || [{ suffix: '', entry }]).map((s) => ({ from: from + s.suffix, entry: s.entry }))
    console.error(`[bindgen] entry: ${entry}`)
    console.error(`[bindgen] @module("${from}")` + (entries.length > 1 ? ` + ${entries.length - 1} subpath(s): ${entries.slice(1).map((e) => e.from).join(', ')}` : ''))
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
    let namespaces = [] // [{ name, members }] — `export * as NS` -> alias modules (#25)
    let skipped = []
    let shared = null // module-level shared-type registry (multi-component runs only)
    if (single) {
        const ir = extractComponent(entry, { from, webapi, augment: opts.augment, variantProps: opts.variantProps })
        units = [{ name: ir.import.name, ir }]
    } else {
        const res = extractModule(entry, {
            from, entries, webapi, htmlAttrs: opts.htmlAttrs, augment: opts.augment,
            variantProps: opts.variantProps, publicTypes: priorPublicTypes,
        })
        units = res.components
        functions = res.functions || []
        classes = res.classes || []
        namespaces = res.namespaces || []
        skipped = res.skipped
        shared = res.shared
        if (opts.only) {
            units = units.filter((u) => u.name === opts.only)
            functions = functions.filter((f) => f.name === opts.only)
            classes = classes.filter((c) => c.name === opts.only)
            // keep only namespaces whose members survive the filter (alias targets must exist)
            namespaces = namespaces
                .map((ns) => ({ ...ns, members: ns.members.filter((m) => units.some((u) => u.name === m.target)) }))
                .filter((ns) => ns.members.length)
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
    // #171: constructor collisions, from the shared modules AND from every single-file emit. Declared
    // before both paths so `--file` renames are reported too — a silent rename is consumer-breaking.
    const collisions = []
    const compRef = plan
        ? { resolveRef: makeResolveRef(plan.finalOf, null, shared.renames, shared.byKey), collisions }
        : { collisions }

    // #171: every exit path that EMITS must report what it renamed — a silent rename is
    // consumer-breaking. Factored into a helper because there are three such paths (`--stdout`, the
    // normal write, and the shared-module write) and the first was missed twice: once by living
    // inside `if (plan)`, once by running before the emitters had populated the collector. Call it
    // after emitting and before returning. Guarded so a second call is a no-op — the data itself must
    // survive, because `--report` renders the same findings into _REPORT.md. (#184 review)
    let collisionsReported = false
    const reportCollisions = () => {
        if (collisionsReported) return
        collisionsReported = true
    // #171: reported for the shared modules AND for every single-file emit. This sits OUTSIDE the
    // `if (plan)` block on purpose — a `--file` run has no plan, and its renames are just as
    // consumer-breaking, so reporting them only for shared modules would have hidden exactly the
    // renames a single-file consumer has to act on. A module can define one constructor name twice;
    // ReScript then binds the LAST definition wherever the expected type isn't known from context.
    // Different RUNTIME REPRESENTATIONS (a bare constant, an identity payload, a `@tag`-injected
    // object) make that a real bug, so those are renamed. Collisions sharing one representation are
    // left alone (renaming would churn consumers for an ambiguity that resolves correctly) but must
    // not pass silently. (#184 review)
    const renamedTotal = collisions.reduce((n, c) => n + c.classA.reduce((m, a) => m + a.renamed.length, 0), 0)
    const sameValTotal = collisions.reduce((n, c) => n + c.classB.length, 0)
    if (renamedTotal) {
        console.error(`[bindgen] ⚠ ${renamedTotal} constructor definition(s) renamed — one name carried DIFFERENT runtime representations in one module (an unannotated use would have emitted the wrong runtime value):`)
        for (const c of collisions) for (const a of c.classA) {
            console.error(`             ${c.module}: ${a.ctor} (${a.values.join(' / ')}) -> ${a.renamed.map((r) => r.to).join(', ')}`)
        }
    }
    if (sameValTotal) {
        console.error(`[bindgen] ⚠ ${sameValTotal} constructor name(s) defined more than once with the SAME runtime representation — left as-is (resolves correctly), but ambiguous to read:`)
        for (const c of collisions) {
            const names = c.classB.slice(0, 8).map((b) => b.ctor)
            if (names.length) console.error(`             ${c.module}: ${names.join(', ')}${c.classB.length > 8 ? ` … +${c.classB.length - 8} more` : ''}`)
        }
    }
    }

    if (opts.stdout && units.length === 1) {
        const out = emit(units[0].ir, compRef)
        reportCollisions() // before the early return — `--stdout` renames just as much as a write does
        process.stdout.write(out)
        return
    }

    // HtmlAttrs module (issue #16): components extending *HTMLAttributes reference one
    // shared attribute-record module instead of inlining the surface. Planned AFTER the
    // --stdout return — stdout can't carry a second file, so it keeps labeled args
    // (ir.attrsBase without .ref makes emit() fall back).
    const attrsUsages = units.map((u) => u.ir.attrsBase).filter(Boolean)
    const attrsPlan = attrsUsages.length ? planHtmlAttrs(attrsUsages) : null
    if (attrsPlan) for (const u of units) {
        if (u.ir.attrsBase) u.ir.attrsBase.ref = `HtmlAttrs.${attrsPlan.refFor(u.ir.attrsBase)}`
    }

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

    // #190 Blocker 2: an SCC merge (#35) FORCES a locked home to move (LeftTypes+RightTypes ⇄ cycle
    // -> LeftSharedTypes) — a circular module dep is otherwise uncompilable. The qualified module is
    // public, so re-export every moved identity from each home it has previously occupied. Former
    // homes accumulate in the manifest (`formerModules`), so a multi-hop move stays covered, and a
    // reappearing home recovers its file. Keyed by former module -> the moved entries + their new home.
    const liveModules = plan ? new Set(plan.byModule.keys()) : new Set()
    const formerHomeReexports = new Map()
    if (plan) {
        for (const e of shared.entries) {
            const newModule = plan.finalOf.get(e.home) || e.home
            const priorHomes = new Set()
            for (const id of e.publicIds || []) {
                const row = priorPublicTypes[id]
                if (!row) continue
                if (typeof row.module === 'string') priorHomes.add(row.module)
                for (const fm of row.formerModules || []) if (typeof fm === 'string') priorHomes.add(fm)
            }
            priorHomes.delete(newModule)
            e._formerModules = [...priorHomes].sort()
            for (const fm of e._formerModules) {
                if (!formerHomeReexports.has(fm)) formerHomeReexports.set(fm, [])
                formerHomeReexports.get(fm).push({ entry: e, newModule })
            }
        }
    }
    // Re-export lines for one moved identity at a former home, targeting its new module. EVERY name
    // (canonical + every compatibility alias) is re-exported, case-aware and threading params, so all
    // historical `<FormerHome>.<name>` paths keep resolving — not just the current canonical. (#190 P1b)
    const reexportLinesFor = ({ entry: e, newModule }) => {
        const params = e.tparams && e.tparams.length ? `<${e.tparams.join(', ')}>` : ''
        const names = [...new Set([e.name, ...(e.compatNames || [])])].filter(Boolean)
        // An upper-case name is a module (opaque or a cross-kind module shim) -> module alias; a
        // lower-case name is a type -> type alias threading the entry's params.
        return names.map((nm) => /^[A-Z]/.test(nm) ? `module ${nm} = ${newModule}.${nm}` : `type ${nm}${params} = ${newModule}.${nm}${params}`)
    }
    // Post-SCC module dependency graph, so a compat re-export never closes a NEW cycle: appending
    // `type x = N.x` into module M adds an M->N edge, which is unsafe iff N already reaches M. The
    // former-home re-exports are computed AFTER SCC planning, so their edges are invisible to the
    // planner — this reachability guard is what keeps them from producing a circular module dep. (#190 P1a)
    const moduleDeps = new Map()
    if (plan) {
        const finalHome = (e) => plan.finalOf.get(e.home) || e.home
        for (const e of shared.entries) {
            const from = finalHome(e)
            for (const depKey of e.deps || []) {
                const dep = shared.byKey.get(depKey)
                if (!dep) continue
                const to = finalHome(dep)
                if (to === from) continue
                if (!moduleDeps.has(from)) moduleDeps.set(from, new Set())
                moduleDeps.get(from).add(to)
            }
        }
    }
    const moduleReaches = (from, target) => {
        const seen = new Set(); const stack = [from]
        while (stack.length) {
            const n = stack.pop()
            if (n === target) return true
            if (seen.has(n)) continue
            seen.add(n)
            for (const m of moduleDeps.get(n) || []) stack.push(m)
        }
        return false
    }
    let cycleSkipped = 0
    const safeReexports = (host, reexports) => reexports.filter((rx) => {
        if (moduleReaches(rx.newModule, host)) { cycleSkipped++; return false } // host -> newModule -> ... -> host
        // FOLD the approved edge into the graph: appending `type x = newModule.x` into `host` really
        // adds host -> newModule, so a SIBLING re-export (e.g. two former homes re-exporting each other)
        // is checked against it and can't silently close a cycle the static graph never saw.
        if (!moduleDeps.has(host)) moduleDeps.set(host, new Set())
        moduleDeps.get(host).add(rx.newModule)
        return true
    })

    // Write the shared `*Types.res` modules once.
    if (plan) {
        for (const [mod, entries] of plan.byModule) {
            const p = join(typesDir, `${mod}.res`)
            let content = emitSharedModule(mod, entries, plan.finalOf, { renames: shared.renames, byKey: shared.byKey, collisions })
            // A former home REUSED as a live module (a fresh type homed to an orphaned name): append the
            // moved identities' re-exports into that live file rather than a colliding standalone one —
            // but only those that don't create a cycle back into this now-live module.
            const reexports = safeReexports(mod, formerHomeReexports.get(mod) || [])
            if (reexports.length) content += '\n// #190: compatibility re-exports for identities that moved here previously\n' + reexports.flatMap(reexportLinesFor).join('\n') + '\n'
            writeFileSync(p, content)
            written.add(relative(outDir, p))
        }
        // Standalone compat files at orphaned prior homes no live module occupies.
        let compatFiles = 0
        for (const [fm, allReexports] of formerHomeReexports) {
            if (liveModules.has(fm)) continue
            const reexports = safeReexports(fm, allReexports)
            if (!reexports.length) continue
            const p = join(typesDir, `${fm}.res`)
            const body = reexports.flatMap(reexportLinesFor).join('\n')
            writeFileSync(p, `// #190: compatibility re-exports — these identities moved to another module when a\n// dependency cycle merged this home. Old \`${fm}.<name>\` annotations keep resolving.\n${body}\n`)
            written.add(relative(outDir, p))
            compatFiles++
        }
        if (cycleSkipped) console.error(`[bindgen] ⚠ ${cycleSkipped} former-home compatibility re-export(s) skipped — the prior home is now live and depends on the merged module, so re-exporting would create a module cycle (#190)`)
        console.error(`[bindgen] wrote ${plan.byModule.size} shared type module(s) (${shared.entries.length} unique types) to ${typesDir}`)
        if (compatFiles) console.error(`[bindgen] wrote ${compatFiles} former-home compatibility module(s) — a dependency cycle moved locked types to a merged module (#190)`)
    }

    if (attrsPlan) {
        const p = join(typesDir, 'HtmlAttrs.res')
        writeFileSync(p, attrsPlan.render())
        written.add(relative(outDir, p))
        console.error(`[bindgen] wrote HtmlAttrs.res (${attrsPlan.groupCount} attribute group(s), ${attrsPlan.variantCount} narrowed variant(s)) — ${HTML_ATTRS_PIN} surface`)
    }

    // The shared `JsFn.res` module — the honest, zero-cost handle for a bare untyped `Function`
    // (#120). Emitted once, only when some binding referenced `JsFn.t` (`shared.usesJsFn`), same
    // standalone-file mechanism as `HtmlAttrs.res`.
    if (plan && shared.usesJsFn) {
        const p = join(typesDir, 'JsFn.res')
        writeFileSync(p, JS_FN_SOURCE)
        written.add(relative(outDir, p))
        console.error('[bindgen] wrote JsFn.res (bare-Function opaque module)')
    }

    let totalDefects = 0
    const rows = []      // counts per component
    const reports = []   // per-prop detail, for --report
    for (const { name, ir } of units) {
        const code = emit(ir, compRef)
        const rep = report(ir, shared) // registry-aware: defects inside shared types surface here (#133)
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

    // Namespace alias modules (`Accordion.res` -> `module Root = AccordionRoot`, …):
    // the package's documented `<Accordion.Root>` idiom, zero-cost. (#25)
    for (const ns of namespaces) {
        writeFileSync(join(outDir, `${ns.name}.res`), emitNamespace(ns, from))
        written.add(`${ns.name}.res`)
    }
    if (namespaces.length) console.error(`[bindgen] wrote ${namespaces.length} namespace alias module(s): ${namespaces.slice(0, 8).map((n) => `${n.name}.res`).join(', ')}${namespaces.length > 8 ? '…' : ''}`)

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
    let staleRemoved = 0
    for (const rel of priorManifest.files) {
        if (!written.has(rel)) {
            const p = join(outDir, rel)
            // Unlink directly and swallow ENOENT — an existsSync-then-unlink check is a TOCTOU
            // race (the file could vanish in between); the try/catch already handles "gone". (CodeQL)
            try { unlinkSync(p); staleRemoved++ } catch { /* already gone / unreadable — ignore */ }
        }
    }

    // The registry is append-only. A removed/moved/renamed upstream declaration becomes inactive,
    // but its names stay reserved forever; if the same source identity reappears, it gets them back.
    // Single-file mode has no shared registry, so it preserves any module-mode rows untouched.
    // Only the CURRENT scope's rows are tombstoned/reactivated this run — rows from OTHER `@module`
    // scopes (scope-prefixed IDs) pass through EXACTLY as they were, never wiped by a scope change. (#190)
    const scopePrefix = `scope:${from}|`
    const publicTypes = Object.fromEntries(Object.entries(priorPublicTypes).map(([id, row]) => {
        const base = row && typeof row === 'object' ? { ...row } : {}
        if (id.startsWith(scopePrefix)) base.active = shared ? false : base.active !== false
        return [id, base]
    }))
    if (shared && plan) {
        for (const entry of shared.entries) {
            const row = {
                kind: entry.kind,
                module: plan.finalOf.get(entry.home) || entry.home,
                name: entry.name,
                aliases: [...new Set(entry.compatNames || [])].sort(),
                // Every module this identity has previously lived in (accumulated), so a cycle-forced
                // home move keeps re-exporting from each one on later runs. (#190 Blocker 2)
                ...(entry._formerModules && entry._formerModules.length ? { formerModules: entry._formerModules } : {}),
                ...(entry.publicSignature ? { signature: entry.publicSignature } : {}),
                active: true,
            }
            for (const id of entry.publicIds || []) publicTypes[id] = row
        }
    }
    const sortedPublicTypes = Object.fromEntries(Object.entries(publicTypes).sort(([a], [b]) => a.localeCompare(b)))
    // Atomic write: the manifest is the permanent public-name registry, so a half-written file (a
    // crash/`Ctrl-C`/full disk mid-write) would truncate to invalid JSON — which the reader now
    // rejects loudly rather than RESETTING every locked name, but only if the file survives intact.
    // Write to a sibling temp path and rename it into place (rename is atomic on the same filesystem). (#190)
    // A per-process temp name so two concurrent runs on the same out-dir can't race on ONE shared
    // temp file (each writes its own, renames its own into place).
    const manifestTmp = `${manifestPath}.${process.pid}.tmp`
    writeFileSync(manifestTmp, JSON.stringify({ schemaVersion: 2, scope: from, files: [...written].sort(), publicTypes: sortedPublicTypes }, null, 2) + '\n')
    renameSync(manifestTmp, manifestPath)
    if (staleRemoved) console.error(`[bindgen] removed ${staleRemoved} stale binding(s) from a previous run (per .bindgen-manifest.json)`)

    console.error(`\n[bindgen] wrote ${units.length} component + ${functions.length} function + ${classes.length} class binding(s) to ${outDir}`)
    for (const r of rows) console.error(`  ${r.name.padEnd(24)} props=${String(r.props).padStart(3)} enums=${String(r.enums).padStart(2)} loose=${String(r.loose).padStart(2)} review=${r.review} defects=${r.defects}`)
    if (skipped.length) console.error(`\n[bindgen] skipped ${skipped.length} non-component export(s): ${skipped.slice(0, 15).map((s) => s.name).join(', ')}${skipped.length > 15 ? '…' : ''}`)
    // A broken re-export is an UPSTREAM types bug (every TS consumer sees `any` for that name) —
    // shout it, don't bury it among ordinary skips. (#105)
    const brokenReexports = skipped.filter((s) => s.reason.startsWith('unresolvable-reexport'))
    if (brokenReexports.length) console.error(`\n[bindgen] ⚠ ${brokenReexports.length} BROKEN re-export(s) — the package's own .d.ts re-exports a name its target module doesn't export (upstream types bug; the symbol is \`any\` for every TS consumer): ${brokenReexports.map((s) => s.name).join(', ')}`)
    // A numeric name suffix means the source anchors (library name / property path / discriminant)
    // needed a tiebreak. Rare by design (#96); surface the SURVIVING ones (raw counterHits includes
    // names later discarded by structural dedup / healing). The manifest permanently locks the
    // assignment, so this is a readability signal—not permission to renumber it on a later run.
    if (shared && shared.counterHits && shared.counterHits.length) {
        const hitSet = new Set(shared.counterHits)
        const live = [...new Set(shared.entries.filter((e) => hitSet.has(e.name)).map((e) => e.name))]
        if (live.length) console.error(`\n[bindgen] ⚠ ${live.length} counter-suffixed type name(s) — same base at the same source anchor; assignments are locked in .bindgen-manifest.json: ${live.slice(0, 12).join(', ')}${live.length > 12 ? '…' : ''}`)
    }
    // Two genuinely-distinct types collapsed to ONE source anchor+projection (the anchor couldn't
    // separate them — e.g. blend's `DeepPartial<ComponentTokenType>` over SEARCH_INPUT vs MODAL). The
    // types still emit distinct names, but their PERMANENT manifest identity was shape-disambiguated, so
    // it can churn if that shape changes. Surfaced so the anchor gap is visible, not a silent crash. (#190)
    if (shared && shared.identityCollisions && shared.identityCollisions.length) {
        const c = shared.identityCollisions
        const shown = c.slice(0, 6).map((x) => `${x.projection} (${x.names.join(' vs ')})`).join('; ')
        console.error(`\n[bindgen] ⚠ ${c.length} public-identity collision(s) shape-disambiguated (anchor couldn't separate distinct types; manifest id is shape-tied, not name-stable, for these): ${shown}${c.length > 6 ? '…' : ''}`)
    }
    // A prior `.bindgen-manifest.json` listed one name under two live identities (a corrupt/hand-edited/
    // merged manifest). Rather than abort generation, the conflicting name was degraded (canonical
    // suffixed / alias dropped) — surfaced so the manifest can be fixed. (#198 class — never crash)
    if (shared && shared.registryConflicts && shared.registryConflicts.length) {
        const rc = shared.registryConflicts
        console.error(`\n[bindgen] ⚠ ${rc.length} public-name registry conflict(s) in .bindgen-manifest.json degraded (a name was claimed by two identities; suffixed/dropped instead of crashing — inspect the manifest): ${rc.slice(0, 8).map((x) => `${x.name} (${x.what})`).join(', ')}${rc.length > 8 ? '…' : ''}`)
    }
    // A source identity whose ReScript REPRESENTATION flipped across bindgen versions (record ⇄ opaque,
    // #190). The frozen name is preserved as a case-aware compatibility shim so annotations keep
    // compiling, but a former opaque module's `from*`/`as*` constructors/accessors may not be
    // reproducible on the new shape — surface it so the change isn't silent.
    if (shared && shared.representationChanges && shared.representationChanges.length) {
        const rc = shared.representationChanges
        const shown = rc.slice(0, 12).map((c) => `${c.frozen}→${c.name} (${c.from}→${c.to})`).join(', ')
        console.error(`\n[bindgen] ⚠ ${rc.length} type(s) changed representation across versions — frozen name kept as a compatibility shim, but old constructors/accessors may not be reproducible: ${shown}${rc.length > 12 ? '…' : ''}`)
    }
    // A sink module (CommonTypes/InstanceTypes/WebTypes) pulled into an SCC merge = a synthetic
    // mis-homed into a sink with a non-sink dep (a circular-module-dep risk). Flagged, not faked. (#115 pkg)
    if (shared && shared.sinkMergeWarnings && shared.sinkMergeWarnings.length) {
        console.error(`\n[bindgen] ⚠ ${shared.sinkMergeWarnings.length} sink module(s) merged into a shared cycle (a mis-homed synthetic — should relocate to its non-sink dep's home): ${shared.sinkMergeWarnings.join('; ')}`)
    }
    if (totalDefects) console.error(`\n[bindgen] ⚠ ${totalDefects} unknown/any prop(s) flagged as defects — review.`)

    // Dependencies
    console.error(`\n[bindgen] dependencies:`)
    for (const d of depSummary.required) console.error(`  required  ${d.pkg.padEnd(24)} ${d.present ? '✓ present' : '✗ MISSING'}  (${d.provides})`)
    for (const d of depSummary.optional) {
        const status = d.present ? (d.used ? '✓ present → used' : '✓ present') : `✗ not installed${d.propCount ? ` → ${d.propCount} prop(s) flagged` : ''}`
        console.error(`  optional  ${d.pkg.padEnd(24)} ${status}  (${d.provides})`)
    }

    reportCollisions()

    if (opts.report) {
        const reportPath = join(outDir, '_REPORT.md')
        // Even with no shared plan (`--file`), collisions must reach the report — the section is driven
        // by `collisions`, and the type/module counts are simply absent there.
        const sharedInfo = plan
            ? { modules: plan.byModule.size, types: shared.entries.length, collisions }
            : (collisions.length ? { collisions } : null)
        const fnInfo = fnFile ? { file: fnFile, names: functions.map((f) => f.name) } : null
        const classInfo = classes.length ? classes.map((c) => ({ name: c.name, methods: c.ir.methods.length, getters: c.ir.getters.length, ctor: !!c.ir.ctor })) : null
        writeReport(reportPath, opts.pkg || from, rows, reports, depSummary, sharedInfo, fnInfo, classInfo)
        console.error(`[bindgen] 📄 report written to ${reportPath}`)
    } else {
        console.error(`[bindgen] (add --report to also write _REPORT.md)`)
    }

    // Machine-readable summary for CI / benchmark tooling. Buckets mirror report.mjs:
    // most-serious wins — broken (defects) > review > usable; loose counted separately.
    if (opts.jsonSummary) {
        const summary = {
            label: opts.pkg || from,
            components: {
                total: rows.length,
                usable: rows.filter((r) => r.defects === 0 && r.review === 0).length,
                review: rows.filter((r) => r.defects === 0 && r.review > 0).length,
                broken: rows.filter((r) => r.defects > 0).length,
                loose: rows.filter((r) => r.loose > 0).length,
            },
            functions: functions.length,
            classes: classes.length,
            files: written.size,
        }
        writeFileSync(opts.jsonSummary, JSON.stringify(summary, null, 2) + '\n')
        console.error(`[bindgen] 📊 json summary written to ${opts.jsonSummary}`)
    }
}

main().catch((e) => { console.error('[bindgen] error: ' + e.message); process.exit(1) })
