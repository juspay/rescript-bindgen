// Cycle-forced module moves stay backward compatible (#190, Blocker 2).
//
// An SCC merge (#35) FORCES two home modules into one when a dependency cycle forms — a circular
// module dependency is otherwise uncompilable in ReScript. The qualified module is public API, so the
// old home must keep resolving. This drives the real CLI across generations of one output dir:
//   - a cycle moves LeftTypes/RightTypes into a merged module;
//   - each prior home is re-emitted as a compatibility file re-exporting the moved types;
//   - the merged home is pinned by the manifest lock (no further churn once formed);
//   - `formerModules` is recorded so the compat files persist, and the output compiles.
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

const root = mkdtempSync(join(tmpdir(), 'bindgen-module-move-'))
const pkg = join(root, 'pkg')
const out = join(root, 'out')
const manifestPath = join(out, '.bindgen-manifest.json')
mkdirSync(join(pkg, 'components', 'left'), { recursive: true })
mkdirSync(join(pkg, 'components', 'right'), { recursive: true })

// Two types in distinct `components/<x>/` dirs get distinct home modules (LeftTypes / RightTypes).
// `cycle` toggles whether Right refers back to Left (the SCC edge). `leftLocalDep` makes Left
// additionally reference a NEW type declared in the LEFT home — so after a move, that home is live
// AND depended on by the merged module (the compat-re-export-cycle hazard).
// `third` (for #220) adds a Mid type in its OWN home that mutually cycles with Left, so on a warm run
// where Left/Right are already merged+locked into one home, the SCC grows to {mergedHome, MidTypes} and
// the largest member is the LOCKED merged home itself — the exact double-suffix trigger.
function writeSources({ cycle, leftLocalDep = false, third = false }) {
    const leftImports = leftLocalDep ? [`export interface NewThing { v: number }`] : [`import { Right } from '../right/types'`]
    const leftFields = ['name: string', leftLocalDep ? 'n?: NewThing' : 'r?: Right']
    if (third) { leftImports.push(`import { Mid } from '../mid/types'`); leftFields.push('m?: Mid') }
    writeFileSync(join(pkg, 'components', 'left', 'types.d.ts'),
        leftImports.join('\n') + `\nexport interface Left { ${leftFields.join('; ')} }\n`)
    writeFileSync(join(pkg, 'components', 'right', 'types.d.ts'),
        cycle
            ? `import { Left } from '../left/types'\nexport interface Right { name: string; l?: Left }\n`
            : `export interface Right { name: string }\n`)
    if (third) {
        mkdirSync(join(pkg, 'components', 'mid'), { recursive: true })
        writeFileSync(join(pkg, 'components', 'mid', 'types.d.ts'),
            `import { Left } from '../left/types'\nexport interface Mid { name: string; l?: Left }\n`)
    }
    writeFileSync(join(pkg, 'index.d.ts'),
        `import { Left } from './components/left/types'\nimport { Right } from './components/right/types'\n` +
        (third ? `import { Mid } from './components/mid/types'\n` : '') +
        `type JsxElement = { __brand: 'element' }\n` +
        `export declare const View: (props: { left?: Left; right?: Right${third ? '; mid?: Mid' : ''} }) => JsxElement\n`)
}

function run(shape) {
    writeSources(shape)
    const args = [CLI, '--dir', pkg, '--out', out, '--from', 'demo', '--no-install']
    if (shape.clean) args.push('--clean') // #221: exercises the scan-BEFORE-clean ordering
    const r = spawnSync('node', args, { encoding: 'utf-8' })
    if (r.status !== 0) throw new Error(`CLI failed (exit ${r.status}):\n${r.stderr}`)
    return { manifest: JSON.parse(readFileSync(manifestPath, 'utf-8')), stderr: r.stderr }
}

function assert(ok, message) {
    if (!ok) throw new Error(message)
    console.log(`✓ ${message}`)
}

const rowOf = (m, sourceName) => {
    const found = Object.values(m.publicTypes).find((v) => v.name === sourceName)
    if (!found) throw new Error(`no row named ${sourceName}`)
    return found
}

