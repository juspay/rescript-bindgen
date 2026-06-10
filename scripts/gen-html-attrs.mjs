// ============================================================================
// gen-html-attrs.mjs — DEV-TIME generator for src/html-attrs-data.mjs.
//
// Reads the DECLARED members of React's attribute interfaces from the pinned
// @types/react (devDependency, exact version) and emits them as structured
// data modelling the hierarchy:
//
//   AriaAttributes ─┐
//   DOMAttributes  ─┴→ HTMLAttributes → 50+ per-element *HTMLAttributes leaves
//
// This is OUR OWN attribute library — not rescript-webapi (which has no JSX
// attribute types) and not MDN-crawled (@types/react IS the versioned,
// machine-readable encoding of the same data). Update loop:
//
//   1. bump the exact @types/react pin in package.json devDependencies
//   2. npm run gen:attrs
//   3. review the src/html-attrs-data.mjs diff + golden diffs
//
// Deterministic: same pin -> byte-identical output. Run: npm run gen:attrs
// ============================================================================
import ts from 'typescript'
import { readFileSync, writeFileSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'
import { label, numberType } from '../src/emit.mjs'

const ROOT = dirname(dirname(fileURLToPath(import.meta.url)))
const OUT = join(ROOT, 'src', 'html-attrs-data.mjs')

const pkg = JSON.parse(readFileSync(join(ROOT, 'package.json'), 'utf-8'))
const PIN = pkg.devDependencies?.['@types/react']
if (!PIN || !/^\d/.test(PIN)) {
    console.error('gen-html-attrs: @types/react must be an EXACT-version devDependency (the pin is the contract)')
    process.exit(1)
}

const DTS = join(ROOT, 'node_modules', '@types', 'react', 'index.d.ts')
const installed = JSON.parse(readFileSync(join(ROOT, 'node_modules', '@types', 'react', 'package.json'), 'utf-8')).version
if (installed !== PIN) {
    console.error(`gen-html-attrs: installed @types/react ${installed} != pinned ${PIN} — run npm install first`)
    process.exit(1)
}

// ── mapping tables (deterministic, no checker) ──────────────────────────────

// aria-* → ReScript type. Enums/bools/numerics follow JsxDOM.res precedent;
// any aria-* not listed here is a string (correct for the newer label-ish ones).
const ARIA = {
    'aria-checked': '[#"true" | #"false" | #mixed]',
    'aria-pressed': '[#"true" | #"false" | #mixed]',
    'aria-current': '[#page | #step | #location | #date | #time | #"true" | #"false"]',
    'aria-haspopup': '[#menu | #listbox | #tree | #grid | #dialog | #"true" | #"false"]',
    'aria-invalid': '[#grammar | #"false" | #spelling | #"true"]',
    'aria-autocomplete': '[#inline | #list | #both | #none]',
    'aria-orientation': '[#horizontal | #vertical | #undefined]',
    'aria-live': '[#off | #polite | #assertive | #rude]',
    'aria-dropeffect': '[#copy | #move | #link | #execute | #popup | #none]',
    'aria-disabled': 'bool', 'aria-hidden': 'bool', 'aria-expanded': 'bool',
    'aria-modal': 'bool', 'aria-multiline': 'bool', 'aria-multiselectable': 'bool',
    'aria-readonly': 'bool', 'aria-required': 'bool', 'aria-selected': 'bool',
    'aria-atomic': 'bool', 'aria-busy': 'bool', 'aria-grabbed': 'bool',
    'aria-level': 'int', 'aria-colcount': 'int', 'aria-colindex': 'int',
    'aria-colspan': 'int', 'aria-posinset': 'int', 'aria-rowcount': 'int',
    'aria-rowindex': 'int', 'aria-rowspan': 'int', 'aria-setsize': 'int',
    'aria-valuemax': 'float', 'aria-valuemin': 'float', 'aria-valuenow': 'float',
}

// React `*EventHandler<T>` aliases → ReScript callback type. ReactEvent has a
// dedicated module per category (incl. Pointer/Composition/Transition), so the
// attribute library maps each handler to its precise event — strictly better
// than collapsing to Mouse, and proven compilable by the render-compile test.
const HANDLERS = {
    ReactEventHandler: 'ReactEvent.Synthetic.t',
    ClipboardEventHandler: 'ReactEvent.Clipboard.t',
    CompositionEventHandler: 'ReactEvent.Composition.t',
    DragEventHandler: 'ReactEvent.Mouse.t', // DragEvent extends MouseEvent; no ReactEvent.Drag module
    FocusEventHandler: 'ReactEvent.Focus.t',
    FormEventHandler: 'ReactEvent.Form.t',
    ChangeEventHandler: 'ReactEvent.Form.t',
    InputEventHandler: 'ReactEvent.Form.t',
    SubmitEventHandler: 'ReactEvent.Form.t',
    KeyboardEventHandler: 'ReactEvent.Keyboard.t',
    MouseEventHandler: 'ReactEvent.Mouse.t',
    TouchEventHandler: 'ReactEvent.Touch.t',
    PointerEventHandler: 'ReactEvent.Pointer.t',
    UIEventHandler: 'ReactEvent.UI.t',
    WheelEventHandler: 'ReactEvent.Wheel.t',
    AnimationEventHandler: 'ReactEvent.Animation.t',
    TransitionEventHandler: 'ReactEvent.Transition.t',
    ToggleEventHandler: 'ReactEvent.Synthetic.t',
}

// Named TS reference types → ReScript. Anything not here falls back to `string`
// (flagged loose in the summary). String-ish unions with `(string & {})` escape
// hatches (AnchorTarget, InputType, ReferrerPolicy…) are deliberately `string`.
const NAMED = {
    Booleanish: 'bool',
    CSSProperties: 'JsxDOM.style',
    ReactNode: 'React.element',
    ReactElement: 'React.element',
    AriaRole: 'string',
    HTMLAttributeReferrerPolicy: 'string', // union includes "" — not poly-variant-able
    HTMLAttributeAnchorTarget: 'string',
    HTMLInputTypeAttribute: 'string',
    HTMLInputAutoCompleteAttribute: 'string',
    CrossOrigin: 'string', // union includes ""
    TrustedHTML: 'string',
}

const polyTag = (s) => (/^[A-Za-z][A-Za-z0-9_]*$/.test(s) && !['true', 'false'].includes(s) ? `#${s}` : `#${JSON.stringify(s)}`)

let looseCount = 0
const loose = []

/** Map one member's syntactic type node to a ReScript type string. */
function mapType(fieldName, node) {
    if (!node) return fallback(fieldName, '<none>')
    switch (node.kind) {
        case ts.SyntaxKind.StringKeyword: return 'string'
        case ts.SyntaxKind.BooleanKeyword: return 'bool'
        case ts.SyntaxKind.NumberKeyword: return numberType(fieldName)
        case ts.SyntaxKind.AnyKeyword:
        case ts.SyntaxKind.UnknownKeyword: return fallback(fieldName, 'any/unknown')
        case ts.SyntaxKind.LiteralType: {
            const lit = node.literal
            if (ts.isStringLiteral(lit)) return `[${polyTag(lit.text)}]`
            return fallback(fieldName, 'non-string literal')
        }
        case ts.SyntaxKind.TypeReference: {
            const name = node.typeName.getText()
            if (HANDLERS[name]) return `${HANDLERS[name]} => unit`
            if (NAMED[name] !== undefined) return NAMED[name]
            return fallback(fieldName, name)
        }
        case ts.SyntaxKind.UnionType: {
            // strip undefined/null
            const parts = node.types.filter((t) =>
                t.kind !== ts.SyntaxKind.UndefinedKeyword &&
                !(ts.isLiteralTypeNode(t) && t.literal.kind === ts.SyntaxKind.NullKeyword))
            if (parts.length === 1) return mapType(fieldName, parts[0])
            const kinds = parts.map((t) => t.kind)
            // boolean | "true" | "false" (inline Booleanish) → bool
            const lits = parts.filter((t) => ts.isLiteralTypeNode(t) && ts.isStringLiteral(t.literal)).map((t) => t.literal.text)
            if (kinds.includes(ts.SyntaxKind.BooleanKeyword) && lits.every((s) => s === 'true' || s === 'false')) return 'bool'
            // all string literals → inline closed poly variant
            if (lits.length === parts.length) {
                if (lits.some((s) => s === '')) return 'string' // "" can't be a poly tag
                return `[${lits.map(polyTag).join(' | ')}]`
            }
            // string | number (| readonly string[]) — the value/defaultValue shape → string (JsxDOM precedent)
            if (kinds.every((k) => k === ts.SyntaxKind.StringKeyword || k === ts.SyntaxKind.NumberKeyword || k === ts.SyntaxKind.TypeOperator || k === ts.SyntaxKind.ArrayType)) return 'string'
            // string | SomethingElse → string keeps it usable
            if (kinds.includes(ts.SyntaxKind.StringKeyword)) return 'string'
            if (kinds.includes(ts.SyntaxKind.NumberKeyword)) return numberType(fieldName)
            if (kinds.includes(ts.SyntaxKind.BooleanKeyword)) return 'bool'
            return fallback(fieldName, 'mixed union')
        }
        case ts.SyntaxKind.TypeLiteral: {
            // dangerouslySetInnerHTML?: { __html: string | TrustedHTML }
            if (fieldName === 'dangerouslySetInnerHTML') return '{"__html": string}'
            return fallback(fieldName, 'object literal')
        }
        default: return fallback(fieldName, ts.SyntaxKind[node.kind])
    }
}

function fallback(fieldName, why) {
    looseCount++
    loose.push(`${fieldName} (${why})`)
    return 'string'
}

// ── walk @types/react ───────────────────────────────────────────────────────
const sf = ts.createSourceFile('index.d.ts', readFileSync(DTS, 'utf-8'), ts.ScriptTarget.Latest, true)

const SPECIAL_GROUP_NAMES = { HTMLAttributes: 'htmlAttributes', DOMAttributes: 'domAttributes', AriaAttributes: 'ariaAttributes' }
const groupNameOf = (tsName) => SPECIAL_GROUP_NAMES[tsName] || tsName.charAt(0).toLowerCase() + tsName.slice(1)
const isTarget = (n) =>
    n === 'AriaAttributes' || n === 'DOMAttributes' ||
    (/HTMLAttributes$/.test(n) && n !== 'AllHTMLAttributes')

/** Collect target InterfaceDeclarations from the top level and `declare namespace React`. */
function collectInterfaces(node, out) {
    if (ts.isInterfaceDeclaration(node) && isTarget(node.name.text)) out.push(node)
    else if (ts.isModuleDeclaration(node) && node.body && ts.isModuleBlock(node.body)) {
        for (const s of node.body.statements) collectInterfaces(s, out)
    }
}
const ifaces = []
for (const s of sf.statements) collectInterfaces(s, ifaces)
if (!ifaces.length) { console.error('gen-html-attrs: no attribute interfaces found — @types/react layout changed?'); process.exit(1) }

const groups = {} // groupName -> { ts, spreads: [groupName], fields: [{name, res}] }
for (const iface of ifaces) {
    const tsName = iface.name.text
    const g = groupNameOf(tsName)
    const spreads = []
    for (const h of iface.heritageClauses || []) {
        for (const t of h.types) {
            const base = t.expression.getText()
            if (isTarget(base)) spreads.push(groupNameOf(base))
        }
    }
    const fields = []
    for (const m of iface.members) {
        if (!ts.isPropertySignature(m) || !m.name) continue
        const name = ts.isStringLiteral(m.name) ? m.name.text : m.name.getText()
        const res = /^aria-/.test(name) ? (ARIA[name] || 'string') : (name === 'role' ? 'string' : mapType(name, m.type))
        fields.push({ name, res })
    }
    groups[g] = { ts: tsName, spreads, fields }
}

// ── override resolution (record spread forbids duplicate fields) ────────────
// A leaf redeclaring a chain field with the SAME rendered type → drop the
// redeclaration. A DIFFERENT type → keep the leaf's field and record the name
// in `overrides` (the renderer must narrow the base spread for that group).
function chainFieldMap(g, seen = new Set()) {
    if (seen.has(g)) return new Map()
    seen.add(g)
    const out = new Map()
    for (const s of groups[g]?.spreads || []) for (const [k, v] of chainFieldMap(s, seen)) out.set(k, v)
    for (const f of groups[g]?.fields || []) out.set(f.name, f.res)
    return out
}
let droppedOverrides = 0
for (const [g, def] of Object.entries(groups)) {
    if (!def.spreads.length) continue
    const inherited = new Map()
    for (const s of def.spreads) for (const [k, v] of chainFieldMap(s)) inherited.set(k, v)
    const overrides = []
    def.fields = def.fields.filter((f) => {
        if (!inherited.has(f.name)) return true
        if (inherited.get(f.name) === f.res) { droppedOverrides++; return false } // same type → spread already covers it
        overrides.push(f.name) // different type → leaf wins, base must be narrowed
        return true
    })
    if (overrides.length) def.overrides = overrides
}

// Sanity: post-resolution, no duplicate label() ids inside any group's own fields.
for (const [g, def] of Object.entries(groups)) {
    const ids = new Set()
    for (const f of def.fields) {
        const id = label(f.name).id
        if (ids.has(id)) { console.error(`gen-html-attrs: duplicate field id '${id}' in ${g}`); process.exit(1) }
        ids.add(id)
    }
}

// ── emit ────────────────────────────────────────────────────────────────────
const order = Object.keys(groups).sort((a, b) => {
    // dependency order (bases first), then alphabetical for stability
    const depth = (g, seen = new Set()) => seen.has(g) ? 0 : (seen.add(g), 1 + Math.max(0, ...(groups[g]?.spreads || []).map((s) => depth(s, seen))))
    return depth(a) - depth(b) || a.localeCompare(b)
})

const L = []
L.push('// ============================================================================')
L.push('// html-attrs-data.mjs — GENERATED by scripts/gen-html-attrs.mjs. DO NOT EDIT.')
L.push(`// Source: @types/react@${PIN} (exact devDependency pin — the update contract).`)
L.push('// Regenerate: bump the pin, npm install, npm run gen:attrs, review the diff.')
L.push('// ============================================================================')
L.push('')
L.push(`export const HTML_ATTRS_PIN = '@types/react@${PIN}'`)
L.push('')
L.push('// groupName -> { ts: TS interface name, spreads: [base groups], fields: [{name, res}],')
L.push('//                overrides?: [field names that REPLACE a base field (base must be narrowed)] }')
L.push('export const ATTR_GROUPS = {')
for (const g of order) {
    const d = groups[g]
    L.push(`  ${g}: {`)
    L.push(`    ts: '${d.ts}',`)
    L.push(`    spreads: [${d.spreads.map((s) => `'${s}'`).join(', ')}],`)
    if (d.overrides) L.push(`    overrides: [${d.overrides.map((s) => `'${s}'`).join(', ')}],`)
    L.push(`    fields: [`)
    for (const f of d.fields) L.push(`      { name: ${JSON.stringify(f.name)}, res: ${JSON.stringify(f.res)} },`)
    L.push(`    ],`)
    L.push(`  },`)
}
L.push('}')
L.push('')
writeFileSync(OUT, L.join('\n'))

const total = Object.values(groups).reduce((n, d) => n + d.fields.length, 0)
console.error(`[gen-html-attrs] ${Object.keys(groups).length} groups, ${total} fields → src/html-attrs-data.mjs`)
console.error(`[gen-html-attrs] dropped ${droppedOverrides} same-type override redeclaration(s); ${Object.values(groups).filter((d) => d.overrides).length} group(s) with typed overrides`)
console.error(`[gen-html-attrs] ${looseCount} field(s) fell back to string: ${loose.slice(0, 12).join(', ')}${loose.length > 12 ? ` … +${loose.length - 12}` : ''}`)
