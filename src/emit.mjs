// ============================================================================
// emit.mjs — STAGE 3 of the pipeline: IR  ->  ReScript 12 source code.
//
// Takes the neutral data object (the IR) produced by extract.mjs and prints
// actual ReScript text in the house style of the juspay-portal bindings:
//   - string-literal unions / enums  ->  `@as` variants
//   - multi-type props               ->  `@unboxed` untagged variants
//   - the component itself           ->  `@module @react.component external make`
// `emit()` returns the source string; `report()` summarises the unmapped props.
// This file knows ReScript but nothing about TypeScript — the split is deliberate.
// ============================================================================

/** ReScript keywords that can't be used bare as identifiers/labels (we suffix `_`). */
const RESERVED = new Set([
    'type', 'and', 'as', 'open', 'let', 'rec', 'in', 'switch', 'if', 'else',
    'for', 'while', 'fun', 'mutable', 'try', 'catch', 'exception', 'module',
    'external', 'when', 'with', 'lazy', 'assert', 'true', 'false', 'include',
    'constraint', 'private', 'of', 'to', 'downto',
])

/**
 * Prop names whose `number` type should become ReScript `int` (counts/indices),
 * not `float`. TypeScript has only `number`, so this is a best-effort heuristic.
 */
const INT_BY_NAME = new Set([
    'width', 'height', 'size', 'count', 'index', 'length', 'offset', 'zIndex',
    'tabIndex', 'maxLength', 'minLength', 'duration', 'rows', 'cols', 'span',
    'colSpan', 'rowSpan', 'level', 'step', 'min', 'max',
])

/**
 * Convert a kebab-case name to camelCase, e.g. `aria-label` -> `ariaLabel`.
 * @param {string} name
 * @returns {string}
 */
function camelFromKebab(name) {
    return name.replace(/-([a-z])/g, (_, c) => c.toUpperCase()).replace(/-/g, '')
}

/**
 * Turn a TypeScript prop name into a valid ReScript labelled-argument identifier,
 * plus an optional `@as("...")` to preserve the real JS prop name.
 *
 * Examples: `text` -> `{as:null, id:"text"}` ·
 * `type` (reserved) -> `{as:"type", id:"type_"}` ·
 * `aria-label` -> `{as:"aria-label", id:"ariaLabel"}`.
 *
 * @param {string} name  the original prop name from the .d.ts
 * @returns {{ as: string | null, id: string }}  `as` = the `@as` value (or null), `id` = the ReScript identifier
 */
function label(name) {
    const isPlainIdent = /^[a-z_][a-zA-Z0-9_]*$/.test(name)
    if (isPlainIdent && !RESERVED.has(name)) return { as: null, id: name }
    if (RESERVED.has(name)) return { as: name, id: name + '_' }
    // Anything else (kebab `aria-label`, PascalCase `CustomizedDot`, etc.):
    // emit @as with the original name and a safe lowercase-leading id.
    let id = camelFromKebab(name).replace(/[^a-zA-Z0-9_]/g, '_')
    id = id.charAt(0).toLowerCase() + id.slice(1)
    if (!/^[a-z_]/.test(id)) id = '_' + id
    if (RESERVED.has(id)) id = id + '_'
    return { as: name, id }
}

/**
 * Pick `int` or `float` for a `number` prop, using the name heuristic above.
 * @param {string} propName
 * @returns {'int' | 'float'}
 */
function numberType(propName) {
    return INT_BY_NAME.has(propName) ? 'int' : 'float'
}

/**
 * Render one IR type node into a ReScript type string (recursively).
 * This is the inverse of extract.mjs's `classify` — IR kind -> ReScript syntax.
 *
 * @param {object} t        an IR type node, e.g. `{kind:'array', of:{kind:'string'}}`
 * @param {string} propName the owning prop's name (used for the int/float heuristic)
 * @param {{refType:string, opaqueFallback:string}} cfg  emission config
 * @returns {string}        e.g. `"array<string>"`, `"ReactEvent.Mouse.t => unit"`
 */
