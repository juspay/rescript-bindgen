// Self-contained smoke test — no network, no blend install required.
// Writes a tiny .d.ts fixture, extracts + emits, and asserts the output
// contains the expected ReScript constructs.
import { extractComponent, extractModule } from '../src/extract.mjs'
import { emit, emitClass, emitFunction, report } from '../src/emit.mjs'
import { writeFileSync, mkdtempSync } from 'fs'
import { dirname, join } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

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

// Variadic externals (#105): a rest param is required array metadata in the IR, not an optional
// labeled arg. Homogeneous rests emit `@variadic`; heterogeneous tuple rests are explicitly skipped.
const here = dirname(fileURLToPath(import.meta.url))
const rest = extractModule(join(here, 'golden', 'cases', 'rest-parameters', 'index.d.ts'), { from: 'demo' })
const collect = rest.functions.find((f) => f.name === 'collect')
const configure = rest.functions.find((f) => f.name === 'configure')
const variadicBox = rest.classes.find((c) => c.name === 'VariadicBox')
const bus = rest.classes.find((c) => c.name === 'Bus')
const tupleCtor = rest.classes.find((c) => c.name === 'TupleCtor')
const collectCode = collect ? emitFunction(collect.ir) : ''
const configureCode = configure ? emitFunction(configure.ir) : ''
const classCode = variadicBox ? emitClass(variadicBox.ir) : ''
const busCode = bus ? emitClass(bus.ir) : ''
const tupleCtorCode = tupleCtor ? emitClass(tupleCtor.ir) : ''

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
  ['rest param is variadic, not optional', collect?.ir.sig.params[0]?.rest === true && collect.ir.sig.params[0].optional === false],
  ['rest-only function emits @variadic', /@module\("demo"\) @variadic external collect: array<string>/.test(collectCode)],
  ['optional-before-rest has no unit sentinel', /\(~label: string=\?, array<bool>\)/.test(configureCode) && !/array<bool>, unit/.test(configureCode)],
  ['class constructor/method emit @variadic', /@new @module\("demo"\) @variadic/.test(classCode) && /@send @variadic external append/.test(classCode)],
  ['heterogeneous tuple rest is explicitly skipped', rest.skipped.some((s) => s.name === 'mixed' && s.reason.includes('unsupported-rest-parameter'))],
  ['bad tuple-rest method keeps class siblings', /external make:/.test(busCode) && /external on:/.test(busCode) && /external close:/.test(busCode) && !/external emit:/.test(busCode)],
  ['bad tuple-rest method is reported', rest.skipped.some((s) => s.name === 'Bus.emit' && s.reason.includes('unsupported-rest-parameter'))],
  ['bad tuple-rest constructor keeps class methods', !/external make:/.test(tupleCtorCode) && /external info:/.test(tupleCtorCode)],
  ['bad tuple-rest constructor is reported', rest.skipped.some((s) => s.name === 'TupleCtor.constructor' && s.reason.includes('unsupported-rest-parameter'))],
]

let ok = true
for (const [name, pass] of checks) {
  console.log(`${pass ? '✓' : '✗'} ${name}`)
  if (!pass) ok = false
}
if (!ok) { console.error('\nSMOKE TEST FAILED\n\n--- generated ---\n' + code); process.exit(1) }
console.log('\n✅ smoke test passed')
