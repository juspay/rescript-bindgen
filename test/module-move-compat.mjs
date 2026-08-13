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
// `cycle` toggles whether Right refers back to Left — the edge that makes the two homes one SCC.
function writeSources({ cycle }) {
    writeFileSync(join(pkg, 'components', 'left', 'types.d.ts'),
        `import { Right } from '../right/types'\nexport interface Left { name: string; r?: Right }\n`)
    writeFileSync(join(pkg, 'components', 'right', 'types.d.ts'),
        cycle
            ? `import { Left } from '../left/types'\nexport interface Right { name: string; l?: Left }\n`
            : `export interface Right { name: string }\n`)
    writeFileSync(join(pkg, 'index.d.ts'),
        `import { Left } from './components/left/types'\nimport { Right } from './components/right/types'\n` +
        `type JsxElement = { __brand: 'element' }\n` +
        `export declare const View: (props: { left?: Left; right?: Right }) => JsxElement\n`)
}

function run(shape) {
    writeSources(shape)
    const r = spawnSync('node', [CLI, '--dir', pkg, '--out', out, '--from', 'demo', '--no-install'], { encoding: 'utf-8' })
    if (r.status !== 0) throw new Error(`CLI failed (exit ${r.status}):\n${r.stderr}`)
    return JSON.parse(readFileSync(manifestPath, 'utf-8'))
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
    let m = run({ cycle: false })
    assert(rowOf(m, 'left').module === 'LeftTypes' && rowOf(m, 'right').module === 'RightTypes',
        'independent types get distinct home modules (LeftTypes, RightTypes)')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'both home modules are emitted')

    // 2. Cycle forms: the SCC merges the homes; each prior home survives as a compat re-export file.
    m = run({ cycle: true })
    const merged = rowOf(m, 'left').module
    assert(merged !== 'LeftTypes' && merged === rowOf(m, 'right').module,
        'a dependency cycle merges both homes into one module')
    assert(rowOf(m, 'left').formerModules.includes('LeftTypes') && rowOf(m, 'right').formerModules.includes('RightTypes'),
        'each identity records its former home in the manifest')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'the prior home files are NOT deleted — they survive as compatibility modules')
    assert(readFileSync(join(out, 'LeftTypes.res'), 'utf-8').includes(`type left = ${merged}.left`),
        'the former home re-exports the moved type (LeftTypes.left keeps resolving)')
    assert(readFileSync(join(out, 'RightTypes.res'), 'utf-8').includes(`type right = ${merged}.right`),
        'the former home re-exports the moved type (RightTypes.right keeps resolving)')
    compileOut('cycle forms')

    // 3. Idempotent: a re-run with the cycle still present changes nothing.
    const snap = readFileSync(manifestPath, 'utf-8')
    m = run({ cycle: true })
    assert(readFileSync(manifestPath, 'utf-8') === snap, 'manifest is byte-identical on a cycle re-run')

    // 4. Cycle dissolves: the manifest lock pins the merged home (no churn back), and the prior-home
    //    compat files persist — every historical qualified path still resolves and compiles.
    m = run({ cycle: false })
    assert(rowOf(m, 'left').module === merged, 'the merged home is pinned by the lock even after the cycle dissolves (no re-churn)')
    assert(existsSync(join(out, 'LeftTypes.res')) && existsSync(join(out, 'RightTypes.res')),
        'former-home compatibility files persist after the cycle dissolves')
    compileOut('cycle dissolves')

    console.log('\n✅ cycle-forced module-move compatibility invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