function renderType(t, propName, cfg) {
    switch (t.kind) {
        case 'string': return 'string'
        // verbatim ReScript type (e.g. aria poly variants from JsxDOM) — passed through as-is
        case 'raw': return t.res
        // untagged-variant members force float (JS can't untag int vs float)
        case 'number': return t._float ? 'float' : numberType(propName)
        case 'boolean': return 'bool'
        case 'reactElement': return 'React.element'
        // a component-valued prop: `React.component<propsRecord>`
        case 'reactComponent': return `React.component<${renderType(t.of, propName, cfg)}>`
        case 'style': return 'JsxDOM.style'
        case 'date': return 'Date.t'
        case 'domElement': return 'Dom.element'
        case 'domRef': return cfg.refType
        // a ReScript type variable from a generic component (`T` -> `'a`)
        case 'typeVar': return t.name
        // typeRef: in module mode `cfg.resolveRef` qualifies it by its final module
        // (e.g. `MenuTypes.menuItemType`); single-file mode emits the bare local name.
        // A generic record carries `tparams` -> `name<'a>`.
        case 'typeRef': {
            const base = cfg.resolveRef ? cfg.resolveRef(t) : t.to
            return t.tparams && t.tparams.length ? `${base}<${t.tparams.join(', ')}>` : base
        }
        case 'stringOrNumber': return '[#String(string) | #Number(float)]'
        case 'array': return `array<${renderType(t.of, propName, cfg)}>`
        case 'dict': return `Dict.t<${renderType(t.of, propName, cfg)}>`
        case 'callback': {
            const render1 = (p) => (p.kind === 'event' ? p.res : renderType(p, propName, cfg))
            const ps = !t.params || t.params.length === 0 ? 'unit' : t.params.map(render1).join(', ')
            const ret = renderType(t.ret || { kind: 'unit' }, propName, cfg)
            return (t.params && t.params.length > 1) ? `(${ps}) => ${ret}` : `${ps} => ${ret}`
        }
        case 'unit': return 'unit'
        // loose fallback — compiles & is usable, flagged in the report.
        case 'opaque': return cfg.opaqueFallback
        // multi-type union we won't hack with %identity — placeholder + flagged for review.
        case 'review': return cfg.opaqueFallback
        // hard defects — should be fixed upstream, never silently typed.
        case 'unknown':
        case 'any': return cfg.opaqueFallback
        default: return cfg.opaqueFallback
    }
}

/**
 * Render a whole component IR into ReScript 12 source text.
 *
 * Emits, in order: enum (`@as`) type declarations, `@unboxed` untagged-variant
 * declarations (for multi-type props), record type declarations (for nested
 * objects), then the `@module @react.component external make(...)` binding with
 * one labelled argument per prop. Props that couldn't be bound type-safely get an
 * inline `// ⚠️ REVIEW` comment above them.
 *
 * @param {import('../types').ComponentIR} ir  the IR from extractComponent/extractModule
 * @param {{ refType?: string, opaqueFallback?: string }} [options]
 *   refType — ReScript type for DOM refs (default `React.ref<Nullable.t<Dom.element>>`);
 *   opaqueFallback — type for un-modellable props (default `"string"`).
 * @returns {string}  the ReScript source for one `.res` file
 */
