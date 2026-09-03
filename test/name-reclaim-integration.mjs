// #222 integration — a live counter-suffixed type reclaims a structurally-identical tombstone's clean
// name. Drives the REAL CLI across generations of one out dir (like module-move-compat.mjs):
//   - cold gen emits `@unboxed type stringOrNumber = Str(string) | Num(float)` in CommonTypes;
//   - we craft a beta.3-style manifest (the live union renamed to `stringOrNumber2` + a `stringOrNumber`
//     tombstone squatting the clean base — exactly juspay/blend-rescript#151);
//   - a warm re-run RECLAIMS `stringOrNumber` (proof: the clean body still on disk), keeps `stringOrNumber2`
//     as a transparent alias, folds the tombstone into the live identity, is idempotent, and compiles;
//   - a REFUSE case (the tombstone's on-disk body is a genuinely DIFFERENT shape) keeps the suffix, emits
//     NO alias, and records the refusal — the #190 guarantee earning its keep.
import { spawnSync } from 'child_process'
import { existsSync, mkdtempSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'fs'
import { dirname, join } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

const HERE = dirname(fileURLToPath(import.meta.url))
const REPO = dirname(HERE)
const CLI = join(REPO, 'src', 'cli.mjs')
const SANDBOX = join(REPO, 'test', 'sandbox')
const CAN_COMPILE = existsSync(join(SANDBOX, 'node_modules', 'rescript'))

const root = mkdtempSync(join(tmpdir(), 'bindgen-reclaim-'))
const assert = (ok, msg) => { if (!ok) throw new Error('FAIL: ' + msg); console.log('✓ ' + msg) }

// A package whose only shared type is the `string | number` union bindgen names `stringOrNumber`.
function scaffold(dir) {
    mkdirSync(join(dir, 'pkg'), { recursive: true })
    mkdirSync(join(dir, 'out'), { recursive: true })
    writeFileSync(join(dir, 'pkg', 'index.d.ts'),
        'export interface Box { size?: string | number }\n' +
        'export declare const View: (props: { box?: Box }) => { __brand: "el" }\n')
}
function gen(dir, extra = []) {
    const r = spawnSync('node', [CLI, '--dir', join(dir, 'pkg'), '--out', join(dir, 'out'), '--from', 'demo', '--no-install', ...extra], { encoding: 'utf-8' })
    if (r.status !== 0) throw new Error(`CLI failed (exit ${r.status}):\n${r.stderr}`)
    return r.stderr
}
const manifestOf = (dir) => JSON.parse(readFileSync(join(dir, 'out', '.bindgen-manifest.json'), 'utf-8'))
const commonRes = (dir) => readFileSync(join(dir, 'out', 'CommonTypes.res'), 'utf-8')
function compileOut(dir, label) {
    if (!CAN_COMPILE) { console.log(`• compile skipped (${label}): test/sandbox deps not installed`); return }
    const src = join(SANDBOX, 'src')
    for (const f of existsSync(src) ? readdirSync(src) : []) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    if (!existsSync(src)) mkdirSync(src, { recursive: true })
    for (const f of readdirSync(join(dir, 'out'))) if (f.endsWith('.res')) writeFileSync(join(src, f), readFileSync(join(dir, 'out', f)))
    const r = spawnSync(join(SANDBOX, 'node_modules', '.bin', 'rescript'), ['build'], { cwd: SANDBOX, encoding: 'utf-8' })
    for (const f of readdirSync(src)) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    assert(r.status === 0, `output compiles after ${label}\n${r.status !== 0 ? (r.stdout || '') + (r.stderr || '') : ''}`)
}
// Craft the beta.3-style tombstone squat: rename the live `stringOrNumber` row to `stringOrNumber2` and
// add an inactive `stringOrNumber` tombstone (a different, dead id) holding the clean base.
function squat(dir) {
    const p = join(dir, 'out', '.bindgen-manifest.json')
    const m = JSON.parse(readFileSync(p, 'utf-8'))
    for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') r.name = 'stringOrNumber2'
    m.publicTypes['scope:demo|lib.es5.d.ts|named:DEAD_GHOST'] = { kind: 'unboxed', module: 'CommonTypes', name: 'stringOrNumber', aliases: [], active: false }
    writeFileSync(p, JSON.stringify(m, null, 2) + '\n')
}

try {
    // ---- RECLAIM ----------------------------------------------------------------------------------
    const A = join(root, 'reclaim'); scaffold(A)
    gen(A)                                                   // cold: clean `stringOrNumber` on disk + manifest
    assert(/@unboxed type stringOrNumber = Str\(string\) \| Num\(float\)/.test(commonRes(A)), 'cold gen emits the clean stringOrNumber union')
    squat(A)                                                // simulate the beta.3 tombstone squat
    const err = gen(A, ['--json-summary', join(A, 'out', 'sum.json')]) // warm: the reclaim must fire
    assert(/reclaimed 1 clean type name/.test(err), 'warm run reports the reclaim on stderr')
    const res = commonRes(A)
    assert(/@unboxed type stringOrNumber = Str\(string\) \| Num\(float\)/.test(res), 'the clean base name is reclaimed (stringOrNumber, no suffix)')
    assert(/type stringOrNumber2 = stringOrNumber\b/.test(res), 'the shipped suffixed name survives as a transparent alias (stringOrNumber2 = stringOrNumber)')
    const live = Object.values(manifestOf(A).publicTypes).find((r) => r.name === 'stringOrNumber' && r.active)
    assert(live && live.aliases.includes('stringOrNumber2'), 'the live row owns the clean name and records the suffixed alias')
    const tomb = manifestOf(A).publicTypes['scope:demo|lib.es5.d.ts|named:DEAD_GHOST']
    assert(tomb && tomb.active === false, 'the matched tombstone stays an inert active:false row (the live entry now owns the name, so it never re-squats)')
    const sum = JSON.parse(readFileSync(join(A, 'out', 'sum.json'), 'utf-8'))
    assert(sum.nameReclaims && sum.nameReclaims.reclaimed.length === 1 && sum.nameReclaims.refused.length === 0, 'json-summary records reclaimed=1, refused=0')
    compileOut(A, 'reclaim')

    // Idempotent: the live row now owns the clean base (no counter), so a re-run neither re-reclaims nor churns.
    const snap = readFileSync(join(A, 'out', '.bindgen-manifest.json'), 'utf-8')
    const err2 = gen(A)
    assert(!/reclaimed \d+ clean type name/.test(err2), 'a second run does NOT re-fire the reclaim (idempotent trigger)')
    assert(readFileSync(join(A, 'out', '.bindgen-manifest.json'), 'utf-8') === snap, 'manifest is byte-identical on the idempotent re-run')

    // ---- REFUSE (genuinely different type reused the base) -----------------------------------------
    const B = join(root, 'refuse'); scaffold(B)
    gen(B)
    // Make the on-disk `stringOrNumber` body a DIFFERENT shape than the live union, then squat.
    const bp = join(B, 'out', 'CommonTypes.res')
    writeFileSync(bp, readFileSync(bp, 'utf-8').replace('Num(float)', 'Bool(bool)'))
    squat(B)
    const errB = gen(B, ['--json-summary', join(B, 'out', 'sum.json')])
    assert(/kept 'stringOrNumber2' suffixed/.test(errB), 'a shape mismatch keeps the suffix and says why on stderr')
    const resB = commonRes(B)
    assert(/type stringOrNumber2 =/.test(resB) && !/type stringOrNumber = stringOrNumber2/.test(resB), 'refused: the suffix is kept and NO forwarding alias is emitted (the #190 guarantee)')
    assert(Object.values(manifestOf(B).publicTypes).some((r) => r.name === 'stringOrNumber2' && r.active), 'refused: the live row keeps the suffixed name')
    const sumB = JSON.parse(readFileSync(join(B, 'out', 'sum.json'), 'utf-8'))
    assert(sumB.nameReclaims && sumB.nameReclaims.refused.length === 1 && sumB.nameReclaims.reclaimed.length === 0, 'json-summary records refused=1, reclaimed=0')
    compileOut(B, 'refuse')

    // ---- NEW-IDENTITY reclaim (no shipped counter to alias) ---------------------------------------
    // A brand-new identity whose clean name is squatted ONLY by a matching tombstone reclaims it directly,
    // rather than taking a `stringOrNumber2` suffix. Here the manifest has ONLY the tombstone (no live row
    // for the union yet), so the union is a NEW identity this run.
    const C = join(root, 'newid'); scaffold(C)
    gen(C)                                                   // clean body on disk
    {
        const p = join(C, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const [id, r] of Object.entries(m.publicTypes)) if (r.name === 'stringOrNumber') { r.active = false; delete m.publicTypes[id]; m.publicTypes['scope:demo|lib.es5.d.ts|named:DEAD'] = { ...r, active: false } }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')  // only a tombstone holds `stringOrNumber`
    }
    const errC = gen(C, ['--json-summary', join(C, 'out', 'sum.json')])
    assert(/reclaimed 1 clean type name/.test(errC), 'a NEW identity reclaims a matching tombstone base (no suffix)')
    assert(/@unboxed type stringOrNumber = /.test(commonRes(C)) && !/stringOrNumber2/.test(commonRes(C)),
        'the new identity takes the clean base directly (no stringOrNumber2 minted)')

    // ---- RELOCATION (the real blend case): tombstone in a FORMER module, live in the current one -----
    // The suffix was minted when the type landed in a NEW home while its old home's tombstone kept the clean
    // name — so the tombstone's module ≠ the live entry's current module. The trigger must fire on the home
    // LINEAGE (current ∪ formerModules), not same-module. (blend: 8/8 had moved modules → 0/8 fired before.)
    const R = join(root, 'relocated'); scaffold(R)
    gen(R)                                                   // clean `stringOrNumber` body on disk (CommonTypes)
    {
        const p = join(R, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') { r.name = 'stringOrNumber2'; r.formerModules = ['LegacyTypes'] }
        m.publicTypes['scope:demo|old.d.ts|named:DEAD_RELOC'] = { kind: 'unboxed', module: 'LegacyTypes', name: 'stringOrNumber', aliases: [], active: false }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')  // tombstone lives in a FORMER home, not the current one
    }
    const errR = gen(R, ['--json-summary', join(R, 'out', 'sum.json')])
    assert(/reclaimed 1 clean type name/.test(errR), 'a tombstone in a FORMER module (not the current one) still triggers the reclaim (the real relocation case)')
    assert(/@unboxed type stringOrNumber = /.test(commonRes(R)) && /type stringOrNumber2 = stringOrNumber\b/.test(commonRes(R)),
        'relocation: clean name reclaimed + suffixed alias kept')

    // ---- lineage-guard NEGATIVE: a same-leaf tombstone in an UNRELATED module is NOT raided -----------
    const U = join(root, 'unrelated'); scaffold(U)
    gen(U)
    {
        const p = join(U, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') r.name = 'stringOrNumber2' // NO formerModules
        m.publicTypes['scope:demo|x.d.ts|named:UNRELATED'] = { kind: 'unboxed', module: 'UnrelatedTypes', name: 'stringOrNumber', aliases: [], active: false }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')  // tombstone in a module the live entry never lived in
    }
    const errU = gen(U, ['--json-summary', join(U, 'out', 'sum.json')])
    assert(!/reclaimed \d+ clean type name/.test(errU), 'a same-leaf tombstone in an UNRELATED module (not in the home lineage) is NOT reclaimed')
    assert(/type stringOrNumber2 =/.test(commonRes(U)) && !/type stringOrNumber = stringOrNumber2/.test(commonRes(U)),
        'lineage-guard negative: the suffix is kept, no alias')

    console.log('\n✅ #222 tombstone-name-reclaim invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
