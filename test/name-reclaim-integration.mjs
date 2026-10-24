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

    // ---- THE REAL BLEND SHAPE: a DISTINCT tombstone identity in a DIFFERENT module, same scope, no
    //      formerModules (nothing moved — the tombstone is a different source anchor that minted the same
    //      leaf name and then retired). The trigger is scope-wide by name, NOT same-module or home-lineage
    //      (both fired 0/8 on blend because these are distinct identities, formerModules null). --------------
    const R = join(root, 'distinct-diff-module'); scaffold(R)
    gen(R)                                                   // clean `stringOrNumber` body on disk (CommonTypes)
    {
        const p = join(R, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') r.name = 'stringOrNumber2' // no formerModules — nothing moved
        m.publicTypes['scope:demo|old.d.ts|path:Other.thing|members[2]'] = { kind: 'unboxed', module: 'ChartsSharedTypes', name: 'stringOrNumber', aliases: [], active: false }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')  // a DIFFERENT identity, DIFFERENT module, same scope, no lineage link
    }
    const errR = gen(R, ['--json-summary', join(R, 'out', 'sum.json')])
    assert(/reclaimed 1 clean type name/.test(errR), 'a distinct tombstone identity in a DIFFERENT module (same scope, no lineage link) triggers the reclaim (the real blend shape)')
    assert(/@unboxed type stringOrNumber = /.test(commonRes(R)) && /type stringOrNumber2 = stringOrNumber\b/.test(commonRes(R)),
        'real blend shape: clean name reclaimed + suffixed alias kept')
    compileOut(R, 'real blend shape reclaim')
    const snapR = readFileSync(join(R, 'out', '.bindgen-manifest.json'), 'utf-8')
    const errR2 = gen(R)
    assert(!/reclaimed \d+ clean type name/.test(errR2) && readFileSync(join(R, 'out', '.bindgen-manifest.json'), 'utf-8') === snapR,
        'the cross-module reclaim is idempotent — a second run neither re-fires nor churns')

    // ---- NEGATIVE 1: a CROSS-SCOPE tombstone is NOT reclaimed (a different package's name never collides) -
    const X = join(root, 'crossscope'); scaffold(X)
    gen(X)
    {
        const p = join(X, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') r.name = 'stringOrNumber2'
        m.publicTypes['scope:OTHERPKG|z.d.ts|named:FOREIGN'] = { kind: 'unboxed', module: 'CommonTypes', name: 'stringOrNumber', aliases: [], active: false }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')  // tombstone in a DIFFERENT scope
    }
    const errX = gen(X, ['--json-summary', join(X, 'out', 'sum.json')])
    assert(!/reclaimed \d+ clean type name/.test(errX), 'a tombstone in a DIFFERENT scope is NOT reclaimed (reservation is per-scope)')

    // ---- NEGATIVE 2 (the crucial safety guard): a base a LIVE identity legitimately holds is NEVER stolen -
    const L = join(root, 'liveheld'); scaffold(L)
    gen(L)
    {
        const p = join(L, 'out', '.bindgen-manifest.json'); const m = JSON.parse(readFileSync(p, 'utf-8'))
        for (const r of Object.values(m.publicTypes)) if (r.name === 'stringOrNumber') r.name = 'stringOrNumber2'
        // BOTH an inactive tombstone AND a LIVE row hold `stringOrNumber` — the live one owns it, and it sits
        // in a DIFFERENT module (PkgTypes) to prove the guard is scope-wide, not module-scoped. "Live" means an
        // entry of THIS run carries the id (#232): the real `Box` record is locked to the name, not a
        // hand-written `active:true` row nothing emits (that one is dead this run — a same-run tombstone).
        m.publicTypes['scope:demo|index.d.ts|named:Box'].name = 'stringOrNumber'
        m.publicTypes['scope:demo|q.d.ts|named:DEAD_TOO'] = { kind: 'unboxed', module: 'CommonTypes', name: 'stringOrNumber', aliases: [], active: false }
        writeFileSync(p, JSON.stringify(m, null, 2) + '\n')
    }
    const errL = gen(L, ['--json-summary', join(L, 'out', 'sum.json')])
    assert(!/reclaimed \d+ clean type name/.test(errL), 'a clean name a LIVE identity holds (even in another module) is NEVER reclaimed (the suffix is correct)')
    assert(/@unboxed type stringOrNumber2 = /.test(commonRes(L)), 'live-held: the union keeps its stringOrNumber2 suffix')
    compileOut(L, 'live-held guard')

    // ---- PARSER (blend #4): a truncated `{` in a `⚪ loose` comment on an EARLIER decl must not swallow
    //      the `stringOrNumber` decl that follows it in the same *Types.res (→ "no prior on-disk body"). ----
    const P = join(root, 'poison'); scaffold(P)
    gen(P)
    {
        const cp = join(P, 'out', 'CommonTypes.res')
        const poison = 'type poisonRecord = {\n  item: string, // ⚪ loose — was `{ gap: number; color: { active: int\n}\n'
        writeFileSync(cp, poison + readFileSync(cp, 'utf-8')) // a loose-brace-comment record BEFORE stringOrNumber
        squat(P)
    }
    const errP = gen(P, ['--json-summary', join(P, 'out', 'sum.json')])
    assert(/reclaimed 1 clean type name/.test(errP), 'a truncated `{` in a loose-field comment does NOT swallow the following decl — stringOrNumber is still indexed and reclaimed (blend #4)')

    // ---- #232: SAME-RUN declaration move. The old identity is still `active:true` in the prior manifest but
    //      nothing in THIS run claims its id — it dies the same run the new identity is born. Liveness must be
    //      judged by the current run, else the newcomer is suffixed and (next run, old body gone) never heals.
    const stepper = (dir, files) => { for (const [f, src] of Object.entries(files)) writeFileSync(join(dir, 'pkg', f), src) }
    const STEP_V1 = {
        'stepper.types.d.ts': 'export type StepStatus = "done" | "pending"\n' +
            'export interface Step { id: string; title: string; status?: StepStatus }\n' +
            'export interface StepperProps { steps: Step[]; onClick?: (s: Step) => void }\n',
        'index.d.ts': "export * from './stepper.types'\nimport { StepperProps } from './stepper.types'\n" +
            'export declare const Stepper: (props: StepperProps) => { __brand: "el" }\n',
    }
    const stepV2 = (stepBody) => ({ // Step/StepStatus MOVE to a base file; still re-exported (public API unchanged)
        'stepper.base.types.d.ts': 'export type StepStatus = "done" | "pending"\n' + `export interface Step { ${stepBody} }\n`,
        'stepper.types.d.ts': "import { Step } from './stepper.base.types'\nexport * from './stepper.base.types'\n" +
            'export interface StepperProps { steps: Step[]; onClick?: (s: Step) => void }\n',
    })
    const setup = (dir) => { mkdirSync(join(dir, 'pkg'), { recursive: true }); mkdirSync(join(dir, 'out'), { recursive: true }) }
    const pkgRes = (dir) => readFileSync(join(dir, 'out', 'PkgTypes.res'), 'utf-8')

    const M = join(root, 'same-run-move'); setup(M)
    stepper(M, STEP_V1); gen(M)
    stepper(M, stepV2('id: string; title: string; status?: StepStatus'))
    const errM = gen(M, ['--json-summary', join(M, 'out', 'sum.json')])
    assert(/reclaimed 2 clean type name/.test(errM), '#232: a same-run file move reclaims both clean names (step, stepStatus)')
    assert(/^type step = \{/m.test(pkgRes(M)) && /^type stepStatus =/m.test(pkgRes(M)) && !/step2|stepStatus2/.test(pkgRes(M)),
        '#232: the moved types keep their clean public names — no …2 minted')
    {
        const rows = manifestOf(M).publicTypes
        assert(rows['scope:demo|stepper.base.types.d.ts|named:Step']?.name === 'step' && rows['scope:demo|stepper.base.types.d.ts|named:Step'].active,
            '#232: the new (moved) identity owns the clean name in the manifest')
        assert(rows['scope:demo|stepper.types.d.ts|named:Step']?.active === false, '#232: the old identity is retired to an inert tombstone')
    }
    compileOut(M, '#232 same-run move')
    const snapM = readFileSync(join(M, 'out', '.bindgen-manifest.json'), 'utf-8')
    assert(!/reclaimed \d+ clean type name/.test(gen(M)) && readFileSync(join(M, 'out', '.bindgen-manifest.json'), 'utf-8') === snapM,
        '#232: the move reclaim is idempotent — a re-run neither re-fires nor churns')

    // Anonymous member: inserting a sibling shifts `members[N]` in the identity key of `inputContainer`'s type.
    const N = join(root, 'members-shift'); setup(N)
    const tokens = (extra) => `export type TokensType = { gap: string; ${extra}inputContainer: { padding: string; radius: number } }\n` +
        'export declare const Input: (props: { tokens?: TokensType }) => { __brand: "el" }\n'
    stepper(N, { 'index.d.ts': tokens('') }); gen(N)
    assert(/^type pkgTokensTypeInputContainerConfig = \{/m.test(pkgRes(N)), 'cold gen names the anonymous member type cleanly')
    stepper(N, { 'index.d.ts': tokens('passwordToggle: { color: string }; ') })
    const errN = gen(N)
    assert(/reclaimed 1 clean type name/.test(errN), '#232: a sibling inserted before an anonymous member (members[N] shift) reclaims its clean name')
    assert(/^type pkgTokensTypeInputContainerConfig = \{/m.test(pkgRes(N)) && !/InputContainerConfig2/.test(pkgRes(N)),
        '#232: the shifted anonymous member type keeps its clean name — no …Config2')
    compileOut(N, '#232 members[N] shift')

    // NEGATIVE: the moved type ALSO changed shape — a genuinely different type, so the #190 guarantee holds:
    // it takes the suffix with NO alias, while its unchanged moved sibling still reclaims.
    const D = join(root, 'move-and-change'); setup(D)
    stepper(D, STEP_V1); gen(D)
    stepper(D, stepV2('id: string; title: string; status?: StepStatus; description?: string'))
    const errD = gen(D)
    assert(/kept 'step2' suffixed/.test(errD), '#232 negative: a moved type whose shape changed keeps the suffix and says why')
    assert(/^type step2 = \{/m.test(pkgRes(D)) && !/^type step = /m.test(pkgRes(D)), '#232 negative: no forwarding alias re-points `step` at the changed type')
    assert(/^type stepStatus =/m.test(pkgRes(D)), '#232 negative: the unchanged moved sibling (stepStatus) still reclaims its clean name')
    compileOut(D, '#232 move + shape change')

    // ---- visibility: --json-summary always carries nameReclaims, even when nothing was considered ---------
    const V = join(root, 'visible'); scaffold(V)
    gen(V, ['--json-summary', join(V, 'out', 'sum.json')])   // cold, no tombstone → nothing considered
    const vs = JSON.parse(readFileSync(join(V, 'out', 'sum.json'), 'utf-8'))
    assert(vs.nameReclaims && Array.isArray(vs.nameReclaims.reclaimed) && Array.isArray(vs.nameReclaims.refused) && vs.nameReclaims.reclaimed.length === 0,
        'nameReclaims is ALWAYS present (even empty) so a run is never indistinguishable from "feature absent"')

    console.log('\n✅ #222 tombstone-name-reclaim invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
