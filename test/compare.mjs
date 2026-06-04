// compare.mjs — SAME .d.ts, two ways of reading it:
//   (A) regex / string-matching   (what text-based generators do)
//   (B) the TypeScript compiler API (what rescript-bindgen does)
//
//   node test/compare.mjs
import ts from 'typescript'
import { writeFileSync, mkdtempSync } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'

// ── the input: two files, one imports the other and uses Omit ──────────────
const dir = mkdtempSync(join(tmpdir(), 'compare-'))

writeFileSync(join(dir, 'shared.d.ts'), `
export type Variant = 'primary' | 'secondary';
export type HtmlBits = {
  id?: string;
  className?: string;
  onClick?: () => void;
};
`)

const buttonFile = join(dir, 'Button.d.ts')
const buttonText = `import { Variant, HtmlBits } from './shared';
export type ButtonProps = {
  text: string;
  variant?: Variant;
} & Omit<HtmlBits, 'className'>;
`
writeFileSync(buttonFile, buttonText)

console.log('INPUT  Button.d.ts:')
console.log('────────────────────────────────────────────────────')
console.log(buttonText)
console.log('(plus shared.d.ts: Variant = "primary"|"secondary"; HtmlBits = {id, className, onClick})')
console.log('')

// ── (A) REGEX approach ─────────────────────────────────────────────────────
// Grab the `{ ... }` object body right after `= {`, then read its lines.
// It can only see literal text in THIS file — it can't follow the import or Omit.
function regexExtract(text) {
  const start = text.indexOf('= {')
  if (start < 0) return []
  let i = start + 2, depth = 0, body = ''
  for (; i < text.length; i++) {
    const ch = text[i]
    if (ch === '{') depth++
    else if (ch === '}') { depth--; if (depth === 0) break }
    if (depth >= 1 && ch !== '{') body += ch
  }
  return body
    .split('\n')
    .map((l) => l.trim())
    .filter((l) => /^\w+\??\s*:/.test(l))
    .map((l) => {
      const m = l.match(/^(\w+)(\??)\s*:\s*(.+?);?$/)
      return { name: m[1], optional: m[2] === '?', type: m[3].replace(/;$/, '') }
    })
}

console.log('(A) REGEX / text-matching sees:')
console.log('────────────────────────────────────────────────────')
for (const p of regexExtract(buttonText)) {
  console.log(`   • ${(p.name + (p.optional ? '?' : '')).padEnd(10)} : ${p.type}`)
}
console.log('   ✗ stops at the `}` — never expands `& Omit<HtmlBits, ...>`')
console.log('   ✗ `variant` type is just the word "Variant" — it cannot follow the import')
console.log('   ✗ missing: id, onClick (they live in the imported HtmlBits)')
console.log('')

// ── (B) COMPILER API approach ──────────────────────────────────────────────
console.log('(B) TypeScript compiler API sees:')
console.log('────────────────────────────────────────────────────')
const program = ts.createProgram([buttonFile], { strict: false, skipLibCheck: true })
const checker = program.getTypeChecker()
const src = program.getSourceFile(buttonFile)
const propsSym = checker.getExportsOfModule(checker.getSymbolAtLocation(src)).find((e) => e.getName() === 'ButtonProps')
const propsType = checker.getDeclaredTypeOfSymbol(propsSym)

for (const p of checker.getPropertiesOfType(propsType)) {
  const optional = (p.getFlags() & ts.SymbolFlags.Optional) ? '?' : ''
  const t = checker.getTypeOfSymbolAtLocation(p, src)
  // expand a type-alias union (Variant) into its real values
  let shown = checker.typeToString(t)
  if (t.isUnion && t.isUnion()) shown = t.types.map((m) => checker.typeToString(m)).join(' | ')
  console.log(`   • ${(p.getName() + optional).padEnd(10)} : ${shown}`)
}
console.log('   ✓ `Omit<HtmlBits, "className">` expanded → id + onClick included, className removed')
console.log('   ✓ followed the import → `variant` resolved to "primary" | "secondary"')
console.log('   ✓ the complete, real prop list')
