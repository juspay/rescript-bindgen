// #219 — a cold run (no prior .bindgen-manifest.json registry) silently discards the #190 lock. This drives
// the REAL CLI to assert the guardrails: a loud cold-run warning that fires only when an existing generation
// would be discarded (not on a first-ever run), a git guard for the committed-output/ignored-manifest
// misconfig (warn by default, fail under --require-manifest), and the `coldStart`/`compatModulesWritten`
// json-summary fields. Generated .res output is unchanged by all of this (goldens cover that).
import { spawnSync } from 'child_process'
import { existsSync, mkdtempSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync, unlinkSync } from 'fs'
import { dirname, join } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

const HERE = dirname(fileURLToPath(import.meta.url))
const CLI = join(dirname(HERE), 'src', 'cli.mjs')
const root = mkdtempSync(join(tmpdir(), 'bindgen-coldstart-'))
const assert = (ok, msg) => { if (!ok) throw new Error('FAIL: ' + msg); console.log('✓ ' + msg) }
const WARN = /no prior \.bindgen-manifest\.json registry — public names and module homes are UNLOCKED/

function scaffold(dir) {
    mkdirSync(join(dir, 'pkg'), { recursive: true })
    mkdirSync(join(dir, 'out'), { recursive: true })
    writeFileSync(join(dir, 'pkg', 'index.d.ts'),
        'export interface Box { size?: string | number }\n' +
        'export declare const View: (props: { box?: Box }) => { __brand: "el" }\n')
}
function gen(dir, extra = []) {
    const r = spawnSync('node', [CLI, '--dir', join(dir, 'pkg'), '--out', join(dir, 'out'), '--from', 'demo', '--no-install', ...extra], { encoding: 'utf-8' })
    return { status: r.status, stderr: r.stderr || '' }
}
const manifestPath = (dir) => join(dir, 'out', '.bindgen-manifest.json')
const canGit = spawnSync('git', ['--version'], { encoding: 'utf-8' }).status === 0

try {
    // ---- cold-run warning ----------------------------------------------------------------------------
    const A = join(root, 'warn'); scaffold(A)
    const r1 = gen(A)
    assert(r1.status === 0 && !WARN.test(r1.stderr), 'a first-ever run (no prior output) is quiet — nothing to discard')
    const r2 = gen(A)
    assert(!WARN.test(r2.stderr), 'a warm run (manifest present) is quiet')
    // Delete the manifest but keep the generated .res → the next run DISCARDS an existing generation.
    unlinkSync(manifestPath(A))
    const before = readFileSync(join(A, 'out', 'CommonTypes.res'), 'utf-8')
    const r3 = gen(A)
    assert(WARN.test(r3.stderr), 'a cold run WITH prior output on disk warns loudly (the #219 case)')
    assert(readFileSync(join(A, 'out', 'CommonTypes.res'), 'utf-8') === before, 'the cold run still produces the same .res (the warning is diagnostic only)')

    // ---- json-summary coldStart / compatModulesWritten -----------------------------------------------
    unlinkSync(manifestPath(A))
    gen(A, ['--json-summary', join(A, 'out', 's-cold.json')])
    const cold = JSON.parse(readFileSync(join(A, 'out', 's-cold.json'), 'utf-8'))
    assert(cold.coldStart === true && typeof cold.compatModulesWritten === 'number', 'json-summary reports coldStart:true on a cold run (+ compatModulesWritten)')
    gen(A, ['--json-summary', join(A, 'out', 's-warm.json')])  // manifest now present again
    const warm = JSON.parse(readFileSync(join(A, 'out', 's-warm.json'), 'utf-8'))
    assert(warm.coldStart === false, 'json-summary reports coldStart:false once the manifest is present')

    // ---- git guard -----------------------------------------------------------------------------------
    if (!canGit) {
        console.log('• git guard skipped: git not available')
    } else {
        const G = join(root, 'git'); scaffold(G)
        gen(G) // produce out/*.res + manifest
        const out = join(G, 'out')
        const git = (...a) => spawnSync('git', ['-C', out, ...a], { encoding: 'utf-8' })
        git('init', '-q')
        git('config', 'user.email', 't@t'); git('config', 'user.name', 't'); git('config', 'commit.gpgsign', 'false')
        // The exact misconfig: commit the .res, gitignore the manifest.
        writeFileSync(join(out, '.gitignore'), '.bindgen-manifest.json\n')
        git('add', '.gitignore'); git('add', '--', '*.res'); git('commit', '-q', '-m', 'bindings')
        const g1 = gen(G)
        assert(g1.status === 0 && /gitignored while generated \.res files are committed/.test(g1.stderr),
            'git guard WARNS (exit 0) when .res are committed but the manifest is gitignored')
        const g2 = gen(G, ['--require-manifest'])
        assert(g2.status !== 0 && /gitignored/.test(g2.stderr), '--require-manifest turns the misconfig into a hard failure (non-zero exit)')
        // Fix it: stop ignoring + track the manifest → silent.
        writeFileSync(join(out, '.gitignore'), '\n')
        git('add', '.gitignore'); git('add', '-f', '--', '.bindgen-manifest.json'); git('commit', '-q', '-m', 'track manifest')
        const g3 = gen(G, ['--require-manifest'])
        assert(g3.status === 0 && !/gitignored|untracked/.test(g3.stderr), 'a properly tracked manifest passes silently, even with --require-manifest')
    }

    console.log('\n✅ #219 cold-start guardrail invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
