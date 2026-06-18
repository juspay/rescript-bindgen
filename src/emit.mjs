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

import { RESCRIPT_RESERVED } from './stdlib-types.mjs'

/** ReScript keywords that can't be used bare as identifiers/labels (we suffix `_`).
 *  Shared with extract via stdlib-types so notes and emitted idents never disagree. */
const RESERVED = RESCRIPT_RESERVED

/**
 * Prop names whose `number` type should become ReScript `int` (counts/indices),
 * not `float`. TypeScript has only `number`, so this is a best-effort heuristic.
 */
const INT_BY_NAME = new Set([
    // PROVABLY-integral names only. step/min/max/width/height/size/offset/duration were
    // removed: fractional values are legal there (Slider step={0.1}) and a too-narrow int
    // is a compile error, while a too-wide float merely asks for a dot. (#32)
    'count', 'index', 'tabIndex', 'maxLength', 'minLength',
    'rows', 'cols', 'span', 'colSpan', 'rowSpan', 'level', 'zIndex',
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
/** True when a `type rec A = {…} and B = {…}` mutually-recursive group contains two members that
 *  share a NAME — a record field label, or a variant constructor of an `@unboxed` folded into the
 *  group (e.g. several label unions all using `Str`/`Fn`). That's the exact trigger for ReScript's
 *  warning 30. (Independent `type` declarations sharing a name do NOT warn; only same-rec-group
 *  members do.) When it happens we prepend `@@warning("-30")` to the file: the duplication is
 *  intentional and every value is explicitly typed, so the ambiguity is pure noise for consumers.
 *  Mirrors the SCC grouping in `emitOrderedTypes` so it flags exactly the files that warn. */
function hasRecGroupLabelCollision(records, objUnboxed, opaque, idOf, depsOf) {
    const items = [
        ...records.map((r) => ({ kind: 'record', node: r, id: idOf(r) })),
        ...(objUnboxed || []).map((u) => ({ kind: 'unboxed', node: u, id: idOf(u) })),
        ...(opaque || []).map((o) => ({ kind: 'opaque', node: o, id: idOf(o) })),
    ]
    if (!items.length) return false
    const byId = new Map(items.map((it) => [it.id, it]))
    const edges = new Map()
    for (const it of items) {
        const ds = new Set()
        for (const d of depsOf(it.node)) if (byId.has(d) && d !== it.id) ds.add(d)
        edges.set(it.id, ds)
    }
    for (const comp of tarjanSCC([...byId.keys()], edges)) {
        const members = comp.map((id) => byId.get(id))
        const recs = members.filter((m) => m.kind === 'record').map((m) => m.node)
        const ubs = members.filter((m) => m.kind === 'unboxed').map((m) => m.node)
        // Names per type that share ONE rec group: record field ids always; `@unboxed` constructors
        // only when those unboxed are folded into the group (records AND unboxed in the same SCC).
        const perType = recs.map((r) => new Set((r.fields || []).map((f) => label(f.name).id)))
        if (recs.length && ubs.length) {
            for (const u of ubs) perType.push(new Set((u.members || []).map((m) => m.ctor).filter(Boolean)))
        }
        if (perType.length < 2) continue // need ≥2 types in the group to collide
        const seen = new Set()
        for (const names of perType) {
            for (const n of names) {
                if (seen.has(n)) return true
                seen.add(n)
            }
        }
    }
    return false
}

export function label(name) {
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
export function numberType(propName) {
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
        case 'bigint': return 'bigint'
        case 'reactElement': return 'React.element'
        // a component-valued prop: `React.component<propsRecord>`
        case 'reactComponent': return `React.component<${renderType(t.of, propName, cfg)}>`
        case 'style': return 'JsxDOM.style'
        case 'date': return 'Date.t'
        case 'domElement': return 'Dom.element'
        case 'domRef': return cfg.refType
        // a ReScript type variable from a generic component (`T` -> `'a`)
        case 'typeVar': return t.name
        // a reference to an exported class instance -> the abstract type in the `InstanceTypes`
        // sink (qualified via resolveRef, e.g. `InstanceTypes.counter`). A self-reference may
        // render as bare `t` ONLY when emitted inside the class's own file (cfg.allowSelfT) —
        // a self-ref that lands in a SHARED record module has no local `t`, so it uses the sink.
        case 'classRef': {
            if (t.self && cfg.allowSelfT) return 't'
            return cfg.resolveRef ? cfg.resolveRef(t) : t.to
        }
        // typeRef: in module mode `cfg.resolveRef` qualifies it by its final module
        // (e.g. `MenuTypes.menuItemType`); single-file mode emits the bare local name.
        // A generic record carries `tparams` -> `name<'a>`.
        case 'typeRef': {
            const base = cfg.resolveRef ? cfg.resolveRef(t) : t.to
            return t.tparams && t.tparams.length ? `${base}<${t.tparams.join(', ')}>` : base
        }
        case 'stringOrNumber': return '[#String(string) | #Number(float)]'
        case 'array': return `array<${renderType(t.of, propName, cfg)}>`
        // fixed-arity tuple `[number, number]` -> `(float, float)`. Elements live in `params` so
        // every type-tree walker (refs/typevars/imperfection/notes) traverses them for free.
        case 'tuple': return `(${t.params.map((it) => renderType(it, propName, cfg)).join(', ')})`
        case 'dict': return `Dict.t<${renderType(t.of, propName, cfg)}>`
        // JS Map/Set -> ReScript stdlib container types
        case 'map': return `Map.t<${renderType(t.mapKey, propName, cfg)}, ${renderType(t.mapVal, propName, cfg)}>`
        case 'set': return `Set.t<${renderType(t.of, propName, cfg)}>`
        case 'promise': return `promise<${renderType(t.of, propName, cfg)}>`
        case 'nullable': return `Nullable.t<${renderType(t.of, propName, cfg)}>` // `T | null` value prop (#34)
        case 'callback': {
            // an optional param `reason?: T` -> `option<T>` (None = the arg omitted)
            const render1 = (p) => {
                const base = p.kind === 'event' ? p.res : renderType(p, propName, cfg)
                return p.optional ? `option<${base}>` : base
            }
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
    const idOf = (n) => n.name
    const depsOf = (n) => {
        const out = new Set()
        ;(n.fields || []).forEach((f) => collectRefNames(f.type, out))
        ;(n.members || []).forEach((m) => collectRefNames(m.type, out))
        return out
    }
    if (hasRecGroupLabelCollision(ir.records || [], obj, [], idOf, depsOf)) lines.push('@@warning("-30")', '') // silence duplicate-label noise
    renderEnums(ir.enums, lines)
    renderUnboxed(prim, lines, cfg) // primitive variants before records that reference them
    emitOrderedTypes(ir.records || [], obj, [], idOf, depsOf, lines, cfg)

    if (lines.length) lines.push('')

    // 3. the external binding — two forms:
    //    record-props (ir.attrsBase.ref): `type props = {...HtmlAttrs.x, own…}` +
    //      `external make: React.component<props>` — the HTML attribute surface is ONE
    //      shared spread; JSX call sites are unchanged (JSX v4 lowers to make/props).
    //    labeled args (default): the classic `@react.component external make: (~p: t=?, …)`.
    const recordProps = !!(ir.attrsBase && ir.attrsBase.ref)
    // Render-prop FUNCTION-form wrappers (#46): the prop itself binds as `React.element`
    // (an @unboxed `Element | Fn` cannot compile — React.element is abstract), so the
    // function form gets a zero-cost `<prop>Fn` %identity wrapper, typed with the EXACT
    // extracted signature (imperfect params already salvaged to type variables upstream).
    for (const p of ir.props) {
        const fn = p.type && p.type.renderFn
        if (!fn) continue
        const sig = renderType({ ...fn, kind: 'callback' }, p.name, cfg)
        lines.push(`/** zero-cost wrapper: pass the FUNCTION form of \`${p.name}\` — \`${p.name}={${p.name}Fn((…) => …)}\` */`)
        lines.push(`external ${p.name}Fn: (${sig}) => React.element = "%identity"`)
        lines.push('')
    }
    if (ir.import.isDefault) lines.push(defaultExportNote(ir.import.name))
    // A namespace member binds THROUGH the namespace object — `@scope("Accordion") = "Root"`
    // — because the flat export may be type-only (undefined at runtime, base-ui). (#25)
    const scopeAttr = ir.import.scope ? ` @scope(${JSON.stringify(ir.import.scope)})` : ''
    if (recordProps) {
        // Type variables in props (explicit generics or implicit `any` vars, #31) make
        // the record parameterized: `type props<'a> = …`.
        const tvars = new Set()
        for (const p of ir.props) collectVarNames(p.type, tvars)
        const tp = tvars.size ? `<${[...tvars].join(', ')}>` : ''
        lines.push(`type props${tp} = {`)
        lines.push(`  ...${ir.attrsBase.ref},`)
        for (const p of ir.props) lines.push(...propLine(p, cfg, 'record'))
        lines.push(`}`)
        lines.push('')
        lines.push(`@module(${JSON.stringify(cfg.from)})${scopeAttr}`)
        lines.push(`external make: React.component<props${tp}> = ${JSON.stringify(ir.import.jsName || ir.import.name)}`)
    } else {
        lines.push(`@module(${JSON.stringify(cfg.from)})${scopeAttr} @react.component`)
        lines.push(`external make: (`)
        for (const p of ir.props) lines.push(...propLine(p, cfg, 'labeled'))
        lines.push(`) => React.element = ${JSON.stringify(ir.import.jsName || ir.import.name)}`)
    }
    lines.push('')

    return lines.join('\n')
}

/**
 * Render a namespace alias module: `Accordion.res` with `module Root = AccordionRoot`, …
 * Zero-cost ReScript module aliases over the flat component files (which bind the
 * namespace member via @scope), enabling the package's documented `<Accordion.Root>`
 * JSX idiom. (#25)
 * @param {{name: string, members: Array<{member: string, target: string}>}} ns
 * @param {string} from  the npm package name (header comment only)
 * @returns {string}
 */
export function emitNamespace(ns, from) {
    const lines = []
    lines.push(`// Namespace \`${ns.name}\` of ${from} — zero-cost aliases; use <${ns.name}.${ns.members[0].member} />`)
    for (const m of ns.members) lines.push(`module ${m.member} = ${m.target}`)
    lines.push('')
    return lines.join('\n')
}

/** Collect every `typeVar` name in an IR type tree (for parameterizing `type props<'a>`). */
function collectVarNames(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'typeVar' && t.name) out.add(t.name)
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal']) if (t[k]) collectVarNames(t[k], out)
    if (Array.isArray(t.params)) for (const p of t.params) collectVarNames(p, out)
    if (Array.isArray(t.tparams)) for (const v of t.tparams) if (typeof v === 'string') out.add(v)
}

/**
 * Render one component prop as either a labeled argument (`~id: t=?,`) or a record
 * field (`id?: t,`), with the SAME imperfection flags in both forms.
 * A prop is emitted EXACTLY only if its whole type tree maps cleanly. If any part is
 * opaque/review/unknown, we don't emit a half-correct type — we emit a `string`
 * placeholder + a flag showing the real TS, so it's hand-matched.
 * @returns {string[]} 1-2 lines
 */
function propLine(p, cfg, form) {
    const { as, id } = label(p.name)
    const asPrefix = as ? `@as(${JSON.stringify(as)}) ` : ''
    const field = (ty) => form === 'record'
        ? `  ${asPrefix}${id}${p.optional ? '?' : ''}: ${ty},`
        : `  ${asPrefix}~${id}: ${ty}${p.optional ? '=?' : ''},`
    const imp = imperfection(p.type)
    const realTs = (p.tsType || p.type.text || '').replace(/\s+/g, ' ').slice(0, 110)
    if (imp === 'unknown' || imp === 'any') {
        return [`  // 🛑 BROKEN: \`${p.name}\` is \`${realTs}\` — contains \`${imp}\`; emitted as \`${cfg.opaqueFallback}\` placeholder and WON'T WORK. Needs a concrete type upstream.`, field(cfg.opaqueFallback)]
    }
    if (imp === 'review') {
        return [`  // ⚠️ REVIEW: \`${p.name}\` is \`${realTs}\` — couldn't be auto-typed exactly; emitted as \`${cfg.opaqueFallback}\` placeholder. Match the real type by hand.`, field(cfg.opaqueFallback)]
    }
    if (imp === 'opaque') {
        return [field(cfg.opaqueFallback) + `  // ⚪ loose — was \`${realTs}\``]
    }
    // exact match — but an approximate mapping (e.g. DOM union -> Dom.element) may
    // carry a `note` so the consumer knows what isn't covered.
    const note = findNote(p.type)
    return [field(renderType(p.type, p.name, cfg)) + (note ? `  // ⓘ ${note}` : '')]
}

/**
 * Render a standalone function-export IR (from extractModule's `functions`) into a
 * ReScript `@module external` binding. Mirrors `emit()`'s local-type prologue — empty
 * in module mode, where the types live in the shared `*Types.res` and params reference
 * them qualified via `cfg.resolveRef`. The signature is emitted POSITIONAL (uncurried):
 *   `@module("pkg") external add: (float, float) => float = "add"`
 * Zero-arg functions get `unit => ret` (a ReScript external can't have an empty arg
 * list). Params/return that can't be typed exactly fall back to the flagged placeholder
 * with a leading comment (flag-don't-fake) — same buckets the component path uses.
 *
 * @param {import('../types').FunctionIR} ir
 * @param {{ refType?: string, opaqueFallback?: string, resolveRef?: Function }} [options]
 * @returns {string}  ReScript source for one function binding (no trailing blank line)
 */
export function emitFunction(ir, options = {}) {
    const cfg = {
        from: ir.import.from,
        refType: options.refType || 'React.ref<Nullable.t<Dom.element>>',
        opaqueFallback: options.opaqueFallback || 'string',
        resolveRef: options.resolveRef || null,
    }
    const lines = []

    // Local type prologue — identical ordering to emit() so a single-file function binding
    // stays self-contained. In module mode these arrays are empty (types are shared).
    const prim = (ir.unboxed || []).filter((u) => !isObjectUnboxed(u))
    const obj = (ir.unboxed || []).filter(isObjectUnboxed)
    const idOf = (n) => n.name
    const depsOf = (n) => {
        const out = new Set()
        ;(n.fields || []).forEach((f) => collectRefNames(f.type, out))
        ;(n.members || []).forEach((m) => collectRefNames(m.type, out))
        return out
    }
    if (hasRecGroupLabelCollision(ir.records || [], obj, [], idOf, depsOf)) lines.push('@@warning("-30")', '')
    renderEnums(ir.enums, lines)
    renderUnboxed(prim, lines, cfg)
    emitOrderedTypes(ir.records || [], obj, [], idOf, depsOf, lines, cfg)
    if (lines.length) lines.push('')

    // `label` gives a safe ReScript id (the original JS name stays in the `= "…"` string),
    // so a reserved/Capitalized export name still binds cleanly.
    const { id } = label(ir.import.name)

    // A `React.Context<T>` value export binds as the context VALUE, not a call (#63 C6).
    if (ir.context) {
        const ofType = renderType(ir.context.ofType, '', cfg)
        const imp = imperfection(ir.context.ofType)
        if (imp) lines.push(`// ${imp === 'unknown' || imp === 'any' ? '🛑 BROKEN' : '⚠️ REVIEW'}: \`${ir.import.name}\` context value couldn't be typed exactly — \`${cfg.opaqueFallback}\` placeholder.`)
        lines.push(`@module(${JSON.stringify(cfg.from)}) external ${id}: React.Context.t<${ofType}> = ${JSON.stringify(ir.import.jsName || ir.import.name)}`)
        return lines.join('\n')
    }

    const render1 = (p) => (p.type.kind === 'event' ? p.type.res : renderType(p.type, p.name, cfg))
    const params = ir.sig.params || []
    // Required params stay POSITIONAL (idiomatic for plain functions); optional params bind as
    // labeled `~name=?` (a positional external can't express a trailing optional). A trailing
    // `unit` sentinel is added when any param is optional, so the optional can be omitted.
    const segs = []
    let hasOpt = false
    for (const p of params) {
        if (p.optional) { hasOpt = true; segs.push(`~${label(p.name).id}: ${render1(p)}=?`) }
        else segs.push(render1(p))
    }
    if (hasOpt) segs.push('unit')
    const paramStr = segs.length ? `(${segs.join(', ')})` : 'unit'
    const ret = renderType(ir.sig.ret || { kind: 'unit' }, '', cfg)

    // flag-don't-fake: surface the WORST imperfection across return + params above the line.
    const imps = [ir.sig.ret, ...params.map((p) => p.type)].map(imperfection).filter(Boolean)
    if (imps.includes('unknown') || imps.includes('any')) {
        lines.push(`// 🛑 BROKEN: \`${ir.import.name}\` has an \`unknown\`/\`any\` in its signature — emitted with \`${cfg.opaqueFallback}\` placeholder(s) and WON'T WORK. Needs a concrete type upstream.`)
    } else if (imps.includes('review')) {
        lines.push(`// ⚠️ REVIEW: \`${ir.import.name}\` couldn't be auto-typed exactly — \`${cfg.opaqueFallback}\` placeholder(s) emitted. Match the real type by hand.`)
    } else if (imps.includes('opaque')) {
        lines.push(`// ⚪ loose: \`${ir.import.name}\` has a param/return widened to \`${cfg.opaqueFallback}\`.`)
    }
    if (ir.import.isDefault) lines.push(defaultExportNote(ir.import.name))
    lines.push(`@module(${JSON.stringify(cfg.from)}) external ${id}: ${paramStr} => ${ret} = ${JSON.stringify(ir.import.jsName || ir.import.name)}`)

    return lines.join('\n')
}

/** Flag for a default export: we bind `= "default"` (correct for ESM / esModuleInterop), but a
 *  package that does `module.exports = fn` (plain CJS) exposes the value as the module itself —
 *  `require("pkg").default` is then undefined. Surfaced so the consumer verifies at runtime. */
function defaultExportNote(name) {
    return `// ⚠️ \`${name}\` is a DEFAULT export — bound as \`= "default"\`. If the package does \`module.exports = ${name}\` (CJS), this may need a hand-adjustment; verify the import at runtime.`
}

/**
 * Render a class-export IR (from extractModule's `classes`) into a ReScript module — the
 * canonical "JS class = module with an abstract `type t`" pattern. Emitted into its OWN
 * `<ClassName>.res` file, so the file *is* the module and a cross-class reference resolves
 * as `OtherClass.t` across files with no ordering concerns. Layout:
 *   type t
 *   @new @module("pkg") external make: (~a: float, ~b: float=?, unit) => t = "ClassName"
 *   @send external method: (t, ~x: float) => t = "method"
 *   @get  external prop: t => float = "prop"
 * Params bind as LABELED args (so optionals work, with the `unit` sentinel ReScript needs
 * when the last arg is optional). Imperfect types get a leading flag comment (flag-don't-fake).
 *
 * @param {import('../types').ClassIR} ir
 * @param {{ refType?: string, opaqueFallback?: string, resolveRef?: Function }} [options]
 * @returns {string}  ReScript source for one class module (no trailing blank line)
 */
export function emitClass(ir, options = {}) {
    const cfg = {
        from: ir.import.from,
        refType: options.refType || 'React.ref<Nullable.t<Dom.element>>',
        opaqueFallback: options.opaqueFallback || 'string',
        resolveRef: options.resolveRef || null,
        allowSelfT: true, // we're inside the class's own file -> a self-classRef may be bare `t`
    }
    const lines = []

    // Local type prologue — identical ordering to emit(); empty in module mode (types shared).
    const prim = (ir.unboxed || []).filter((u) => !isObjectUnboxed(u))
    const obj = (ir.unboxed || []).filter(isObjectUnboxed)
    const idOf = (n) => n.name
    const depsOf = (n) => {
        const out = new Set()
        ;(n.fields || []).forEach((f) => collectRefNames(f.type, out))
        ;(n.members || []).forEach((m) => collectRefNames(m.type, out))
        return out
    }
    if (hasRecGroupLabelCollision(ir.records || [], obj, [], idOf, depsOf)) lines.push('@@warning("-30")', '')
    renderEnums(ir.enums, lines)
    renderUnboxed(prim, lines, cfg)
    emitOrderedTypes(ir.records || [], obj, [], idOf, depsOf, lines, cfg)
    if (lines.length) lines.push('')

    // `type t` aliases the class's abstract instance type in the sink module, so the sink
    // is the single canonical definition everything points at (breaks class↔types cycles).
    const sinkSelf = cfg.resolveRef && ir.sinkName ? cfg.resolveRef({ to: ir.sinkName, home: 'InstanceTypes' }) : null
    lines.push(sinkSelf ? `type t = ${sinkSelf}` : 'type t')

    // Labeled-arg segment for a param list: `~id: type` (+ `=?` when optional), plus a
    // trailing `unit` sentinel when the LAST param is optional (ReScript requires it so the
    // optional can be omitted at the call site).
    const render1 = (p) => (p.type.kind === 'event' ? p.type.res : renderType(p.type, p.name, cfg))
    const argSegs = (params) => {
        const segs = params.map((p) => `~${label(p.name).id}: ${render1(p)}${p.optional ? '=?' : ''}`)
        if (params.length && params[params.length - 1].optional) segs.push('unit')
        return segs
    }
    // Worst imperfection across a member's types -> a leading flag comment (or null).
    const flag = (memberName, types) => {
        const imps = types.map(imperfection).filter(Boolean)
        if (imps.includes('unknown') || imps.includes('any')) return `// 🛑 BROKEN: \`${memberName}\` has an \`unknown\`/\`any\` — emitted with \`${cfg.opaqueFallback}\` placeholder(s) and WON'T WORK. Needs a concrete type upstream.`
        if (imps.includes('review')) return `// ⚠️ REVIEW: \`${memberName}\` couldn't be auto-typed exactly — \`${cfg.opaqueFallback}\` placeholder(s) emitted. Match the real type by hand.`
        if (imps.includes('opaque')) return `// ⚪ loose: \`${memberName}\` has a param/return widened to \`${cfg.opaqueFallback}\`.`
        return null
    }

    if (ir.ctor) {
        const c = flag('make', ir.ctor.params.map((p) => p.type))
        if (c) lines.push(c)
        if (ir.import.isDefault) lines.push(defaultExportNote(ir.import.name))
        const segs = argSegs(ir.ctor.params)
        const paramStr = segs.length ? `(${segs.join(', ')})` : 'unit'
        lines.push(`@new @module(${JSON.stringify(cfg.from)}) external make: ${paramStr} => t = ${JSON.stringify(ir.import.jsName || ir.import.name)}`)
    }
    for (const m of ir.methods) {
        const c = flag(m.jsName, [m.ret, ...m.params.map((p) => p.type)])
        if (c) lines.push(c)
        const args = ['t', ...argSegs(m.params)]
        lines.push(`@send external ${label(m.jsName).id}: (${args.join(', ')}) => ${renderType(m.ret, '', cfg)} = ${JSON.stringify(m.jsName)}`)
    }
    for (const g of ir.getters) {
        const c = flag(g.jsName, [g.type])
        if (c) lines.push(c)
        lines.push(`@get external ${label(g.jsName).id}: t => ${renderType(g.type, '', cfg)} = ${JSON.stringify(g.jsName)}`)
    }

    return lines.join('\n')
}

// ── Type-declaration renderers (shared by single-file `emit` and module emit) ──

/** Append `type x = | @as("a") A | …` declarations for each enum. */
function renderEnums(enums, lines) {
    for (const e of enums || []) {
        lines.push(`type ${e.name} =`)
        // numeric enum member -> unquoted `@as(0)` (int runtime value); string -> `@as("sm")`.
        for (const m of e.members) lines.push(`  | @as(${m.num ? m.as : JSON.stringify(m.as)}) ${m.ctor}`)
    }
}

/** Named polyvariant types — `type svgPathCommand = [#M | #L | …]` (#72). A tag's runtime value is
 *  its string (`#M` ⟶ "M"); a non-identifier value is quoted (`#"icon-only"`). Dependency-free leaf
 *  types (like enums), so emitted in the same early pass. */
function renderPolyvariants(polys, lines) {
    for (const p of polys || []) {
        const tags = (p.tags || []).map((t) => (/^[A-Za-z_][A-Za-z0-9_]*$/.test(t) ? `#${t}` : `#${JSON.stringify(t)}`)).join(' | ')
        lines.push(`type ${p.name} = [${tags}]`)
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

/** The `x<'a> = Str(string) | Fn(… => 'a) | @as("…") Lit` body of an `@unboxed` declaration
 *  (without the leading `@unboxed type` / `@unboxed and`). Shared by the standalone and the
 *  in-rec-group renderers. */
function unboxedBody(u, cfg) {
    const tp = u.tparams && u.tparams.length ? `<${u.tparams.join(', ')}>` : '' // generic: foo<'a>
    const ctors = u.members.map((m) =>
        m.as !== undefined
            ? `@as(${m._num ? m.as : JSON.stringify(m.as)}) ${m.ctor}`
            : `${m.ctor}(${renderType(m.type, '', cfg)})`
    ).join(' | ')
    return `${u.name}${tp} = ${ctors}`
}

/** Append one `@unboxed type x<'a> = Str(string) | Fn(… => 'a) | @as("…") Lit | …`. */
function renderUnboxed(unboxed, lines, cfg) {
    for (const u of unboxed || []) lines.push(`@unboxed type ${unboxedBody(u, cfg)}`)
}

/** Emit records + object-bearing `@unboxed` that are MUTUALLY RECURSIVE (one SCC) as a single
 *  `type rec … and …` group — the `@unboxed` members join via `@unboxed and …`. This is the only
 *  way to express a cycle that runs through an `@unboxed` (a record field `x?: labelGrid` whose
 *  variant in turn references the record), which ReScript otherwise rejects as a forward reference. */
function renderRecGroupWithUnboxed(records, unboxed, lines, cfg) {
    renderRecordGroup(records, lines, cfg, true) // a cross-record/unboxed cycle is always recursive
    for (const u of unboxed || []) lines.push(`@unboxed and ${unboxedBody(u, cfg)}`)
}

/** Collect the typeRef target NAMES an IR type tree references (single-file dep graph). */
function collectRefNames(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'typeRef' && t.to) out.add(t.to)
    if (t.of) collectRefNames(t.of, out)
    if (t.ret) collectRefNames(t.ret, out)
    if (t.arg) collectRefNames(t.arg, out)
    if (t.mapKey) collectRefNames(t.mapKey, out)
    if (t.mapVal) collectRefNames(t.mapVal, out)
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
        if (recs.length && ubs.length) {
            // A genuine cycle running through an object-bearing `@unboxed` (records + unboxed in one
            // SCC) — the unboxed can't be a separate later declaration (forward reference) nor a plain
            // earlier one (it depends back on the records). Emit them as ONE `type rec … and …` group.
            renderRecGroupWithUnboxed(recs, ubs, lines, cfg)
        } else {
            if (recs.length) renderRecordGroup(recs, lines, cfg, recs.length > 1 || selfRec)
            if (ubs.length) renderUnboxed(ubs, lines, cfg)
        }
        if (ops.length) ops.forEach((o) => renderOpaque(o, lines, cfg))
    }
}

/** Append an opaque-type module for a multi-object union (the idiomatic ReScript pattern,
 *  like `React.element` + `React.string`): an abstract `t` plus a zero-cost `%identity`
 *  `from*` constructor per member. The prop is typed `Module.t`; the consumer builds a typed
 *  value and `->fromX`-casts it (compiles to the raw value). */
function renderOpaque(t, lines, cfg) {
    // Overloaded function: a module of zero-cost `%identity` ACCESSOR views (opaque -> concrete),
    // one per call signature — `external asReason: t => (option<…> => unit) = "%identity"`.
    if (t.variant === 'overload') {
        lines.push(`module ${t.name} = {`)
        lines.push(`  type t`)
        const seen = new Set()
        for (const s of t.sigs) {
            if (seen.has(s.accessor)) continue
            seen.add(s.accessor)
            lines.push(`  external ${s.accessor}: t => (${renderType(s.fn, '', cfg)}) = "%identity"`)
        }
        lines.push(`}`)
        return
    }
    const titleCase = (s) => s.charAt(0).toUpperCase() + s.slice(1)
    const pascalName = (s) => String(s).replace(/[^a-zA-Z0-9]+/g, ' ').trim().split(/\s+/).map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join('')
    // camel ident for a literal-arm constant ('clippingAncestors' -> clippingAncestors,
    // 'trap-focus' -> trapFocus, 'true' -> true_, '2xl' -> v2xl). Mirrors extract's
    // lower(pascal(…)) — same shared RESERVED set — so the prop's ⓘ note and the
    // emitted ident can never disagree. (#39 review)
    const lowerIdent = (s) => {
        let p = pascalName(s)
        if (!/^[A-Z]/.test(p)) p = 'V' + p
        let n = p.charAt(0).toLowerCase() + p.slice(1)
        if (RESERVED.has(n)) n += '_'
        return n
    }
    const fromName = (m) => m.name
        ? 'from' + pascalName(m.name) // explicit hint: Element -> fromElement, Files -> fromFiles
        : 'from' + titleCase(m.type.kind === 'typeRef' ? m.type.to.replace(/\.t$/, '') : (m.type.res || m.type.kind || 'value'))
    lines.push(`module ${t.name} = {`)
    lines.push(`  type t`)
    const seen = new Set()
    for (const m of t.members) {
        // A collapsed LITERAL RUN (#53) -> ONE polyvar constructor admitting exactly that
        // set: `external fromTag: [#"a" | #"div" | …] => t = "%identity"`. Each tag value
        // passes through unchanged (it IS the string), so this is exact and leak-free —
        // the same guarantee as N individual constants, ~1 line instead of ~2N.
        if (m.tagSet) {
            if (seen.has('fromTag')) continue
            seen.add('fromTag')
            const poly = m.tagSet.map((v) => `#"${v}"`).join(' | ')
            lines.push(`  external fromTag: [${poly}] => t = "%identity"`)
            continue
        }
        // A string-LITERAL arm -> a ready-made constant: the polyvar `#"x"` admits exactly
        // that one value and compiles to the bare string, so nothing else can be cast in. (#39)
        if (m.literal !== undefined) {
            const constName = lowerIdent(m.literal)
            if (seen.has(constName)) continue
            seen.add(constName)
            lines.push(`  external from${pascalName(m.literal)}: [#"${m.literal}"] => t = "%identity"`)
            lines.push(`  let ${constName}: t = from${pascalName(m.literal)}(#"${m.literal}")`)
            continue
        }
        // The null/void arm of a consumer-produced return: unit's runtime value IS
        // `undefined`, which is exactly what a `void` return is. (#39)
        if (m.none) {
            if (seen.has('none')) continue
            seen.add('none')
            lines.push(`  external fromUnit: unit => t = "%identity"`)
            lines.push(`  let none: t = fromUnit()`)
            continue
        }
        const fn = fromName(m)
        if (seen.has(fn)) continue
        seen.add(fn)
        // A function-typed member (`(e) => void` -> `string => unit`) must be parenthesized as
        // the constructor's arg, else `string => unit => t` misparses as `string => (unit => t)`.
        const rendered = renderType(m.type, '', cfg)
        const arg = m.type.kind === 'callback' ? `(${rendered})` : rendered
        lines.push(`  external ${fn}: ${arg} => t = "%identity"`)
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
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal']) { if (t[k]) { const n = findNote(t[k]); if (n) return n } }
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
    if (t.mapKey) consider(t.mapKey)
    if (t.mapVal) consider(t.mapVal)
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
    // entries per home-domain — used to name a merged SCC after its LARGEST member,
    // so adding/removing a SMALL domain to the cycle doesn't rename the module (and break
    // consumers' qualified refs). (#35)
    const sizeOf = new Map()
    for (const e of entries) sizeOf.set(e.home, (sizeOf.get(e.home) || 0) + 1)
    const finalOf = new Map()
    for (const comp of tarjanSCC(nodes, edges)) {
        // singleton -> its own module; cycle -> name after the largest member (most types;
        // alphabetical tie-break for determinism) + `SharedTypes`, NOT every member
        // concatenated (which was 40+ chars and reshuffled on any SCC edge change). (#35)
        let fm
        if (comp.length === 1) {
            fm = comp[0]
        } else {
            const largest = [...comp].sort((a, b) => (sizeOf.get(b) || 0) - (sizeOf.get(a) || 0) || a.localeCompare(b))[0]
            fm = largest.replace(/Types$/, '') + 'SharedTypes'
        }
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
    const objUnboxed = unboxed.filter(isObjectUnboxed)
    const opaque = entries.filter((e) => e.kind === 'opaque')
    const idOf = (e) => e.key
    const depsOf = (e) => e.deps || []
    if (hasRecGroupLabelCollision(records, objUnboxed, opaque, idOf, depsOf)) lines.push('@@warning("-30")', '') // silence duplicate-label noise
    // Abstract instance types for class exports — `type counter` (no deps; the dependency sink).
    for (const n of entries.filter((e) => e.kind === 'nominal')) lines.push(`type ${n.name}`)
    renderEnums(entries.filter((e) => e.kind === 'enum'), lines)
    renderPolyvariants(entries.filter((e) => e.kind === 'polyvariant'), lines) // leaf types, before referrers
    renderUnboxed(unboxed.filter((u) => !isObjectUnboxed(u)), lines, cfg) // primitive: before records
    // records + object-bearing variants + opaque-type modules in dependency order
    emitOrderedTypes(records, objUnboxed, opaque, idOf, depsOf, lines, cfg)
    return lines.join('\n') + '\n'
}