function compileOut(label) {
    if (!CAN_COMPILE) { console.log(`• compile skipped (${label}): test/sandbox deps not installed`); return }
    const src = join(SANDBOX, 'src')
    for (const f of existsSync(src) ? readdirSync(src) : []) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    if (!existsSync(src)) mkdirSync(src, { recursive: true })
    for (const f of readdirSync(out)) if (f.endsWith('.res')) writeFileSync(join(src, f), readFileSync(join(out, f)))
    const r = spawnSync(join(SANDBOX, 'node_modules', '.bin', 'rescript'), ['build'], { cwd: SANDBOX, encoding: 'utf-8' })
    for (const f of readdirSync(src)) if (/\.res(\.mjs)?$/.test(f)) rmSync(join(src, f))
    assert(r.status === 0, `output compiles after ${label}\n${r.status !== 0 ? (r.stdout || '') + (r.stderr || '') : ''}`)
}

try {
    // 1. No cycle: two independent home modules.
    let m = run({ cycle: false }).manifest
    assert(rowOf(m, 'left').module === 'LeftTypes' && rowOf(m, 'right').module === 'RightTypes',
        'independent types get distinct home modules (LeftTypes, RightTypes)')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'both home modules are emitted')

    // Inject a historical leaf alias on `left`, so we can prove the former home re-exports EVERY
    // name (canonical + alias), not just the canonical. (P1b)
    for (const v of Object.values(m.publicTypes)) if (v.name === 'left') v.aliases = ['legacyLeft']
    writeFileSync(manifestPath, JSON.stringify(m, null, 2) + '\n')

    // 2. Cycle forms: the SCC merges the homes; each prior home survives as a compat re-export file.
    m = run({ cycle: true }).manifest
    const merged = rowOf(m, 'left').module
    assert(merged !== 'LeftTypes' && merged === rowOf(m, 'right').module,
        'a dependency cycle merges both homes into one module')
    assert(rowOf(m, 'left').formerModules.includes('LeftTypes') && rowOf(m, 'right').formerModules.includes('RightTypes'),
        'each identity records its former home in the manifest')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'the prior home files are NOT deleted — they survive as compatibility modules')
    assert(readFileSync(join(out, 'LeftTypes.res'), 'utf-8').includes(`type left = ${merged}.left`),
        'the former home re-exports the moved type (LeftTypes.left keeps resolving)')
    assert(readFileSync(join(out, 'LeftTypes.res'), 'utf-8').includes(`type legacyLeft = ${merged}.legacyLeft`),
        'the former home also re-exports the historical alias (LeftTypes.legacyLeft keeps resolving)')
    assert(readFileSync(join(out, 'RightTypes.res'), 'utf-8').includes(`type right = ${merged}.right`),
        'the former home re-exports the moved type (RightTypes.right keeps resolving)')
    compileOut('cycle forms')

    // 3. Idempotent: a re-run with the cycle still present changes nothing.
    const snap = readFileSync(manifestPath, 'utf-8')
    m = run({ cycle: true }).manifest
    assert(readFileSync(manifestPath, 'utf-8') === snap, 'manifest is byte-identical on a cycle re-run')

    // 4. Cycle dissolves: the manifest lock pins the merged home (no churn back), and the prior-home
    //    compat files persist — every historical qualified path still resolves and compiles.
    m = run({ cycle: false }).manifest
    assert(rowOf(m, 'left').module === merged, 'the merged home is pinned by the lock even after the cycle dissolves (no re-churn)')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'former-home compatibility files persist after the cycle dissolves')
    compileOut('cycle dissolves')

    // 5. A former home that becomes LIVE and depends on the merged module can't be re-exported into
    //    without forming a new cycle — the unsafe re-export is skipped (warned), and output compiles. (P1a)
    const res = run({ cycle: false, leftLocalDep: true })
    assert(/former-home compatibility re-export\(s\) skipped/.test(res.stderr),
        'a cycle-forming former-home re-export is skipped with a warning')
    const leftFile = readFileSync(join(out, 'LeftTypes.res'), 'utf-8')
    assert(leftFile.includes('newThing') && !leftFile.includes(`= ${merged}.left`),
        'the now-live former home keeps its live type and drops only the cycle-forming re-export')
    compileOut('former home becomes live and depends on the merge')

    // 6. Two former homes that re-export EACH OTHER must not close a cycle. The reachability guard
    //    folds each approved edge in, so the second (cycle-forming) re-export is skipped. (P1a sibling-edge)
    rmSync(out, { recursive: true, force: true })
    let mm = run({ cycle: false }).manifest
    for (const v of Object.values(mm.publicTypes)) {
        if (v.name === 'left') { v.module = 'RightTypes'; v.formerModules = ['LeftTypes'] }
        if (v.name === 'right') { v.module = 'LeftTypes'; v.formerModules = ['RightTypes'] }
    }
    writeFileSync(manifestPath, JSON.stringify(mm, null, 2) + '\n')
    const swap = run({ cycle: false })
    assert(/former-home compatibility re-export\(s\) skipped/.test(swap.stderr),
        'mutually cross-pointing former-home re-exports skip the cycle-forming one')
    compileOut('mutual cross-pointing former homes')

    // 7. #220: a #190-LOCKED merged home that becomes the LARGEST member of a GROWN SCC must KEEP its
    //    name, not compound to `…SharedSharedTypes` (the #35 `+SharedTypes` rule applied to an already-
    //    merged name). Fresh out dir: form + lock the Left/Right merge, then add a third home that cycles
    //    into it so the SCC grows with the locked merged home as its largest member.
    rmSync(out, { recursive: true, force: true })
    run({ cycle: true })                                   // form the merge
    const merged7 = rowOf(run({ cycle: true }).manifest, 'left').module // now locked
    assert(/SharedTypes$/.test(merged7) && !/SharedSharedTypes$/.test(merged7),
        `baseline merged home is a single-Shared name (${merged7})`)
    const grownM = run({ cycle: true, third: true }).manifest
    const grown = rowOf(grownM, 'left').module
    assert(grown === merged7,
        `locked merged home keeps its name when the SCC grows (stayed ${merged7})`)
    assert(!/SharedSharedTypes$/.test(grown),
        `merged home does not compound to a doubled …SharedSharedTypes (got ${grown})`)
    assert(rowOf(grownM, 'mid').module === grown,
        `the third (mid) type is homed into the same merged module (${grown})`)
    compileOut('SCC grows around a locked merged home (#220)')

    // 8. #221: a home move across a PRE-#190 boundary (previous manifest has no `publicTypes`) recovers
    //    the former home from the prior `.res` on disk — and does so UNDER `--clean`, which deletes that
    //    prior output first, so the scan MUST run before the clean. (blend-rescript's `generate:raw`
    //    always passes `--clean`.) The scan is scoped to `*Types.res` shared modules, so the per-component
    //    `View.res` `props` leaf is never a former-home candidate (no noise, no false shim).
    rmSync(out, { recursive: true, force: true })
    run({ cycle: false })                                  // beta.1-style: `left` in LeftTypes, `right` in RightTypes
    const legacy = JSON.parse(readFileSync(manifestPath, 'utf-8'))
    delete legacy.publicTypes; delete legacy.schemaVersion // simulate a legacy files-only (pre-#190) manifest
    writeFileSync(manifestPath, JSON.stringify(legacy, null, 2) + '\n')
    const boot = run({ cycle: true, clean: true })         // warm + --clean: both relocate to the merged home
    const mergedB = rowOf(boot.manifest, 'left').module
    assert(mergedB !== 'LeftTypes' && mergedB === rowOf(boot.manifest, 'right').module,
        'the shared types relocated to the merged home across the legacy boundary')
    assert((rowOf(boot.manifest, 'left').formerModules || []).includes('LeftTypes') &&
           (rowOf(boot.manifest, 'right').formerModules || []).includes('RightTypes'),
        'former homes recovered from prior .res (no manifest registry) and recorded in the manifest (#221)')
    assert(existsSync(join(out, 'LeftTypes.res')) &&
           readFileSync(join(out, 'LeftTypes.res'), 'utf-8').includes(`type left = ${mergedB}.left`),
        'the former home re-export is emitted under --clean (scan ran BEFORE the clean deleted LeftTypes.res)')
    assert(/recovered \d+ former home/.test(boot.stderr), 'the disk-recovered relocation is surfaced in the logs')
    compileOut('legacy bootstrap under --clean (#221)')
    // Idempotent: the manifest now carries publicTypes+formerModules, so a second --clean run is byte-identical.
    const snap2 = readFileSync(manifestPath, 'utf-8')
    run({ cycle: true, clean: true })
    assert(readFileSync(manifestPath, 'utf-8') === snap2, 'idempotent after bootstrap — no churn on the next run (#221)')

    console.log('\n✅ cycle-forced module-move compatibility invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