export function emit(ir, options = {}) {
    const cfg = {
        from: ir.import.from,
        refType: options.refType || 'React.ref<Nullable.t<Dom.element>>',
        opaqueFallback: options.opaqueFallback || 'string',
        // module mode: qualify typeRefs by their final module. Absent in single-file mode.
        resolveRef: options.resolveRef || null,
    }
    const lines = []

    // Local type declarations (single-file mode). In module mode these arrays are
    // empty — the types live in the shared `*Types.res` modules and props reference
    // them qualified via cfg.resolveRef. Order matters: primitive `@unboxed` variants
    // come BEFORE records (records may reference e.g. `stringOrNumber`); object-bearing
    // `@unboxed` variants come AFTER (they wrap a record). `@unboxed` can't sit in a
    // `type rec` group (syntax error), so we order by dependency instead.
    const prim = (ir.unboxed || []).filter((u) => !isObjectUnboxed(u))
    const obj = (ir.unboxed || []).filter(isObjectUnboxed)
    renderEnums(ir.enums, lines)
    renderUnboxed(prim, lines, cfg) // primitive variants before records that reference them
    emitOrderedTypes(ir.records || [], obj, [], (n) => n.name, (n) => {
        const out = new Set()
        ;(n.fields || []).forEach((f) => collectRefNames(f.type, out))
        ;(n.members || []).forEach((m) => collectRefNames(m.type, out))
        return out
    }, lines, cfg)

    if (lines.length) lines.push('')

    // 3. the external binding
    lines.push(`@module(${JSON.stringify(cfg.from)}) @react.component`)
    lines.push(`external make: (`)
    for (const p of ir.props) {
        const { as, id } = label(p.name)
        const asPrefix = as ? `@as(${JSON.stringify(as)}) ` : ''
        // A prop is emitted EXACTLY only if its whole type tree maps cleanly. If any
        // part is opaque/review/unknown, we don't emit a half-correct type — we emit
        // a `string` placeholder + a flag showing the real TS, so it's hand-matched.
        const imp = imperfection(p.type)
        const realTs = (p.tsType || p.type.text || '').replace(/\s+/g, ' ').slice(0, 110)
        if (imp === 'unknown' || imp === 'any') {
            lines.push(`  // 🛑 BROKEN: \`${p.name}\` is \`${realTs}\` — contains \`${imp}\`; emitted as \`${cfg.opaqueFallback}\` placeholder and WON'T WORK. Needs a concrete type upstream.`)
            lines.push(`  ${asPrefix}~${id}: ${cfg.opaqueFallback}${p.optional ? '=?' : ''},`)
        } else if (imp === 'review') {
            lines.push(`  // ⚠️ REVIEW: \`${p.name}\` is \`${realTs}\` — couldn't be auto-typed exactly; emitted as \`${cfg.opaqueFallback}\` placeholder. Match the real type by hand.`)
            lines.push(`  ${asPrefix}~${id}: ${cfg.opaqueFallback}${p.optional ? '=?' : ''},`)
        } else if (imp === 'opaque') {
            lines.push(`  ${asPrefix}~${id}: ${cfg.opaqueFallback}${p.optional ? '=?' : ''},  // ⚪ loose — was \`${realTs}\``)
        } else {
            // exact match — but an approximate mapping (e.g. DOM union -> Dom.element) may
            // carry a `note` so the consumer knows what isn't covered.
            const note = findNote(p.type)
            lines.push(`  ${asPrefix}~${id}: ${renderType(p.type, p.name, cfg)}${p.optional ? '=?' : ''},${note ? `  // ⓘ ${note}` : ''}`)
        }
    }
    lines.push(`) => React.element = ${JSON.stringify(ir.import.name)}`)
    lines.push('')

    return lines.join('\n')
}

// ── Type-declaration renderers (shared by single-file `emit` and module emit) ──

/** Append `type x = | @as("a") A | …` declarations for each enum. */
function renderEnums(enums, lines) {
    for (const e of enums || []) {
        lines.push(`type ${e.name} =`)
        for (const m of e.members) lines.push(`  | @as(${JSON.stringify(m.as)}) ${m.ctor}`)
    }
}

/** An `@unboxed` variant must be emitted AFTER any record it references (so it's defined
 *  before use). True if a member's type tree contains ANY `typeRef` — directly
 *  (`string | {key,color}`) or nested (a `Fn` over `menuItemType`). Primitive-only ones
 *  (`string | number`) emit BEFORE records that reference them. */
function isObjectUnboxed(u) {
    return (u.members || []).some((m) => {
        const refs = new Set()
        collectRefNames(m.type, refs)
        return refs.size > 0
    })
}

/** Append one `@unboxed type x<'a> = Str(string) | Fn(… => 'a) | @as("…") Lit | …`. */
function renderUnboxed(unboxed, lines, cfg) {
    for (const u of unboxed || []) {
        const tp = u.tparams && u.tparams.length ? `<${u.tparams.join(', ')}>` : '' // generic: foo<'a>
        const ctors = u.members.map((m) =>
            m.as !== undefined
                ? `@as(${m._num ? m.as : JSON.stringify(m.as)}) ${m.ctor}`
                : `${m.ctor}(${renderType(m.type, '', cfg)})`
        ).join(' | ')
        lines.push(`@unboxed type ${u.name}${tp} = ${ctors}`)
    }
}

/** Collect the typeRef target NAMES an IR type tree references (single-file dep graph). */
function collectRefNames(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'typeRef' && t.to) out.add(t.to)
    if (t.of) collectRefNames(t.of, out)
    if (t.ret) collectRefNames(t.ret, out)
    if (t.arg) collectRefNames(t.arg, out)
    if (Array.isArray(t.params)) t.params.forEach((p) => collectRefNames(p, out))
    if (Array.isArray(t.fields)) t.fields.forEach((f) => collectRefNames(f.type, out))
}

