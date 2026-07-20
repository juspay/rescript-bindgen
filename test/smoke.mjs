// Self-contained smoke test — no network, no blend install required.
// Writes a tiny .d.ts fixture, extracts + emits, and asserts the output
// contains the expected ReScript constructs.
import { extractComponent, extractModule, shapeHash, structuralSig } from '../src/extract.mjs'
import { emit, emitClass, emitFunction, report } from '../src/emit.mjs'
import { typesEntry, packageEntries } from '../src/resolve.mjs'
import { writeFileSync, mkdtempSync, mkdirSync } from 'fs'
import { dirname, join, relative } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

// #104: build a throwaway package dir (package.json + the given `.d.ts` files) and return the entry
// path `typesEntry` resolves, RELATIVE to the package dir — so the entry-resolution matrix (exports
// map / typesVersions) is asserted offline without installs.
function resolvePkg(pkgJson, dtsFiles) {
    const d = mkdtempSync(join(tmpdir(), 'bindgen-resolve-'))
    writeFileSync(join(d, 'package.json'), JSON.stringify(pkgJson))
    for (const rel of dtsFiles) {
        const p = join(d, rel)
        mkdirSync(dirname(p), { recursive: true })
        writeFileSync(p, 'export declare const x: number\n')
    }
    const entry = typesEntry(d)
    return entry ? relative(d, entry).split('\\').join('/') : null
}

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
  ...(() => {
    // Compound-component statics (#100): siblings bind through the parent via @scope, the parent
    // carries zero-cost aliases, non-component statics are reported, flat exports dedupe, and
    // nested statics get a scope PATH.
    const cs = extractModule(join(here, 'golden', 'cases', 'compound-component-statics', 'index.d.ts'), { from: 'demo' })
    const menu = cs.components.find((c) => c.name === 'Menu')
    const item = cs.components.find((c) => c.name === 'MenuItem')
    const row = cs.components.find((c) => c.name === 'TableSummaryRow')
    const sel = cs.components.find((c) => c.name === 'Select')
    return [
      ['compound statics bind through the parent scope', !!item && item.ir.import.scope === 'Menu' && item.ir.import.jsName === 'Item'],
      ['parent carries zero-cost aliases', !!menu && (menu.ir.statics || []).map((s) => `${s.member}=${s.target}`).join() === 'Divider=MenuDivider,Item=MenuItem'],
      ['non-component static is reported, not silent', cs.skipped.some((s) => s.name === 'Menu.VERSION' && s.reason === 'compound-static-not-a-component')],
      ['flat-exported static dedupes to an alias', !cs.components.some((c) => c.name === 'SelectOption2') && (sel?.ir.statics || []).some((s) => s.member === 'Option' && s.target === 'SelectOption')],
      ['nested static carries a scope path', !!row && Array.isArray(row.ir.import.scope) && row.ir.import.scope.join('.') === 'Table.Summary' && row.ir.import.jsName === 'Row'],
    ]
  })(),
  ...(() => {
    // Shared-base props records (#82) + transitive HtmlAttrs detection (#130): the attrs
    // surface is found through alias/Omit indirection, pure named intersection parts spread as
    // shared records, a shadowed base falls back inline, and single-alias props stay legacy.
    const sb = extractModule(join(here, 'golden', 'cases', 'shared-base-records', 'index.d.ts'), { from: 'demo' })
    const avatar = sb.components.find((c) => c.name === 'SkeletonAvatar')
    const badge = sb.components.find((c) => c.name === 'SkeletonBadge')
    const plain = sb.components.find((c) => c.name === 'Plain')
    const spreadTos = (c) => (c?.ir.baseSpreads || []).map((b) => b.ref.to).sort().join()
    return [
      ['attrs leaf found through alias + Omit indirection', !!avatar && avatar.ir.attrsBase?.leaf === 'htmlAttributes' && avatar.ir.attrsBase.removed.join() === 'children,color'],
      ['pure named intersection parts spread as shared records', spreadTos(avatar) === 'baseSkeletonProps,styledBlockProps'],
      ['shadowed base falls back inline, unshadowed still spreads', spreadTos(badge) === 'styledBlockProps' && badge.ir.props.some((p) => p.name === 'loading')],
      ['single-alias props stay legacy labeled args', !!plain && !(plain.ir.baseSpreads || []).length && !plain.ir.attrsBase],
    ]
  })(),
  ...(() => {
    // Error-`any` from an unresolvable import (#107): flagged placeholder, never a silent `'a`;
    // author-written `any` keeps the implicit-generic salvage.
    const ea = extractModule(join(here, 'golden', 'cases', 'error-any-unresolved', 'index.d.ts'), { from: 'demo' })
    const tp = ea.components.find((c) => c.name === 'ThemeProvider')
    const ft = tp && tp.ir.props.find((p) => p.name === 'foundationTokens')
    const gt = ea.functions.find((f) => f.name === 'getTabsTokens')
    const la = ea.functions.find((f) => f.name === 'legitAny')
    return [
      ['error-any prop is a flagged placeholder, not a silent type var', !!ft && ft.type.kind === 'any' && ft.type.unresolved === true],
      ['error-any function param is flagged too', !!gt && gt.ir.sig.params[0].type.kind === 'any' && gt.ir.sig.params[0].type.unresolved === true && /DOES NOT RESOLVE/.test(emitFunction(gt.ir))],
      ['author-written any keeps the implicit generic', !!la && la.ir.sig.params[0].type.kind === 'typeVar'],
    ]
  })(),
  ...(() => {
    // Deep report imperfection (#133): a defect reached only THROUGH a shared type surfaces on the
    // carrying component and elevates it to 🔍 REVIEW at most (never 🛑 broken); recursive shared
    // records don't loop; without the registry the report keeps its old shallow behavior.
    const sd = extractModule(join(here, 'golden', 'cases', 'shared-defect-report', 'index.d.ts'), { from: 'demo' })
    const panel = sd.components.find((c) => c.name === 'Panel')
    const tree = sd.components.find((c) => c.name === 'Tree')
    const deepRep = panel ? report(panel.ir, sd.shared) : { review: [], defects: [] }
    const shallowRep = panel ? report(panel.ir) : { review: [{}], defects: [] }
    const treeRep = tree ? report(tree.ir, sd.shared) : { defects: [{}], review: [{}] }
    return [
      ['nested shared-type defect elevates the component to review, not broken', deepRep.defects.length === 0 && deepRep.review.some((d) => d.prop === 'config' && d.nested?.some((n) => n.owner === 'config' && n.field === 'theme' && n.unresolved))],
      ['without the registry the shallow walk is unchanged (usable)', shallowRep.review.length === 0 && shallowRep.defects.length === 0],
      ['recursive shared record stays clean and does not loop', treeRep.defects.length === 0 && treeRep.review.length === 0],
    ]
  })(),
  ...(() => {
    // #90: the stable-name hash is derived from STRUCTURE only, so an identical shape hashes the
    // same across compiler versions / unrelated upstream edits (both renumber `type.id`, which the
    // entry keys embed). Build the same 2-entry shape under two totally different key-numberings
    // (and different name suffixes) and confirm the structural hash is identical — the id-based
    // `entrySig`/`recordSig` would differ.
    const mk = (a, b) => {
      const inner = { key: 'id:' + b, kind: 'record', base: 'inner', name: 'inner' + b, home: 'T', fields: [{ name: 'x', optional: false, type: { kind: 'string' } }] }
      const outer = { key: 'id:' + a, kind: 'record', base: 'outer', name: 'outer' + a, home: 'T', fields: [{ name: 'self', optional: true, type: { kind: 'typeRef', to: 'outer' + a, key: 'id:' + a } }, { name: 'inner', optional: false, type: { kind: 'typeRef', to: inner.name, key: inner.key } }] }
      return { byKey: new Map([[inner.key, inner], [outer.key, outer]]), outer }
    }
    const r1 = mk(10, 11)        // ids 10/11
    const r2 = mk(9002, 137)     // totally different ids + name suffixes, SAME shape (incl. a self-ref cycle)
    const h1 = shapeHash(structuralSig(r1.outer, r1))
    const h2 = shapeHash(structuralSig(r2.outer, r2))
    // control: a genuinely different shape must hash differently
    const diff = mk(10, 11); diff.outer.fields[1].optional = true
    // #90 rev: two records identical EXCEPT a field referencing a distinct-BASE but structurally-
    // identical (broken) entry — base-ui's `rootMenuStore…` vs `triggerMenuStore…` — must hash apart
    // (the referenced entry's stable base discriminates), else they'd collide onto a counter.
    const brokenRef = (refBase) => {
      const leaf = { key: 'id:5', kind: 'opaque', base: refBase, name: refBase, home: 'T' } // both broken/leaf → same shape
      const rec = { key: 'id:6', kind: 'record', base: 'store', name: 'store', home: 'T', fields: [{ name: 'use', optional: false, type: { kind: 'typeRef', to: refBase, key: 'id:5' } }] }
      return { byKey: new Map([[leaf.key, leaf], [rec.key, rec]]), rec }
    }
    const root = brokenRef('rootMenuStoreUseSyncedValue'), trig = brokenRef('triggerMenuStoreUseSyncedValue')
    // #90 rev: a bare opaque field distinguished only by its TS type text must also hash apart
    const opaqueRec = (text) => ({ kind: 'record', base: 'r', name: 'r', home: 'T', key: 'id:'+text, fields: [{ name: 'x', optional: false, type: { kind: 'opaque', text } }] })
    return [
      ['#90: identical shape hashes identically across id renumbering', h1 === h2],
      ['#90: a different shape still hashes differently', shapeHash(structuralSig(diff.outer, diff)) !== h1],
      ['#90 rev: distinct-base broken-typed field discriminates (no false collision)', shapeHash(structuralSig(root.rec, root)) !== shapeHash(structuralSig(trig.rec, trig))],
      ['#90 rev: opaque field distinguished by its TS type text', shapeHash(structuralSig(opaqueRec('RootState'), { byKey: new Map() })) !== shapeHash(structuralSig(opaqueRec('TriggerState'), { byKey: new Map() }))],
    ]
  })(),
  ...(() => {
    // #101: a React CLASS component (`extends Component<P>` / render()) binds as a @react.component
    // from its Props, not an unusable @new/@send class module; a plain class stays a class.
    const rc = extractModule(join(here, 'golden', 'cases', 'react-class-component', 'index.d.ts'), { from: 'demo' })
    const slider = rc.components.find((c) => c.name === 'Slider')
    const legacy = rc.components.find((c) => c.name === 'Legacy')
    return [
      ['#101: class component binds as @react.component with real props', !!slider && slider.ir.kind === 'react-component' && slider.ir.props.some((p) => p.name === 'value')],
      ['#101: PureComponent + render-fallback also detected', rc.components.some((c) => c.name === 'Badge') && !!legacy && legacy.ir.props.some((p) => p.name === 'title')],
      ['#101: a plain non-React class stays a @new/@send class', rc.classes.some((c) => c.name === 'Store') && !rc.components.some((c) => c.name === 'Store')],
      // rev: a render()+ctor class that does NOT extend Component must NOT be mistaken for a component
      ['#101 rev: render()-only class (no Component heritage) is NOT a false-positive component', rc.classes.some((c) => c.name === 'ChartWidget') && !rc.components.some((c) => c.name === 'ChartWidget')],
    ]
  })(),
  ...(() => {
    // #109 batch: ambient-module-only entry (crash → binds), Array-heritage → array, numeric index →
    // Dict, symbol-keyed props skipped with a note.
    const amb = extractModule(join(here, 'golden', 'cases', 'ambient-module-only', 'index.d.ts'), { from: 'demo' })
    const cp = extractModule(join(here, 'golden', 'cases', 'coverage-papercuts', 'index.d.ts'), { from: 'demo' })
    const list = cp.components.find((c) => c.name === 'List')
    const grid = cp.components.find((c) => c.name === 'Grid')
    const widget = cp.components.find((c) => c.name === 'Widget')
    const t = (p) => p && p.type
    return [
      ['#109.1: ambient-module-only .d.ts binds (no crash)', amb.functions.some((f) => f.name === 'doThing')],
      ['#109.2: interface extends Array<T> → array', !!list && t(list.ir.props.find((p) => p.name === 'items'))?.kind === 'array'],
      ['#109.2 rev: declaration-merged Array-extender keeps its merged field (no array-flatten)', (() => { const m = cp.components.find((c) => c.name === 'Merged'); return !!m && t(m.ir.props.find((p) => p.name === 'm'))?.kind !== 'array' })()],
      ['#109.6: numeric index signature → dict', !!grid && t(grid.ir.props.find((p) => p.name === 'cells'))?.kind === 'dict'],
      ['#109.3: symbol-keyed prop skipped + noted, real props kept', !!widget && (widget.ir.symbolProps || []).length === 1 && widget.ir.props.some((p) => p.name === 'visible') && !widget.ir.props.some((p) => /^__@/.test(p.name))],
      ['#144: Array-extending hybrid record has NO spurious domProps spread', (() => { const e = cp.shared.entries.find((x) => x.name === 'mergedList'); return !!e && e.spread == null && e.fields.some((f) => f.name === 'extra') })()],
      ['#144: ReadonlyArray-extending hybrid keeps own field, no spread', (() => { const e = cp.shared.entries.find((x) => x.name === 'roHybrid'); return !!e && e.spread == null && e.fields.some((f) => f.name === 'label') })()],
      ['#144: pure ReadonlyArray extender → array', (() => { const ro = cp.components.find((c) => c.name === 'Ro'); return !!ro && t(ro.ir.props.find((p) => p.name === 'pure'))?.kind === 'array' })()],
    ]
  })(),
  ...(() => {
    // #109 batch 2: class statics/setters (#4), top-level overloads (#8).
    const cs = extractModule(join(here, 'golden', 'cases', 'class-statics-setters', 'index.d.ts'), { from: 'demo' })
    const widget = cs.classes.find((c) => c.name === 'Widget')
    const ov = extractModule(join(here, 'golden', 'cases', 'top-level-overloads', 'index.d.ts'), { from: 'demo' })
    const names = (n) => ov.functions.filter((f) => f.ir.import.jsName === n).map((f) => f.name)
    return [
      ['#109.4: static method + static value bind (via @scope)', !!widget && (widget.ir.staticMethods || []).some((m) => m.jsName === 'create') && (widget.ir.staticValues || []).some((v) => v.jsName === 'VERSION')],
      ['#109.4: read-write accessor emits a setter; get-only does not', !!widget && (widget.ir.setters || []).some((s) => s.jsName === 'value') && !(widget.ir.setters || []).some((s) => s.jsName === 'id')],
      ['#109.4: write-only accessor emits a setter but NO getter', !!widget && (widget.ir.setters || []).some((s) => s.jsName === 'token') && !(widget.ir.getters || []).some((g) => g.jsName === 'token')],
      ['#109.4: static id disambiguated from a colliding instance method', !!widget && emitClass(widget.ir).includes('external resetStatic:') && emitClass(widget.ir).includes('@send external reset:')],
      ['#109.8: both overloads bind, sharing one JS name', names('parse').length === 2 && names('parse').includes('parse') && names('parse').includes('parseWithRadix')],
      ['#109.8: same-arity-different-type overloads stay distinct', names('wrap').length === 2],
    ]
  })(),
  ...(() => {
    // #104: entry resolution via the `exports` map and `typesVersions`.
    return [
      ['#104: `types` field still wins (regression)', resolvePkg({ types: './t/main.d.ts', exports: { '.': { types: './other.d.ts' } } }, ['t/main.d.ts', 'other.d.ts']) === 't/main.d.ts'],
      ['#104: exports `.` subpath map, `types` condition', resolvePkg({ exports: { '.': { types: './types/api.d.ts', default: './index.mjs' }, './sub': { types: './sub.d.ts' } } }, ['types/api.d.ts']) === 'types/api.d.ts'],
      ['#104: exports bare condition object (no `.` key)', resolvePkg({ exports: { types: './dist/index.d.ts', import: './dist/index.mjs' } }, ['dist/index.d.ts']) === 'dist/index.d.ts'],
      ['#104: exports nested `import.types` (.d.mts dual-emit)', resolvePkg({ exports: { '.': { import: { types: './esm/index.d.mts', default: './esm/index.mjs' } } } }, ['esm/index.d.mts']) === 'esm/index.d.mts'],
      ['#104: runtime-only exports falls through to conventions', resolvePkg({ exports: { '.': { default: './index.mjs' } } }, ['index.d.ts']) === 'index.d.ts'],
      ['#104: typesVersions `*` glob remap', resolvePkg({ types: 'index.d.ts', typesVersions: { '>=4': { '*': ['ts4/*'] } } }, ['ts4/index.d.ts']) === 'ts4/index.d.ts'],
      ['#104: main .mjs swapped to .d.ts (no other entry)', resolvePkg({ main: './dist/index.mjs' }, ['dist/index.d.ts']) === 'dist/index.d.ts'],
    ]
  })(),
  ...(() => {
    // #120: bare `Function` → JsFn.t; that unblocks the `boolean|Config` union.
    const raw = (n) => !!n && n.kind === 'raw' && n.res === 'JsFn.t'
    const bf = extractModule(join(here, 'golden', 'cases', 'bare-function', 'index.d.ts'), { from: 'demo' })
    const step = bf.shared.entries.find((e) => e.name === 'stepOptions')
    const chart = bf.components.find((c) => c.name === 'Chart')
    const bc = extractModule(join(here, 'golden', 'cases', 'bool-config-union', 'index.d.ts'), { from: 'demo' })
    const aoo = bc.shared.entries.find((e) => e.name === 'animationOptionsObject')
    const uni = bc.shared.entries.find((e) => e.kind === 'unboxed' && e.name === 'boolOrAnimationOptionsObject')
    return [
      ['#120: bare Function record fields → JsFn.t (raw, perfect)', !!step && raw(step.fields.find((f) => f.name === 'complete')?.type) && raw(step.fields.find((f) => f.name === 'step')?.type)],
      ['#120: top-level bare Function prop → JsFn.t, sets usesJsFn', !!chart && raw(chart.ir.props.find((p) => p.name === 'proj4')?.type) && bf.shared.usesJsFn === true],
      ['#120: Config record with Function fields materializes past-depth', !!aoo && raw(aoo.fields.find((f) => f.name === 'step')?.type)],
      ['#120: boolean|Config union → @unboxed Bool(bool) | Options', !!uni && (uni.members || []).some((m) => m.ctor === 'Bool')],
    ]
  })(),
  ...(() => {
    // #147: subpath binding — one program + one shared registry over multiple entries, each binding
    // stamped with its own subpath `@module`; a type shared across subpaths is emitted ONCE.
    const d = join(here, 'golden', 'cases', 'subpath-binding')
    const res = extractModule(join(d, 'index.d.ts'), { from: 'demo', entries: [
      { from: 'demo', entry: join(d, 'index.d.ts') },
      { from: 'demo/styles', entry: join(d, 'styles.d.ts') },
    ] })
    const btn = res.components.find((c) => c.name === 'Button')
    const ct = res.functions.find((f) => f.name === 'createTheme')
    // the exports-subpath enumerator: `./styles`/`./button` -> suffixes, CSS/wildcard skipped
    const subs = packageEntries(d).map((e) => e.suffix).sort()
    // re-export: `.` + `./button` expose the SAME Button symbol -> bound ONCE, keeping @module("demo")
    const re = extractModule(join(d, 'index.d.ts'), { from: 'demo', entries: [
      { from: 'demo', entry: join(d, 'index.d.ts') }, { from: 'demo/button', entry: join(d, 'button.d.ts') },
    ] })
    // collision: `.` + `./alt` expose DIFFERENT Button symbols -> main wins, the other is REPORTED
    const col = extractModule(join(d, 'index.d.ts'), { from: 'demo', entries: [
      { from: 'demo', entry: join(d, 'index.d.ts') }, { from: 'demo/alt', entry: join(d, 'alt.d.ts') },
    ] })
    return [
      ['#147: main entry binding keeps @module("demo")', !!btn && btn.ir.import.from === 'demo'],
      ['#147: subpath binding gets @module("demo/styles")', !!ct && ct.ir.import.from === 'demo/styles'],
      ['#147: type shared across subpaths is emitted ONCE', res.shared.entries.filter((e) => e.name === 'theme').length === 1],
      ['#147: enumerator returns main + concrete subpaths (CSS/wildcard skipped)', subs.length === 3 && subs.includes('') && subs.includes('/styles') && subs.includes('/button')],
      ['#147: re-export across subpaths binds ONCE as the main entry, no skip', re.components.filter((c) => c.name === 'Button').length === 1 && re.components.find((c) => c.name === 'Button').ir.import.from === 'demo' && !re.skipped.some((s) => s.name === 'Button')],
      ['#147: same-name DIFFERENT symbol across subpaths is reported, not silent', col.components.filter((c) => c.name === 'Button').length === 1 && col.skipped.some((s) => s.name === 'Button' && /shadowed/.test(s.reason))],
    ]
  })(),
]

let ok = true
for (const [name, pass] of checks) {
  console.log(`${pass ? '✓' : '✗'} ${name}`)
  if (!pass) ok = false
}
if (!ok) { console.error('\nSMOKE TEST FAILED\n\n--- generated ---\n' + code); process.exit(1) }
console.log('\n✅ smoke test passed')
