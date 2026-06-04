// emit.mjs — IR -> ReScript 12 source (house style from juspay-portal bindings)

const RESERVED = new Set([
    'type', 'and', 'as', 'open', 'let', 'rec', 'in', 'switch', 'if', 'else',
    'for', 'while', 'fun', 'mutable', 'try', 'catch', 'exception', 'module',
    'external', 'when', 'with', 'lazy', 'assert', 'true', 'false', 'include',
    'constraint', 'private', 'of', 'to', 'downto',
])

// number props whose name implies a count/index -> int (else float).
const INT_BY_NAME = new Set([
    'width', 'height', 'size', 'count', 'index', 'length', 'offset', 'zIndex',
    'tabIndex', 'maxLength', 'minLength', 'duration', 'rows', 'cols', 'span',
    'colSpan', 'rowSpan', 'level', 'step', 'min', 'max',
])

function camelFromKebab(name) {
    return name.replace(/-([a-z])/g, (_, c) => c.toUpperCase()).replace(/-/g, '')
}

// returns { as: string|null, id: string }
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

function numberType(propName) {
    return INT_BY_NAME.has(propName) ? 'int' : 'float'
}

// render an IR type node -> ReScript type string
function renderType(t, propName, cfg) {
    switch (t.kind) {
        case 'string': return 'string'
        // untagged-variant members force float (JS can't untag int vs float)
        case 'number': return t._float ? 'float' : numberType(propName)
        case 'boolean': return 'bool'
        case 'reactElement': return 'React.element'
        case 'style': return 'JsxDOM.style'
        case 'date': return 'Date.t'
        case 'domElement': return 'Dom.element'
        case 'domRef': return cfg.refType
        case 'typeRef': return t.to
        case 'stringOrNumber': return '[#String(string) | #Number(float)]'
        case 'array': return `array<${renderType(t.of, propName, cfg)}>`
        case 'dict': return `Dict.t<${renderType(t.of, propName, cfg)}>`
        case 'callback': {
            const arg =
                t.arg.kind === 'event' ? t.arg.res
                : t.arg.kind === 'unit' ? 'unit'
                : renderType(t.arg, propName, cfg)
            return `${arg} => unit`
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

export function emit(ir, options = {}) {
    const cfg = {
        from: ir.import.from,
        refType: options.refType || 'React.ref<Nullable.t<Dom.element>>',
        opaqueFallback: options.opaqueFallback || 'string',
    }
    const lines = []

    // 1. enum (variant) type declarations
    for (const e of ir.enums) {
        lines.push(`type ${e.name} =`)
        for (const m of e.members) {
            lines.push(`  | @as(${JSON.stringify(m.as)}) ${m.ctor}`)
        }
    }

    // 1b. untagged (@unboxed) variant declarations — type-safe multi-type props
    for (const u of ir.unboxed || []) {
        const ctors = u.members.map((m) => `${m.ctor}(${renderType(m.type, '', cfg)})`).join(' | ')
        lines.push(`@unboxed type ${u.name} = ${ctors}`)
    }

    // 2. record type declarations
    for (const r of ir.records) {
        lines.push(`type ${r.name} = {`)
        for (const f of r.fields) {
            const { as, id } = label(f.name)
            const asPrefix = as ? `@as(${JSON.stringify(as)}) ` : ''
            const ty = renderType(f.type, f.name, cfg)
            lines.push(`  ${asPrefix}${id}${f.optional ? '?' : ''}: ${ty},`)
        }
        lines.push('}')
    }

    if (lines.length) lines.push('')

    // 3. the external binding
    lines.push(`@module(${JSON.stringify(cfg.from)}) @react.component`)
    lines.push(`external make: (`)
    for (const p of ir.props) {
        const { as, id } = label(p.name)
        const asPrefix = as ? `@as(${JSON.stringify(as)}) ` : ''
        const ty = renderType(p.type, p.name, cfg)
        // Flag non-inherited props we couldn't bind type-safely (no %identity hack).
        if (p.type.kind === 'review' && !p.inherited) {
            lines.push(`  // ⚠️ REVIEW: \`${p.name}\` is \`${p.type.text}\` — multi-type that can't be auto-discriminated; emitted as \`${cfg.opaqueFallback}\` placeholder. Bind by hand or fix upstream.`)
        }
        lines.push(`  ${asPrefix}~${id}: ${ty}${p.optional ? '=?' : ''},`)
    }
    lines.push(`) => React.element = ${JSON.stringify(ir.import.name)}`)
    lines.push('')

    return lines.join('\n')
}

// report which props fell back to loose / are flagged as defects.
// Returns detailed items: { prop, kind, tsType, declText, emittedAs }.
export function report(ir) {
    const loose = []
    const defects = []
    const review = []
    const verdict = (t) => {
        if (!t) return null
        if (t.kind === 'unknown' || t.kind === 'any') return t.kind
        if (t.kind === 'opaque') return 'opaque'
        if (t.kind === 'review') return 'review'
        if (t.of) return verdict(t.of)
        if (t.arg) return verdict(t.arg)
        return null
    }
    for (const p of ir.props) {
        const v = verdict(p.type)
        if (!v) continue
        const item = { prop: p.name, kind: v, tsType: p.tsType, declText: p.declText }
        if (v === 'unknown' || v === 'any') defects.push(item)
        else if (v === 'review' && !p.inherited) review.push(item) // needs human, multi-type
        else { item.emittedAs = 'string'; loose.push(item) } // opaque, or inherited review
    }
    return { loose, defects, review }
}
