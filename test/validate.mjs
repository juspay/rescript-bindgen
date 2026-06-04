// Generate ALL blend components and compile them. One command, PASS/FAIL.
import { execSync } from 'child_process'
import { readdirSync } from 'fs'
const here = new URL('.', import.meta.url).pathname
console.log('① Generating bindings from blend .d.ts …')
execSync(`node ${here}batch.mjs`, { stdio: 'inherit' })
console.log('\n② Compiling all generated bindings with ReScript 12 …')
try {
  execSync('npx rescript clean && npx rescript build', { cwd: `${here}sandbox`, stdio: 'pipe' })
  const n = readdirSync(`${here}sandbox/src`).filter(f => f.endsWith('.res.mjs')).length
  const total = readdirSync(`${here}sandbox/src`).filter(f => f.endsWith('.res')).length
  console.log(`\n✅ PASS — ${n}/${total} generated bindings compiled cleanly on ReScript 12.`)
} catch (e) {
  console.log('\n❌ FAIL — compile errors:\n')
  console.log((e.stdout?.toString() || '') + (e.stderr?.toString() || ''))
  process.exit(1)
}
