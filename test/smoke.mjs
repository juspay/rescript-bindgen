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

// CommonJS `export =` (#102): resolve the assigned module value in addition to the namespace/static
// members returned by getExportsOfModule, then reuse the normal function/class emitters.
const cjsCallable = extractModule(join(here, 'golden', 'cases', 'export-equals-callable', 'index.d.ts'), { from: 'demo' })
const cx = cjsCallable.functions.find((f) => f.name === 'cx')
const bind = cjsCallable.functions.find((f) => f.name === 'bind')
const cxCode = cx ? emitFunction(cx.ir) : ''
const cjsClass = extractModule(join(here, 'golden', 'cases', 'export-equals-class', 'index.d.ts'), { from: 'demo' })
const counter = cjsClass.classes.find((c) => c.name === 'Counter')
const counterCode = counter ? emitClass(counter.ir) : ''
// clsx shape: the merged namespace re-exposes the root under its own name. That member's real JS
// name works under BOTH module systems (`require("clsx").clsx`), while the synthetic root's
// `= "default"` is undefined under a CommonJS target — the named member must win the dedup.
const cjsMerged = extractModule(join(here, 'golden', 'cases', 'export-equals-merged-callable', 'index.d.ts'), { from: 'demo' })
const mergedClsx = cjsMerged.functions.find((f) => f.name === 'clsx')
const mergedClsxCode = mergedClsx ? emitFunction(mergedClsx.ir) : ''

// Callable-with-properties (#103): the value is a function AND an object — modelled as an opaque
// module (asFn view + @get/@send accessors), never a bare arrow type that drops the object side.
const cwp = extractModule(join(here, 'golden', 'cases', 'callable-with-properties', 'index.d.ts'), { from: 'demo' })
const cwpT = cwp.functions.find((f) => f.name === 't')
const cwpClient = cwp.functions.find((f) => f.name === 'client')
const cwpTCode = cwpT ? emitFunction(cwpT.ir) : ''
const cwpTranslator = cwp.shared && cwp.shared.entries.find((e) => e.variant === 'callable' && e.name === 'Translator')
const cwpClientEntry = cwp.shared && cwp.shared.entries.find((e) => e.variant === 'callable' && e.name === 'Client')

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
  ['export= callable keeps root + namespace member', !!cx && !!bind && /= "default"/.test(cxCode)],
  ['export= class uses normal class pipeline', /external make:/.test(counterCode) && /external increment: \(t,/.test(counterCode) && /external value: t/.test(counterCode)],
  ['same-named namespace member beats export= root', /= "clsx"/.test(mergedClsxCode) && !/= "default"/.test(mergedClsxCode) && cjsMerged.functions.length === 1],
  ['callable-with-props binds as typed value, not bare fn', !!cwpT?.ir.value && cwpT.ir.value.type.kind === 'typeRef' && cwpT.ir.value.type.to === 'Translator.t'],
  ['callable module carries asFn view + prop accessors', !!cwpTranslator && cwpTranslator.sigs[0].accessor === 'asFn' && cwpTranslator.props.map((p) => p.jsName).join() === 'locale,setLocale'],
  ['untypeable carried prop is flagged, not faked', !!cwpClientEntry && !cwpClientEntry.props.some((p) => p.jsName === 'debug') && /NOT bound[^\n]*debug/.test(cwpClientEntry.note)],
  ['self-returning method resolves through the registry', !!cwpClientEntry && cwpClientEntry.props.some((p) => p.fn && p.fn.ret && p.fn.ret.kind === 'typeRef' && p.fn.ret.to === 'Client.t')],
  ['value binding surfaces the ⓘ note', /ⓘ was callable-with-properties `Translator`/.test(cwpTCode)],
  ['phantom brand marker does not reroute a plain callable', (() => { const s = cwp.functions.find((f) => f.name === 'stamp'); return !!s && !s.ir.value && !!s.ir.sig })()],
]

let ok = true
for (const [name, pass] of checks) {
  console.log(`${pass ? '✓' : '✗'} ${name}`)
  if (!pass) ok = false
}
if (!ok) { console.error('\nSMOKE TEST FAILED\n\n--- generated ---\n' + code); process.exit(1) }
console.log('\n✅ smoke test passed')
