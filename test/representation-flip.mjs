// Representation-flip permanence (#190, Blocker 1).
//
// A generated leaf name is frozen public API, but ReScript ties CASING to representation: an opaque
// entry is a `module Name` (upper-case), every other kind is a lowercase `type name`. When the same
// upstream identity changes representation across bindgen versions (record ⇄ opaque), reusing the
// frozen name verbatim would emit uncompilable `module boundary` / `type Boundary`.
//
// Contract exercised here, across several REAL CLI runs against one output dir:
//   - the canonical name is re-cased to the current representation (always compilable);
//   - the incompatible frozen name survives as a case-aware compatibility SHIM
//     (`type old = New.t` for record→opaque, `module Old = { type t = new }` for opaque→record);
//   - the shim is retained in the manifest aliases and persists on a third run;
//   - the output compiles (when the ReScript sandbox is available).
import { spawnSync } from 'child_process'
import { existsSync, mkdtempSync, readFileSync, readdirSync, rmSync, writeFileSync, mkdirSync } from 'fs'
import { dirname, join } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

const HERE = dirname(fileURLToPath(import.meta.url))
const REPO = dirname(HERE)
const CLI = join(REPO, 'src', 'cli.mjs')
const SANDBOX = join(REPO, 'test', 'sandbox')
const CAN_COMPILE = existsSync(join(SANDBOX, 'node_modules', 'rescript'))

const root = mkdtempSync(join(tmpdir(), 'bindgen-rep-flip-'))
const source = join(root, 'index.d.ts')
const out = join(root, 'generated')
const manifestPath = join(out, '.bindgen-manifest.json')

// `boundary` is a union of >=2 distinct object shapes -> an opaque module; `plain` is a plain
// interface -> a lowercase record. Two identities, one representing each side of the flip.
const SRC = `
type JsxElement = { __brand: 'element' }
interface ShapeA { a: string }
interface ShapeB { b: number }
interface ShapeC { c: boolean }
export interface PlainConfig { value: string }
export declare const View: (props: {
  boundary?: ShapeA | ShapeB | ShapeC
  plain?: PlainConfig
}) => JsxElement
`

function run() {
    writeFileSync(source, SRC)
    const r = spawnSync('node', [CLI, '--dir', root, '--out', out, '--from', 'demo', '--no-install'], { encoding: 'utf-8' })
    if (r.status !== 0) throw new Error(`CLI failed (exit ${r.status}):\n${r.stderr}`)
    return { manifest: JSON.parse(readFileSync(manifestPath, 'utf-8')), stderr: r.stderr }
}

function assert(ok, message) {
    if (!ok) throw new Error(message)
    console.log(`✓ ${message}`)
}

const idByKind = (m, kind) => {
    const found = Object.entries(m.publicTypes).find(([, v]) => v.kind === kind && v.active !== false)
    if (!found) throw new Error(`no ${kind} row in manifest`)
    return found[0]
}
const rowOf = (m, id) => {
    const row = m.publicTypes[id]
    if (!row) throw new Error(`row ${id} vanished`)
    return row
}
const moduleText = (m, id) => readFileSync(join(out, `${rowOf(m, id).module}.res`), 'utf-8')

// Compile the whole generated output in the sandbox (module names are global, so build in isolation).
function compileGenerated(label, outDir = out) {
    if (!CAN_COMPILE) { console.log(`• compile skipped (${label}): test/sandbox deps not installed`); return }
    const src = join(SANDBOX, 'src')
    for (const f of existsSync(src) ? readdirSync(src) : []) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    if (!existsSync(src)) mkdirSync(src, { recursive: true })
    for (const f of readdirSync(outDir)) if (f.endsWith('.res')) writeFileSync(join(src, f), readFileSync(join(outDir, f)))
    const r = spawnSync(join(SANDBOX, 'node_modules', '.bin', 'rescript'), ['build'], { cwd: SANDBOX, encoding: 'utf-8' })
    for (const f of readdirSync(src)) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    assert(r.status === 0, `generated output compiles after ${label}\n${r.status !== 0 ? (r.stdout || '') + (r.stderr || '') : ''}`)
}

