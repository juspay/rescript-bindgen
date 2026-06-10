// ============================================================================
// golden.mjs — snapshot test for the TS->ReScript mapping contract.
//
// For each case under test/golden/cases/<name>/ it runs the REAL CLI
// (`node src/cli.mjs --dir <case> ...`) into a temp dir and diffs the generated
// output against the committed `expected/` tree. A mismatch fails CI with a diff.
//
// Each case has:
//   index.d.ts   — a self-contained fixture (inline stubs + lib.dom, no installs)
//   args.json    — OPTIONAL { "from": "demo", "flags": ["--webapi"] }.
//                  Omit it for the default ({ from: "demo", flags: [] }); only add
//                  one when the case needs flags (e.g. --webapi).
//   expected/    — committed golden: *.res, *Types.res, _REPORT.md
//
// Run:   node test/golden.mjs            # verify (CI)
//        node test/golden.mjs --update   # regenerate goldens (UPDATE=1 also works)
//
// This is the executable half of the contract documented in docs/TYPE_MAPPING.md.
// Every new/changed mapping must add or update a case here.
// ============================================================================
import { execFileSync } from 'child_process'
import { mkdtempSync, mkdirSync, rmSync, readdirSync, readFileSync, writeFileSync, existsSync, statSync } from 'fs'
import { join, dirname } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'
import { GREEN, RED, DIM, readDir, diffDirs } from './lib/diff.mjs'

const HERE = dirname(fileURLToPath(import.meta.url))
const ROOT = dirname(HERE)
const CLI = join(ROOT, 'src', 'cli.mjs')
const CASES_DIR = join(HERE, 'golden', 'cases')
const UPDATE = process.argv.includes('--update') || process.env.UPDATE === '1'

/** List the case directories, sorted for stable ordering. */
function cases() {
    if (!existsSync(CASES_DIR)) return []
    return readdirSync(CASES_DIR)
        .filter((n) => statSync(join(CASES_DIR, n)).isDirectory())
        .sort()
}

/** Generate one case into `outDir` by invoking the real CLI. Returns stderr (logs). */
function generate(caseDir, outDir, args) {
    const flags = args.flags || []
    const from = args.from || 'demo'
    return execFileSync('node', [CLI, '--dir', caseDir, '--out', outDir, '--from', from, '--report', '--no-install', ...flags], {
        encoding: 'utf-8',
        stdio: ['ignore', 'pipe', 'pipe'],
    })
}

/** Assert the contract invariant: no `%identity` except on an opaque-module's zero-cost views —
 *  `external from*` constructors (concrete -> opaque) or `external as*` accessors (opaque ->
 *  concrete, e.g. the per-signature views of an overloaded function). */
function checkNoStrayIdentity(files, caseName, problems) {
    for (const [name, content] of files) {
        if (!name.endsWith('.res')) continue // _REPORT.md mentions "%identity" in prose
        content.split('\n').forEach((line, i) => {
            if (line.includes('%identity') && !/external\s+(from|as)\w+:/.test(line)) {
                problems.push(`${caseName}/${name}:${i + 1} — stray %identity outside an opaque-module from*/as* view: ${line.trim()}`)
            }
        })
    }
}

let failed = 0
let updated = 0
const names = cases()
if (!names.length) {
    console.error(RED('No golden cases found under test/golden/cases/. Author fixtures first.'))
    process.exit(1)
}

for (const name of names) {
    const caseDir = join(CASES_DIR, name)
    const argsPath = join(caseDir, 'args.json')
    const args = existsSync(argsPath) ? JSON.parse(readFileSync(argsPath, 'utf-8')) : {}
    const expectedDir = join(caseDir, 'expected')

    const tmp = mkdtempSync(join(tmpdir(), `golden-${name}-`))
    let stderr = ''
    try {
        stderr = generate(caseDir, tmp, args)
    } catch (e) {
        console.log(RED(`✗ ${name} — generator crashed`))
        console.log(DIM((e.stderr || e.message || '').toString().split('\n').slice(0, 8).join('\n')))
        rmSync(tmp, { recursive: true, force: true })
        failed++
        continue
    }

    const actual = readDir(tmp)
    // Drop nothing — every emitted file is part of the snapshot.
    const problems = []
    checkNoStrayIdentity(actual, name, problems)

    if (UPDATE) {
        rmSync(expectedDir, { recursive: true, force: true })
        mkdirSync(expectedDir, { recursive: true })
        for (const [fn, content] of actual) writeFileSync(join(expectedDir, fn), content)
        updated++
        console.log(GREEN(`↻ ${name} — wrote ${actual.size} file(s)`))
        rmSync(tmp, { recursive: true, force: true })
        if (problems.length) { problems.forEach((p) => console.log(RED('  ! ' + p))); failed++ }
        continue
    }

    const expected = readDir(expectedDir)
    const fileProblems = diffDirs(expected, actual)

    rmSync(tmp, { recursive: true, force: true })

    if (fileProblems.length || problems.length) {
        console.log(RED(`✗ ${name}`))
        fileProblems.forEach((p) => console.log('  ' + p))
        problems.forEach((p) => console.log(RED('  ! ' + p)))
        failed++
    } else {
        console.log(GREEN(`✓ ${name}`) + DIM(`  (${actual.size} file(s))`))
    }
}

if (UPDATE) {
    console.log(`\n${updated} case(s) updated.`)
    process.exit(failed ? 1 : 0)
}
if (failed) {
    console.log(RED(`\n${failed} golden case(s) failed.`) + DIM('  Run `node test/golden.mjs --update` to refresh if the change is intentional.'))
    process.exit(1)
}
console.log(GREEN(`\n✅ all ${names.length} golden case(s) match`))
