import ts from 'typescript'
import { writeFileSync, mkdtempSync } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'

// 1) a tiny .d.ts to learn on
const dir = mkdtempSync(join(tmpdir(), 'tsdemo-'))
const file = join(dir, 'Box.d.ts')
writeFileSync(file, `
export declare const Box: (props: {
  label: string;
  size?: 'sm' | 'lg';
  width?: string | number;
}) => any;
`)

const line = (s='') => console.log(s)
line('════════ STEP 1: boot the TypeScript compiler ════════')
const program = ts.createProgram([file], { strict:false, skipLibCheck:true })
const checker = program.getTypeChecker()
line('ts.createProgram(...)  → a Program (the whole compilation)')
line('program.getTypeChecker() → the checker (the brain)')
line()

line('════════ STEP 2: get the file as a SYMBOL, ask its exports ════════')
const src = program.getSourceFile(file)
const moduleSym = checker.getSymbolAtLocation(src)
const exports = checker.getExportsOfModule(moduleSym)
line('checker.getExportsOfModule(file) → ' + JSON.stringify(exports.map(e => e.getName())))
line()

line('════════ STEP 3: take the `Box` SYMBOL → its TYPE ════════')
const boxSym = exports.find(e => e.getName() === 'Box')
line('boxSym.getName()         → "' + boxSym.getName() + '"   (this is a SYMBOL = a name)')
const boxType = checker.getTypeOfSymbolAtLocation(boxSym, boxSym.valueDeclaration)
line('getTypeOfSymbolAtLocation→ "' + checker.typeToString(boxType) + '"   (this is a TYPE = what it is)')
line()

line('════════ STEP 4: a component is a function → grab its props param ════════')
const sig = boxType.getCallSignatures()[0]
const propsSym = sig.parameters[0]
line('boxType.getCallSignatures()[0].parameters[0] → the "' + propsSym.getName() + '" parameter (a SYMBOL)')
const propsType = checker.getTypeOfSymbolAtLocation(propsSym, propsSym.valueDeclaration)
line('its TYPE → "' + checker.typeToString(propsType) + '"')
line()

line('════════ STEP 5: ask the checker for the flat PROPERTY list ════════')
const props = checker.getPropertiesOfType(propsType)
line('checker.getPropertiesOfType(props) → ' + JSON.stringify(props.map(p => p.getName())))
line()

line('════════ STEP 6: inspect each prop (name, optional?, type, flags) ════════')
for (const p of props) {
  const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
  const t = checker.getTypeOfSymbolAtLocation(p, p.valueDeclaration)
  const f = t.flags
  const kinds = []
  if (f & ts.TypeFlags.String) kinds.push('String')
  if (f & ts.TypeFlags.Number) kinds.push('Number')
  if (f & ts.TypeFlags.Union)  kinds.push('Union')
  line(`• ${p.getName().padEnd(7)} optional=${optional}  type="${checker.typeToString(t)}"  flags=[${kinds.join(',')}]`)
  if (t.isUnion && t.isUnion()) {
    for (const m of t.types) {
      const v = m.isStringLiteral && m.isStringLiteral() ? `  value="${m.value}"` : ''
      line(`      └ member: "${checker.typeToString(m)}"${v}`)
    }
  }
}
