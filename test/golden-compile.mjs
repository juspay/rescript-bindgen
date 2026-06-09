// ============================================================================
// golden-compile.mjs — proves the committed goldens are VALID ReScript.
//
// For each case it copies that case's `expected/*.res` into the test/sandbox
// rescript@12 project (in isolation — ReScript module names are global, so cases
// are built one at a time) and runs `npx rescript build`, asserting exit 0.
// A Webapi stub module is injected for cases that reference `Webapi.*` (the
// optional rescript-webapi dep is not installed in the sandbox).
//
// Run:   node test/golden-compile.mjs        (needs test/sandbox deps installed)
// ============================================================================
import { execSync } from 'child_process'
import { readdirSync, readFileSync, writeFileSync, rmSync, existsSync, statSync, mkdirSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'

const HERE = dirname(fileURLToPath(import.meta.url))
const CASES_DIR = join(HERE, 'golden', 'cases')
const SANDBOX = join(HERE, 'sandbox')
const SRC = join(SANDBOX, 'src')

const GREEN = (s) => `\x1b[32m${s}\x1b[0m`
const RED = (s) => `\x1b[31m${s}\x1b[0m`
const DIM = (s) => `\x1b[2m${s}\x1b[0m`

// Minimal stand-in for rescript-webapi (an optional dep, not installed here).
// Matches the shape the generator emits: `Webapi.File.t`, `Webapi.FileList.t`, …
const WEBAPI_STUB = `module File = {
  type t
}
module FileList = {
  type t
}
module FormData = {
  type t
}
`

if (!existsSync(join(SANDBOX, 'node_modules', 'rescript'))) {
    console.error(RED('test/sandbox deps not installed — run: npm --prefix test/sandbox ci || npm --prefix test/sandbox install'))
    process.exit(1)
}

const cases = readdirSync(CASES_DIR)
    .filter((n) => statSync(join(CASES_DIR, n)).isDirectory())
    .sort()

function wipeSrc() {
    if (!existsSync(SRC)) { mkdirSync(SRC, { recursive: true }); return }
    for (const f of readdirSync(SRC)) {
        if (f.endsWith('.res') || f.endsWith('.res.mjs')) rmSync(join(SRC, f))
    }
}

let failed = 0
for (const name of cases) {
    const expectedDir = join(CASES_DIR, name, 'expected')
    if (!existsSync(expectedDir)) continue
    const resFiles = readdirSync(expectedDir).filter((f) => f.endsWith('.res'))
    if (!resFiles.length) continue

    wipeSrc()
    let needsWebapi = false
    for (const f of resFiles) {
        const content = readFileSync(join(expectedDir, f), 'utf-8')
        if (/\bWebapi\./.test(content)) needsWebapi = true
        writeFileSync(join(SRC, f), content)
    }
    if (needsWebapi) writeFileSync(join(SRC, 'Webapi.res'), WEBAPI_STUB)

    try {
        // 2>&1 so warnings (printed to stderr, non-fatal) are captured even on exit 0.
        const out = execSync('npx rescript build 2>&1', { cwd: SANDBOX, encoding: 'utf-8' })
        const warnings = (out.match(/Warning number \d+/g) || [])
        if (warnings.length) {
            console.log(RED(`✗ ${name} — ${warnings.length} warning(s) (output should be clean)`))
            console.log(DIM(out.split('\n').filter((l) => /Warning number|\.res:/.test(l)).slice(0, 10).join('\n')))
            failed++
        } else {
            console.log(GREEN(`✓ ${name}`) + DIM(`  (${resFiles.length} file(s)${needsWebapi ? ' + Webapi stub' : ''})`))
        }
    } catch (e) {
        console.log(RED(`✗ ${name} — rescript build failed`))
        console.log(DIM((e.stdout || '').toString().split('\n').filter((l) => /[Ee]rror|Syntax|\.res:/.test(l)).slice(0, 12).join('\n')))
        failed++
    }
}

wipeSrc()
if (failed) {
    console.log(RED(`\n${failed} case(s) failed to compile.`))
    process.exit(1)
}
console.log(GREEN(`\n✅ all ${cases.length} golden case(s) compile on ReScript`))