try {
    // ── record → opaque ──────────────────────────────────────────────────────
    // Bootstrap the opaque, then rewrite its row to a lowercase RECORD name, as some prior bindgen
    // release would have assigned when this identity generated a record.
    let { manifest } = run()
    const opaqueId = idByKind(manifest, 'opaque')
    const opaqueCanonical = rowOf(manifest, opaqueId).name
    assert(/^[A-Z]/.test(opaqueCanonical), 'a fresh opaque identity is a capitalized module name')

    // Also assign a distinct prior MODULE (a sentinel), so we can prove the flip preserves the frozen
    // qualified path — the shim must land in `LegacyTypes.res`, not a freshly-derived module.
    const asRecordName = opaqueCanonical[0].toLowerCase() + opaqueCanonical.slice(1)
    rowOf(manifest, opaqueId).name = asRecordName
    rowOf(manifest, opaqueId).kind = 'record'
    rowOf(manifest, opaqueId).module = 'LegacyTypes'
    rowOf(manifest, opaqueId).aliases = []
    writeFileSync(manifestPath, JSON.stringify(manifest, null, 2) + '\n')

    let res = run()
    let row = rowOf(res.manifest, opaqueId)
    assert(row.name === opaqueCanonical, 'record→opaque keeps a valid capitalized module as canonical, not the frozen lowercase name')
    assert(row.aliases.includes(asRecordName), 'the frozen lowercase record name is retained as a manifest alias')
    assert(row.module === 'LegacyTypes', 'record→opaque preserves the frozen qualified module (LegacyTypes)')
    assert(existsSync(join(out, 'LegacyTypes.res')), 'the frozen module file (LegacyTypes.res) is emitted for the flipped identity')
    assert(moduleText(res.manifest, opaqueId).includes(`module ${opaqueCanonical} = {`), 'the canonical opaque module is emitted in the frozen module')
    assert(moduleText(res.manifest, opaqueId).includes(`type ${asRecordName} = ${opaqueCanonical}.t`), 'record→opaque emits a `type old = New.t` compatibility shim in the frozen module')
    assert(/changed representation/.test(res.stderr), 'a representation change is warned on stderr')
    compileGenerated('record→opaque flip')

    // Third run: the shim, canonical, AND frozen module are stable, not re-churned.
    let res3 = run()
    assert(rowOf(res3.manifest, opaqueId).name === opaqueCanonical && rowOf(res3.manifest, opaqueId).aliases.includes(asRecordName)
        && rowOf(res3.manifest, opaqueId).module === 'LegacyTypes',
        'record→opaque canonical + shim + frozen module persist unchanged on a third run')

    // ── opaque → record ──────────────────────────────────────────────────────
    // Fresh registry: rewrite the plain record's row to a capitalized OPAQUE module name.
    rmSync(out, { recursive: true, force: true })
    manifest = run().manifest
    const recordId = Object.entries(manifest.publicTypes).find(([id, v]) => v.kind === 'record' && id.includes('named:PlainConfig'))?.[0]
    if (!recordId) throw new Error('no PlainConfig record row')
    const recordCanonical = rowOf(manifest, recordId).name
    assert(/^[a-z]/.test(recordCanonical), 'a fresh record identity is a lowercase type name')

    const asModuleName = recordCanonical[0].toUpperCase() + recordCanonical.slice(1)
    rowOf(manifest, recordId).name = asModuleName
    rowOf(manifest, recordId).kind = 'opaque'
    rowOf(manifest, recordId).aliases = []
    writeFileSync(manifestPath, JSON.stringify(manifest, null, 2) + '\n')

    res = run()
    row = rowOf(res.manifest, recordId)
    assert(row.name === recordCanonical, 'opaque→record keeps a valid lowercase type as canonical, not the frozen module name')
    assert(row.aliases.includes(asModuleName), 'the frozen module name is retained as a manifest alias')
    assert(moduleText(res.manifest, recordId).includes(`module ${asModuleName} = { type t = ${recordCanonical} }`),
        'opaque→record emits a `module Old = { type t = new }` compatibility shim')
    compileGenerated('opaque→record flip')

    res3 = run()
    assert(rowOf(res3.manifest, recordId).name === recordCanonical && rowOf(res3.manifest, recordId).aliases.includes(asModuleName),
        'opaque→record canonical + shim persist unchanged on a third run')

    // ── generic record → opaque (param forwarding) ───────────────────────────
    // A GENERIC opaque (`SeriesOptionsType.t<'b>`) whose frozen name was a record must forward the
    // `.t` params into the shim, or `type x = M.t` fails to compile ("t expects 1 argument").
    const genFixture = join(REPO, 'test', 'golden', 'cases', 'highcharts-series-data-payload')
    const genOut = join(root, 'generic')
    const genManifest = join(genOut, '.bindgen-manifest.json')
    const runGen = () => {
        const r = spawnSync('node', [CLI, '--dir', genFixture, '--out', genOut, '--from', 'demo', '--no-install'], { encoding: 'utf-8' })
        if (r.status !== 0) throw new Error(`generic CLI failed (exit ${r.status}):\n${r.stderr}`)
        return JSON.parse(readFileSync(genManifest, 'utf-8'))
    }
    let gm = runGen()
    const genEntry = Object.entries(gm.publicTypes).find(([, v]) => v.kind === 'opaque' &&
        readFileSync(join(genOut, `${v.module}.res`), 'utf-8').includes(`module ${v.name} = {`) &&
        new RegExp(`module ${v.name} = \\{[\\s\\S]*?type t<`).test(readFileSync(join(genOut, `${v.module}.res`), 'utf-8')))
    if (!genEntry) throw new Error('no generic opaque (type t<…>) in highcharts fixture')
    const [genId, genRow] = genEntry
    const genLower = genRow.name[0].toLowerCase() + genRow.name.slice(1)
    gm.publicTypes[genId] = { ...genRow, name: genLower, kind: 'record', aliases: [] }
    writeFileSync(genManifest, JSON.stringify(gm, null, 2) + '\n')

    gm = runGen()
    const genText = readFileSync(join(genOut, `${gm.publicTypes[genId].module}.res`), 'utf-8')
    assert(new RegExp(`type ${genLower}<[^>]+> = ${genRow.name}\\.t<[^>]+>`).test(genText),
        'a generic record→opaque shim forwards the `.t` type parameters')
    compileGenerated('generic record→opaque flip', genOut)

    console.log('\n✅ representation-flip permanence invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
