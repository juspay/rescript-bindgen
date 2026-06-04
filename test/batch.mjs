import { extractComponent } from '../src/extract.mjs'
import { emit, report } from '../src/emit.mjs'
import { readdirSync, existsSync, writeFileSync, rmSync, mkdirSync } from 'fs'
import { join } from 'path'

const DIST = '/Users/roshan.chourasiya/work/FE/opensource/blend-rescript/node_modules/@juspay/blend-design-system/dist/components'
const OUT = new URL('./sandbox/src/', import.meta.url).pathname
rmSync(OUT, { recursive: true, force: true }); mkdirSync(OUT, { recursive: true })

const dirs = readdirSync(DIST, { withFileTypes: true }).filter(d => d.isDirectory()).map(d => d.name)
const results = []
for (const name of dirs) {
  const cand = [join(DIST, name, `${name}.d.ts`), join(DIST, name, 'index.d.ts')].find(existsSync)
  if (!cand) { results.push({ name, status: 'NO_DTS' }); continue }
  try {
    const ir = extractComponent(cand, { from: '@juspay/blend-design-system', importName: name })
    if (!ir.props.length) { results.push({ name, status: 'NO_PROPS' }); continue }
    const rep = report(ir)
    writeFileSync(join(OUT, `${name}.res`), emit(ir))
    results.push({ name, status: 'GEN', props: ir.props.length, enums: ir.enums.length, loose: rep.loose.length, defects: rep.defects.length })
  } catch (e) {
    results.push({ name, status: 'EXTRACT_ERR', err: e.message.split('\n')[0].slice(0,60) })
  }
}
const gen = results.filter(r => r.status === 'GEN')
console.log(`TOTAL dirs: ${dirs.length} | generated: ${gen.length} | no-props: ${results.filter(r=>r.status==='NO_PROPS').length} | extract-err: ${results.filter(r=>r.status==='EXTRACT_ERR').length}`)
console.log('--- non-generated ---')
for (const r of results.filter(r => r.status !== 'GEN')) console.log(`  ${r.status.padEnd(12)} ${r.name} ${r.err||''}`)
console.log('--- generated (loose/defect counts) ---')
for (const r of gen) console.log(`  ${r.name.padEnd(22)} props=${String(r.props).padStart(3)} enums=${String(r.enums).padStart(2)} loose=${String(r.loose).padStart(2)} defects=${r.defects}`)
