// Self-contained smoke test — no network, no blend install required.
// Writes a tiny .d.ts fixture, extracts + emits, and asserts the output
// contains the expected ReScript constructs.
import { extractComponent } from '../src/extract.mjs'
import { emit, report } from '../src/emit.mjs'
import { writeFileSync, mkdtempSync } from 'fs'
import { join } from 'path'
import { tmpdir } from 'os'

// Self-contained fixture — no external (react) imports, so it resolves anywhere.
const dir = mkdtempSync(join(tmpdir(), 'bindgen-smoke-'))
const file = join(dir, 'Widget.d.ts')
writeFileSync(file, `
type JsxElement = { __brand: 'element' };
export declare const Widget: (props: {
  label?: string;
  count?: number;
  size?: 'sm' | 'md' | 'lg';
  width?: string | number;
  tags?: string | string[];
  "aria-checked"?: boolean | "false" | "mixed" | "true";
  "aria-disabled"?: boolean | "false" | "true";
}) => JsxElement;
export default Widget;
`)

const ir = extractComponent(file, { from: 'demo', importName: 'Widget' })
const code = emit(ir)
const rep = report(ir)

const checks = [
  ['string-literal union -> variant', /@as\("sm"\) Sm/.test(code)],
  ['count number -> int (name heuristic)', /~count: int=\?/.test(code)],
  ['string|number -> @unboxed (structural name)', /@unboxed type stringOrNumber = Str\(string\) \| Num\(float\)/.test(code)],
  ['string|string[] -> @unboxed (structural name)', /@unboxed type stringOrStringArray = Str\(string\) \| StrArr\(array<string>\)/.test(code)],
  ['aria-checked -> JsxDOM poly variant', /~ariaChecked: \[#"true" \| #"false" \| #mixed\]=\?/.test(code)],
  ['aria-disabled -> bool', /~ariaDisabled: bool=\?/.test(code)],
  ['external make binding', /@module\("demo"\) @react\.component/.test(code)],
  ['no %identity anywhere', !/%identity/.test(code)],
  ['no defects', rep.defects.length === 0],
]

let ok = true
for (const [name, pass] of checks) {
  console.log(`${pass ? '✓' : '✗'} ${name}`)
  if (!pass) ok = false
}
if (!ok) { console.error('\nSMOKE TEST FAILED\n\n--- generated ---\n' + code); process.exit(1) }
console.log('\n✅ smoke test passed')
