import { extractComponent } from '../src/extract.mjs'
import { emit, report } from '../src/emit.mjs'
const file = process.argv[2]
const ir = extractComponent(file, { from: '@juspay/blend-design-system' })
const code = emit(ir)
const rep = report(ir)
console.error(`// enums=${ir.enums.length} records=${ir.records.length} props=${ir.props.length} loose=${rep.loose.length} defects=${rep.defects.length}`)
if (rep.defects.length) console.error('// DEFECTS (unknown/any):', rep.defects.join(', '))
console.log(code)