/**
 * Emit a module's records + object-bearing `@unboxed` variants in DEPENDENCY order
 * (a type before anything that uses it), since `@unboxed` can't live in a `type rec`
 * group. Mutually-recursive records collapse into one `type rec … and …` group.
 * `idOf(node)` and `depsOf(node)→iterable<id>` identify each type and its references.
 */
function emitOrderedTypes(records, objUnboxed, opaque, idOf, depsOf, lines, cfg) {
    const items = [
        ...records.map((r) => ({ kind: 'record', node: r, id: idOf(r) })),
        ...objUnboxed.map((u) => ({ kind: 'unboxed', node: u, id: idOf(u) })),
        ...opaque.map((o) => ({ kind: 'opaque', node: o, id: idOf(o) })),
    ]
    if (!items.length) return
    const byId = new Map(items.map((it) => [it.id, it]))
    const edges = new Map()
    for (const it of items) {
        const ds = new Set()
        for (const d of depsOf(it.node)) if (byId.has(d) && d !== it.id) ds.add(d)
        edges.set(it.id, ds)
    }
    // Tarjan yields SCCs in reverse-topological order (a type's dependencies first) —
    // exactly the define-before-use order ReScript needs (records, the opaque modules they
    // use, and the records that use those opaque modules all interleave correctly).
    for (const comp of tarjanSCC([...byId.keys()], edges)) {
        const members = comp.map((id) => byId.get(id))
        const recItems = members.filter((m) => m.kind === 'record')
        const recs = recItems.map((m) => m.node)
        const ubs = members.filter((m) => m.kind === 'unboxed').map((m) => m.node)
        const ops = members.filter((m) => m.kind === 'opaque').map((m) => m.node)
        // `rec` only when actually recursive: a mutual group (>1) or a self-referencing record.
        const selfRec = recItems.some((it) => { for (const d of depsOf(it.node)) if (d === it.id) return true; return false })
        if (recs.length) renderRecordGroup(recs, lines, cfg, recs.length > 1 || selfRec)
        if (ops.length) ops.forEach((o) => renderOpaque(o, lines, cfg))
        if (ubs.length) renderUnboxed(ubs, lines, cfg)
    }
}

/** Append an opaque-type module for a multi-object union (the idiomatic ReScript pattern,
 *  like `React.element` + `React.string`): an abstract `t` plus a zero-cost `%identity`
 *  `from*` constructor per member. The prop is typed `Module.t`; the consumer builds a typed
 *  value and `->fromX`-casts it (compiles to the raw value). */
function renderOpaque(t, lines, cfg) {
    const titleCase = (s) => s.charAt(0).toUpperCase() + s.slice(1)
    const pascalName = (s) => String(s).replace(/[^a-zA-Z0-9]+/g, ' ').trim().split(/\s+/).map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join('')
    const fromName = (m) => m.name
        ? 'from' + pascalName(m.name) // explicit hint: Element -> fromElement, Files -> fromFiles
        : 'from' + titleCase(m.type.kind === 'typeRef' ? m.type.to.replace(/\.t$/, '') : (m.type.res || m.type.kind || 'value'))
    lines.push(`module ${t.name} = {`)
    lines.push(`  type t`)
    const seen = new Set()
    for (const m of t.members) {
        const fn = fromName(m)
        if (seen.has(fn)) continue
        seen.add(fn)
        lines.push(`  external ${fn}: ${renderType(m.type, '', cfg)} => t = "%identity"`)
    }
    lines.push(`}`)
}

