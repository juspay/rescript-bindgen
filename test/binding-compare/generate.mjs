// generate.mjs — ONE TypeScript source → TWO generated bindings:
//   Card.regex.res   (how a text/regex generator does it)
//   Card.bindgen.res (how rescript-bindgen does it — compiler API)
//
//   node test/binding-compare/generate.mjs
import ts from 'typescript'
import { extractComponent } from '../../src/extract.mjs'
import { emit } from '../../src/emit.mjs'
import { writeFileSync, mkdtempSync, readFileSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'
import { tmpdir } from 'os'

const HERE = dirname(fileURLToPath(import.meta.url))

// ── 1. the TypeScript source (with NESTED types, an import, and Omit) ──────
const dir = mkdtempSync(join(tmpdir(), 'bindcmp-'))

writeFileSync(join(dir, 'shared.d.ts'), `
export type Size = 'sm' | 'md' | 'lg';
export type BaseProps = { id?: string; className?: string };
`)

const cardText = `import { Size, BaseProps } from './shared';

export declare const Card: (props: {
  title: string;                                  // basic
  size?: Size;                                    // imported union
  width?: string | number;                        // multi-type
  tags?: string[];                                // array
  footer?: { text: string; onClose?: () => void };// NESTED object
  items?: { id: string; count: number }[];        // array of NESTED objects
} & Omit<BaseProps, 'className'>) => any;
`
const cardFile = join(dir, 'Card.d.ts')
writeFileSync(cardFile, cardText)
writeFileSync(join(HERE, 'Card.d.ts'), cardText) // keep a copy to look at

// ── 2. REGEX generator (text-based; mimics how a regex tool works) ─────────
function regexGenerate(text) {
  // grab the object body up to the brace that closes the `= { ... }`
  const start = text.indexOf('(props: {') + 'props: '.length
  let i = start, depth = 0, body = ''
  for (; i < text.length; i++) {
    const ch = text[i]
    if (ch === '{') { depth++; if (depth === 1) continue }
    if (ch === '}') { depth--; if (depth === 0) break }
    body += ch
  }
  const lines = body.split('\n').map((l) => l.replace(/\/\/.*$/, '').trim()).filter((l) => /^\w+\??\s*:/.test(l))
  const types = [], props = []
  for (const l of lines) {
    const m = l.match(/^(\w+)(\??)\s*:\s*(.+?);?$/); if (!m) continue
    const [, name, q, ty] = m
    const opt = q === '?' ? '=?' : ''
    let res
    if (ty === 'string') res = 'string'
    else if (ty === 'number') res = 'int'
    else if (ty === 'boolean') res = 'bool'
    else if (/^string\[\]$/.test(ty)) res = 'array<string>'
    else if (/\|/.test(ty) && /'/.test(ty)) res = `[${ty.split('|').map((p) => '#' + p.trim().replace(/'/g, '')).join(' | ')}]`
    else if (ty === 'string | number') { // multi-type → TAGGED variant (no @unboxed)
      types.push(`type ${name}Value =\n  | String(string)\n  | Int(int)  // ⚠️ tagged, no @unboxed → wrong value at runtime`)
      res = `${name}Value`
    } else if (/^\{/.test(ty)) { res = 'JSON.t  // ⚠️ nested object — regex can\'t resolve it reliably' }
    else if (/^[A-Z]/.test(ty)) { res = ty.charAt(0).toLowerCase() + ty.slice(1) + '  // ⚠️ imported type — dangling ref, undefined' }
    else res = 'string'
    props.push(`  ~${name}: ${res}${opt},`)
  }
  return `// ── REGEX / text-based output ──
${types.join('\n')}

@module("demo") @react.component
external make: (
${props.join('\n')}
  // ⚠️ MISSING: id (lives in Omit<BaseProps> — never expanded)
  // ⚠️ MISSING: items resolved shape, footer fields (nested not parsed)
) => React.element = "Card"
`
}

// ── 3. OUR generator (compiler API) ────────────────────────────────────────
const ir = extractComponent(cardFile, { from: 'demo', importName: 'Card' })
const ours = '// ── rescript-bindgen output (compiler API) ──\n' + emit(ir)
const theirs = regexGenerate(cardText)

writeFileSync(join(HERE, 'Card.regex.res'), theirs)
writeFileSync(join(HERE, 'Card.bindgen.res'), ours)

const sep = '═'.repeat(60)
console.log('SOURCE  test/binding-compare/Card.d.ts:')
console.log(sep); console.log(cardText); console.log(sep)
console.log('\n(A) Card.regex.res  — text-based:\n'); console.log(theirs)
console.log(sep)
console.log('\n(B) Card.bindgen.res — compiler API (ours):\n'); console.log(ours)
