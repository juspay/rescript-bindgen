import ts from 'typescript'
import { writeFileSync, mkdtempSync } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'

const dir = mkdtempSync(join(tmpdir(), 'tsnest-'))
const file = join(dir, 'Card.d.ts')
writeFileSync(file, `
export declare enum Variant { PRIMARY = 'primary', DANGER = 'danger' }

export declare const Card: (props: {
  title: string;
  variant?: Variant;                          // enum
  tags?: string[];                            // array
  ids?: (string | number)[];                  // array of union
  onClose?: () => void;                        // callback, no arg
  onPick?: (id: number) => void;               // callback with arg
  style?: {                                    // nested object
    color?: string;
    size?: number;
  };
  author?: {                                   // DEEPLY nested object
    name: string;
    contact?: { email: string };
  };
  items?: { id: string; count: number }[];     // array of objects
}) => any;
`)

const program = ts.createProgram([file], { strict:false, skipLibCheck:true })
const checker = program.getTypeChecker()
const src = program.getSourceFile(file)
const boxSym = checker.getExportsOfModule(checker.getSymbolAtLocation(src)).find(e => e.getName() === 'Card')
const boxType = checker.getTypeOfSymbolAtLocation(boxSym, boxSym.valueDeclaration)
const propsType = checker.getTypeOfSymbolAtLocation(boxType.getCallSignatures()[0].parameters[0], boxSym.valueDeclaration)

// Recursive walker — mirrors how classify() drills into nested types.
function walk(type, indent, label) {
  const f = type.flags
  const pad = '  '.repeat(indent)
  // figure out the "kind"
  if (f & ts.TypeFlags.String)  return console.log(`${pad}${label}: string`)
  if (f & ts.TypeFlags.Number)  return console.log(`${pad}${label}: number`)
  if (f & ts.TypeFlags.EnumLike){
    const vals = (type.isUnion?.() ? type.types : [type]).map(m => m.value).filter(v=>v!=null)
    return console.log(`${pad}${label}: ENUM [${vals.join(', ')}]`)
  }
  if (checker.isArrayType?.(type)) {
    console.log(`${pad}${label}: ARRAY of ↓`)
    return walk(checker.getTypeArguments(type)[0], indent+1, 'element')
  }
  if (type.getCallSignatures().length) {
    const sig = type.getCallSignatures()[0]
    const params = sig.getParameters()
    console.log(`${pad}${label}: FUNCTION (${params.length} param) → ${checker.typeToString(sig.getReturnType())}`)
    params.forEach(p => walk(checker.getTypeOfSymbolAtLocation(p, p.valueDeclaration), indent+1, 'arg '+p.getName()))
    return
  }
  if (f & ts.TypeFlags.Union) {
    console.log(`${pad}${label}: UNION of ↓`)
    return type.types.forEach((m,i)=>walk(m, indent+1, 'member'+i))
  }
  const sym = type.getSymbol()
  if ((f & ts.TypeFlags.Object) && type.getProperties().length) {
    console.log(`${pad}${label}: OBJECT { ↓`)
    for (const p of type.getProperties()) {
      const opt = (p.getFlags() & ts.SymbolFlags.Optional) ? '?' : ''
      walk(checker.getTypeOfSymbolAtLocation(p, p.valueDeclaration || boxSym.valueDeclaration), indent+1, p.getName()+opt)
    }
    return console.log(`${pad}}`)
  }
  console.log(`${pad}${label}: ${checker.typeToString(type)}`)
}

console.log('Card props (drilling into every nested type):\n')
for (const p of checker.getPropertiesOfType(propsType)) {
  const opt = (p.getFlags() & ts.SymbolFlags.Optional) ? '?' : ''
  walk(checker.getTypeOfSymbolAtLocation(p, p.valueDeclaration), 0, p.getName()+opt)
}
