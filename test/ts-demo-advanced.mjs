// Advanced: how the TypeScript checker flattens INTERSECTIONS (A & B) and
// resolves GENERICS / Omit — the things you can't see in the raw text.
//
//   node test/ts-demo-advanced.mjs
import ts from 'typescript'
import { writeFileSync, mkdtempSync } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'

const dir = mkdtempSync(join(tmpdir(), 'tsadv-'))
const file = join(dir, 'Widget.d.ts')
writeFileSync(file, `
type Base = { id: string; className?: string };
type Clickable = { onClick?: () => void; disabled?: boolean };

// INTERSECTION: Base & Clickable & { variant: string }
type OwnProps = Base & Clickable & { variant: 'a' | 'b' };

// Omit: drop 'className' from the combined type
type FinalProps = Omit<OwnProps, 'className'> & { extra?: number };

export declare const Widget: (props: FinalProps) => any;

// GENERIC: a Record and an Array<Record<...>>
export declare const Table: (props: {
  rows: Array<Record<string, number>>;
  lookup?: Record<string, string>;
}) => any;
`)

const program = ts.createProgram([file], { strict: false, skipLibCheck: true })
const checker = program.getTypeChecker()
const src = program.getSourceFile(file)
const exps = checker.getExportsOfModule(checker.getSymbolAtLocation(src))

// Resolve prop types AT THE COMPONENT'S declaration (what the real tool does) —
// Omit-synthesized props don't have a reliable declaration of their own.
let LOC
function propsOf(name) {
  const sym = exps.find((e) => e.getName() === name)
  LOC = sym.valueDeclaration
  const t = checker.getTypeOfSymbolAtLocation(sym, LOC)
  const pt = checker.getTypeOfSymbolAtLocation(t.getCallSignatures()[0].parameters[0], LOC)
  return pt
}

console.log('════════ INTERSECTION + Omit: `Widget` ════════')
console.log('The .d.ts text says:  props: FinalProps')
console.log('   = Omit<Base & Clickable & {variant}, "className"> & {extra}')
console.log('')
console.log('But getPropertiesOfType resolves it to a FLAT list:')
const wp = propsOf('Widget')
for (const p of checker.getPropertiesOfType(wp)) {
  const opt = (p.getFlags() & ts.SymbolFlags.Optional) ? '?' : ''
  const t = checker.getTypeOfSymbolAtLocation(p, LOC)
  // which source type did each prop come from?
  const fromDecl = p.declarations?.[0]?.parent
  console.log(`   • ${(p.getName() + opt).padEnd(12)} : ${checker.typeToString(t)}`)
}
console.log('   → note: `className` is GONE (Omit applied), `id`/`onClick`/`variant`/`extra` all merged.')
console.log('')

console.log('════════ GENERICS: `Table` ════════')
const tp = propsOf('Table')
for (const p of checker.getPropertiesOfType(tp)) {
  const opt = (p.getFlags() & ts.SymbolFlags.Optional) ? '?' : ''
  const t = checker.getTypeOfSymbolAtLocation(p, LOC)
  console.log(`   • ${(p.getName() + opt).padEnd(8)} : ${checker.typeToString(t)}`)
  if (checker.isArrayType(t)) {
    const elem = checker.getTypeArguments(t)[0]
    console.log(`        └ array element: ${checker.typeToString(elem)}`)
    const args = checker.getTypeArguments(elem)
    if (args?.length) console.log(`             └ Record<${args.map((a) => checker.typeToString(a)).join(', ')}>  (key, value resolved)`)
  } else {
    const args = checker.getTypeArguments(t)
    if (args?.length) console.log(`        └ Record<${args.map((a) => checker.typeToString(a)).join(', ')}>  (key, value resolved)`)
  }
}
console.log('   → the checker unwrapped Array<...> and Record<K,V> into their real inner types.')