/** Append a record group. `isRec` (self- or mutually-recursive group) selects `type rec`;
 *  a plain non-recursive record is just `type x = {…}` (no needless `rec`). */
function renderRecordGroup(records, lines, cfg, isRec) {
    ;(records || []).forEach((r, i) => {
        const tp = r.tparams && r.tparams.length ? `<${r.tparams.join(', ')}>` : '' // generic: foo<'a>
        const kw = i === 0 ? (isRec ? 'type rec' : 'type') : 'and'
        lines.push(`${kw} ${r.name}${tp} = {`)
        if (r.spread) lines.push(`  ...${r.spread},`) // e.g. ...JsxDOM.domProps (the HTML attrs)
        const seenIds = new Set()
        for (const f of r.fields) {
            const { as, id } = label(f.name)
            if (seenIds.has(id)) continue // dedupe fields that collapse to the same id (e.g. two -> as_)
            seenIds.add(id)
            const asPrefix = as ? `@as(${JSON.stringify(as)}) ` : ''
            const ty = renderType(f.type, f.name, cfg)
            lines.push(`  ${asPrefix}${id}${f.optional ? '?' : ''}: ${ty},`)
        }
        lines.push('}')
    })
}

/** Return the first `note` (an "approximate mapping, here's the caveat" message) anywhere
 *  in a prop's IR type tree, or null. */
function findNote(t) {
    if (!t || typeof t !== 'object') return null
    if (t.note) return t.note
    for (const k of ['of', 'ret', 'arg']) { if (t[k]) { const n = findNote(t[k]); if (n) return n } }
    if (Array.isArray(t.params)) for (const p of t.params) { const n = findNote(p); if (n) return n }
    return null
}

/**
 * Walk a prop's IR type tree and return the WORST imperfection found anywhere
 * (nested in arrays, dicts, callbacks, records-by-ref are already named so safe),
 * or null if the whole tree maps exactly. Priority: unknown/any > review > opaque.
 * @param {object} t
 * @returns {'unknown'|'any'|'review'|'opaque'|null}
 */
function imperfection(t) {
    if (!t) return null
    if (t.kind === 'unknown') return 'unknown'
    if (t.kind === 'any') return 'any'
    const rank = { unknown: 3, any: 3, review: 2, opaque: 1 }
    let worst = t.kind === 'review' ? 'review' : t.kind === 'opaque' ? 'opaque' : null
    const consider = (x) => {
        const r = imperfection(x)
        if (r && (!worst || rank[r] > rank[worst])) worst = r
    }
    if (t.of) consider(t.of)
    if (t.ret) consider(t.ret)
    if (t.arg) consider(t.arg)
    if (t.params) t.params.forEach(consider)
    return worst
}

/**
 * Bucket a component's props by how well they could be bound. Drives `_REPORT.md`.
 *
 * - **defects** — props that resolved to `unknown`/`any` (won't work as typed)
 * - **review**  — multi-type unions we refuse to bind unsafely (need a human)
 * - **loose**   — real types widened to `string` (compile & work, just loosely typed)
 *
 * @param {import('../types').ComponentIR} ir
 * @returns {{ loose: object[], defects: object[], review: object[] }}
 *   each item: `{ prop, kind, tsType, declText }`
 */
export function report(ir) {
    const loose = []
    const defects = []
    const review = []
    for (const p of ir.props) {
        const v = imperfection(p.type) // same recursion the emitter uses — report ⇔ code agree
        if (!v) continue
        const item = { prop: p.name, kind: v, tsType: p.tsType, declText: p.declText }
        if (v === 'unknown' || v === 'any') defects.push(item)
        else if (v === 'review') review.push(item)
        else { item.emittedAs = 'string'; loose.push(item) } // opaque
    }
    return { loose, defects, review }
}

// ── Module mode: group the shared-type registry into per-domain `*Types.res` ──
// modules, merging dependency cycles (e.g. Sidebar ⇄ Topbar) into one module.

/**
 * A typeRef resolver for module mode: maps a typeRef's home domain to its FINAL
 * module (post-SCC) and qualifies it — `MenuTypes.menuItemType`. When emitting a
 * type module, same-module refs stay bare; for component files pass `currentModule`
 * = null so everything is qualified.
 * @param {Map<string,string>} finalOf  home-domain -> final module name
 * @param {string|null} currentModule
 * @returns {(t:object)=>string}
 */
