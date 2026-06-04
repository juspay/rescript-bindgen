import { extractComponent } from '../src/extract.mjs'
import { report } from '../src/emit.mjs'
import { readdirSync, existsSync } from 'fs'
import { join } from 'path'
const PKG='@juspay/blend-design-system'
const compDir = new URL('../.bindgen-cache/node_modules/@juspay/blend-design-system/dist/components/', import.meta.url).pathname
const dirs = readdirSync(compDir,{withFileTypes:true}).filter(d=>d.isDirectory()).map(d=>d.name)
const rows=[]
for(const name of dirs){
  const entry=[join(compDir,name,`${name}.d.ts`),join(compDir,name,'index.d.ts')].find(existsSync)
  if(!entry) continue
  try{
    const ir=extractComponent(entry,{from:PKG,importName:name})
    if(!ir.props.length) continue
    const rep=report(ir)
    const own=ir.props.filter(p=>!p.inherited)
    const ownLoose=rep.loose.filter(l=>own.find(p=>p.name===l.prop)).length
    const ownDefect=rep.defects.filter(l=>own.find(p=>p.name===l.prop)).length
    const precise=ir.props.length-rep.loose.length-rep.defects.length
    rows.push({name,total:ir.props.length,own:own.length,precise,loose:rep.loose.length,defects:rep.defects.length,
      ownPrecise:own.length-ownLoose-ownDefect, ownLoose, ownDefect})
  }catch{}
}
// grade on OWN props (the component's real API, ignoring repeated HTML/aria spread)
const grade=r=> r.ownDefect>0 ? 'C (has defects)' : r.ownLoose===0 ? 'A (fully precise)' : (r.ownLoose/r.own<=0.25?'B (mostly precise)':'B- (several loose)')
rows.sort((a,b)=> (a.ownDefect-b.ownDefect)|| (b.ownLoose/b.own - a.ownLoose/a.own))
console.log('Per-component quality on OWN props (blend-specific API; HTML/ARIA spread excluded):\n')
console.log('COMPONENT'.padEnd(20),'own'.padStart(4),'precise'.padStart(8),'loose'.padStart(6),'defect'.padStart(7),'  grade')
for(const r of rows) console.log(r.name.padEnd(20),String(r.own).padStart(4),String(r.ownPrecise).padStart(8),String(r.ownLoose).padStart(6),String(r.ownDefect).padStart(7),'  '+grade(r))
const A=rows.filter(r=>grade(r).startsWith('A')).length, B=rows.filter(r=>grade(r).startsWith('B')).length, C=rows.filter(r=>grade(r).startsWith('C')).length
console.log(`\nSUMMARY: ${rows.length} components | A(fully precise own-props): ${A} | B(some loose): ${B} | C(defects): ${C}`)
