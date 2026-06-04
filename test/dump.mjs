import { extractComponent } from '../src/extract.mjs'
const file = process.argv[2]
const ir = extractComponent(file, { from: '@juspay/blend-design-system' })
console.log(JSON.stringify(ir, null, 2))