export function makeResolveRef(finalOf, currentModule) {
    return (t) => {
        const fm = finalOf.get(t.home) || t.home || 'CommonTypes'
        return currentModule && fm === currentModule ? t.to : `${fm}.${t.to}`
    }
}

/** Tarjan's strongly-connected-components over a node list + adjacency map. */
function tarjanSCC(nodes, edges) {
    let index = 0
    const idx = new Map(), low = new Map(), onStack = new Set(), stack = []
    const sccs = []
    const strongconnect = (v) => {
        idx.set(v, index); low.set(v, index); index++
        stack.push(v); onStack.add(v)
        for (const w of (edges.get(v) || [])) {
            if (!idx.has(w)) { strongconnect(w); low.set(v, Math.min(low.get(v), low.get(w))) }
            else if (onStack.has(w)) { low.set(v, Math.min(low.get(v), idx.get(w))) }
        }
        if (low.get(v) === idx.get(v)) {
            const comp = []
            let w
            do { w = stack.pop(); onStack.delete(w); comp.push(w) } while (w !== v)
            sccs.push(comp)
        }
    }
    for (const v of nodes) if (!idx.has(v)) strongconnect(v)
    return sccs
}

/**
 * Plan the per-domain type modules from the registry: build the domain dependency
 * graph from each type's reference edges, run SCC to collapse cyclic groups into one
 * module, and bucket every type into its FINAL module.
 * @param {{byKey:Map, entries:Array}} shared  the registry from extractModule
 * @returns {{ finalOf: Map<string,string>, byModule: Map<string, Array> }}
 */
export function planSharedModules(shared) {
    const { byKey, entries } = shared
    const nodes = [...new Set(entries.map((e) => e.home))]
    const edges = new Map(nodes.map((n) => [n, new Set()]))
    for (const e of entries) {
        for (const depKey of e.deps || []) {
            const dep = byKey.get(depKey)
            if (dep && dep.home !== e.home) edges.get(e.home).add(dep.home)
        }
    }
    const finalOf = new Map()
    for (const comp of tarjanSCC(nodes, edges)) {
        // singleton -> its own module; cycle -> merge members into one module
        const fm = comp.length === 1
            ? comp[0]
            : comp.map((h) => h.replace(/Types$/, '')).sort().join('') + 'Types'
        for (const h of comp) finalOf.set(h, fm)
    }
    const byModule = new Map()
    for (const e of entries) {
        const fm = finalOf.get(e.home)
        if (!byModule.has(fm)) byModule.set(fm, [])
        byModule.get(fm).push(e)
    }
    return { finalOf, byModule }
}

/**
 * Render one shared `*Types.res` module: its enums, then `@unboxed` variants, then
 * records (one `type rec … and …` group). Cross-module references are qualified.
 * @param {string} mod         the final module name (e.g. `MenuTypes`)
 * @param {Array} entries      the registry entries whose final module is `mod`
 * @param {Map<string,string>} finalOf
 * @param {{refType?:string, opaqueFallback?:string}} [options]
 * @returns {string}
 */
export function emitSharedModule(mod, entries, finalOf, options = {}) {
    const cfg = {
        refType: options.refType || 'React.ref<Nullable.t<Dom.element>>',
        opaqueFallback: options.opaqueFallback || 'string',
        resolveRef: makeResolveRef(finalOf, mod),
    }
    const lines = []
    const unboxed = entries.filter((e) => e.kind === 'unboxed')
    const records = entries.filter((e) => e.kind === 'record')
    renderEnums(entries.filter((e) => e.kind === 'enum'), lines)
    renderUnboxed(unboxed.filter((u) => !isObjectUnboxed(u)), lines, cfg) // primitive: before records
    // records + object-bearing variants + opaque-type modules in dependency order
    emitOrderedTypes(records, unboxed.filter(isObjectUnboxed), entries.filter((e) => e.kind === 'opaque'), (e) => e.key, (e) => e.deps || [], lines, cfg)
    return lines.join('\n') + '\n'
}
