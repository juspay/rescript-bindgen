// Generate one component's binding to stdout, by name.
// Usage: npm run gen Button
import { extractComponent } from '../src/extract.mjs'
import { emit, report } from '../src/emit.mjs'
import { existsSync } from 'fs'
import { join } from 'path'

const DIST = '/Users/roshan.chourasiya/work/FE/opensource/blend-rescript/node_modules/@juspay/blend-design-system/dist/components'
const name = process.argv[2]
if (!name) { console.error('Usage: npm run gen <ComponentName>   e.g. npm run gen Button'); process.exit(1) }
const file = [join(DIST, name, `${name}.d.ts`), join(DIST, name, 'index.d.ts')].find(existsSync)
if (!file) { console.error(`No .d.ts found for "${name}" under ${DIST}`); process.exit(1) }

const ir = extractComponent(file, { from: '@juspay/blend-design-system', importName: name })
const rep = report(ir)
console.error(`\n// ── ${name}: ${ir.props.length} props, ${ir.enums.length} enums, ${rep.loose.length} loose, ${rep.defects.length} defects ──`)
if (rep.defects.length) console.error(`// DEFECTS (unknown/any — fix upstream in blend): ${rep.defects.join(', ')}`)
if (rep.loose.length) console.error(`// LOOSE (fell back to string, review): ${rep.loose.join(', ')}`)
console.error('')
console.log(emit(ir))
