// extract.mjs — TypeScript Compiler API -> normalized IR
// The type-CHECKER (not the AST) is what resolves Omit / intersection /
// RefAttributes / indexed-access / generics into a flat property list.

import ts from 'typescript'
import { dirname } from 'path'

// Well-known type names we special-case (matched via alias/symbol name).
const REACT_EVENTS = {
    MouseEvent: 'ReactEvent.Mouse.t',
    ChangeEvent: 'ReactEvent.Form.t',
    FocusEvent: 'ReactEvent.Focus.t',
    KeyboardEvent: 'ReactEvent.Keyboard.t',
    FormEvent: 'ReactEvent.Form.t',
    ClipboardEvent: 'ReactEvent.Clipboard.t',
    DragEvent: 'ReactEvent.Mouse.t',
    TouchEvent: 'ReactEvent.Touch.t',
    WheelEvent: 'ReactEvent.Wheel.t',
    UIEvent: 'ReactEvent.UI.t',
    AnimationEvent: 'ReactEvent.Animation.t',
}

// Common HTML/ARIA attributes worth keeping on inherited (DOM-spread) props.
// Everything else from HTMLAttributes is dropped to match the canonical style.
const DEFAULT_HTML_ALLOWLIST = [
    'children', 'id', 'className', 'style', 'title', 'role', 'tabIndex', 'name', 'value',
    'type', 'autoFocus', 'disabled', 'hidden', 'form', 'formAction', 'formEncType',
    'formMethod', 'formNoValidate', 'formTarget', 'placeholder', 'readOnly',
    'required', 'maxLength', 'minLength', 'max', 'min', 'step', 'checked',
    'defaultValue', 'defaultChecked', 'multiple', 'pattern', 'accept', 'href',
    'target', 'rel', 'src', 'alt', 'width', 'height',
    'onClick', 'onDoubleClick', 'onBlur', 'onFocus', 'onChange', 'onInput',
    'onSubmit', 'onMouseDown', 'onMouseUp', 'onMouseEnter', 'onMouseLeave',
    'onMouseOver', 'onMouseOut', 'onMouseMove', 'onKeyDown', 'onKeyUp',
    'onKeyPress', 'onScroll', 'onWheel', 'onContextMenu', 'onPaste', 'onCopy',
    'onCut', 'onDrag', 'onDrop',
    'aria-label', 'aria-labelledby', 'aria-describedby', 'aria-hidden',
    'aria-expanded', 'aria-pressed', 'aria-haspopup', 'aria-controls',
    'aria-current', 'aria-disabled', 'aria-selected', 'aria-checked',
    'aria-live', 'aria-required', 'aria-invalid',
]

function makeProgram(entryFile) {
    const options = {
        target: ts.ScriptTarget.ES2020,
        module: ts.ModuleKind.ESNext,
        moduleResolution: ts.ModuleResolutionKind.Bundler,
        jsx: ts.JsxEmit.ReactJSX,
        skipLibCheck: true,
        strict: false,
        baseUrl: dirname(entryFile),
        noEmit: true,
        allowJs: true,
    }
    return ts.createProgram([entryFile], options)
}

// Best-effort name for a type: alias name first (ReactNode, CSSProperties…),
// then the symbol name (Date, ButtonType, HTMLButtonElement…).
function typeName(type) {
    if (type.aliasSymbol) return type.aliasSymbol.getName()
    const s = type.getSymbol() || type.symbol
    if (s) return s.getName()
    return undefined
}

function pascal(raw) {
    const cleaned = String(raw).replace(/[^a-zA-Z0-9]+/g, ' ').trim()
    if (!cleaned) return 'Value'
    let out = cleaned
        .split(/\s+/)
        .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
        .join('')
    // ReScript variant constructors must start with an uppercase LETTER.
    // Values like "2xl" / "12h" would start with a digit -> prefix.
    if (!/^[A-Z]/.test(out)) out = 'V' + out
    return out
}

// Does this type look like a React component? (FC, ForwardRefExoticComponent,
// or any callable whose first param is an object of props.)
function isReactComponent(type, checker) {
    const n = typeName(type) || ''
    if (/ExoticComponent|FunctionComponent|^FC$|ComponentType|ComponentClass/.test(n)) return true
    const sigs = type.getCallSignatures()
    for (const sig of sigs) {
        const ret = sig.getReturnType()
        const rn = typeName(ret) || checker.typeToString(ret)
        if (/Element|ReactNode|ReactElement|JSX/.test(rn)) return true
    }
    return false
}

// Build the props IR for one component symbol.
function buildComponentIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const compType = checker.getTypeOfSymbolAtLocation(sym, decl)

    const sigs = compType.getCallSignatures()
    let propsType
    if (sigs.length && sigs[0].parameters.length) {
        propsType = checker.getTypeOfSymbolAtLocation(sigs[0].parameters[0], decl)
    } else {
        const args = checker.getTypeArguments?.(compType) || []
        propsType = args[0] || compType
    }

    const enums = []
    const records = []
    const unboxed = []
    const ctx = { checker, decl, enums, records, unboxed, seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map() }
    const allow = new Set(opts.htmlAllowlist || DEFAULT_HTML_ALLOWLIST)

    const isInherited = (p) => {
        const d = p.declarations && p.declarations[0]
        const f = (d && d.getSourceFile().fileName) || ''
        return /node_modules\/(@types|typescript)\//.test(f) || /\/lib\.(dom|es|scripthost)/.test(f)
    }

    const props = checker
        .getPropertiesOfType(propsType)
        .filter((p) => !['ref', 'key'].includes(p.getName()))
        .filter((p) => !isInherited(p) || allow.has(p.getName()))
        .map((p) => {
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
            const t = checker.getTypeOfSymbolAtLocation(p, decl)
            const d = p.declarations && p.declarations[0]
            return {
                name: p.getName(),
                optional,
                inherited: isInherited(p),
                type: classify(t, ctx, p.getName()),
                // raw TS info, used by the report to describe unmapped props
                tsType: checker.typeToString(t).replace(/\s+/g, ' ').slice(0, 200),
                declText: (d ? d.getText() : '').replace(/\s+/g, ' ').trim().slice(0, 200),
            }
        })

    return { module: importName, import: { from, name: importName }, kind: 'react-component', enums, records, unboxed, props }
}

// Single-component entry (a per-component .d.ts like blend's Button/Button.d.ts).
export function extractComponent(entryFile, opts = {}) {
    const program = makeProgram(entryFile)
    const checker = program.getTypeChecker()
    const source = program.getSourceFile(entryFile)
    if (!source) throw new Error(`Could not load source file: ${entryFile}`)

    const moduleSymbol = checker.getSymbolAtLocation(source)
    if (!moduleSymbol) throw new Error(`No module symbol for ${entryFile}`)
    const exports = checker.getExportsOfModule(moduleSymbol)

    let exp =
        exports.find((e) => e.getName() === 'default') ||
        exports.find((e) => /^[A-Z]/.test(e.getName()))
    if (!exp) throw new Error(`No exported component found in ${entryFile}`)

    const importName = opts.importName || (exp.getName() === 'default' ? guessName(entryFile) : exp.getName())
    const from = opts.from || '@juspay/blend-design-system'
    return buildComponentIR(checker, exp, source, importName, from, opts)
}

// Whole-module entry (a package's main index.d.ts) — enumerate every exported
// React component and build an IR for each. Returns { components: [{name, ir}], skipped: [{name, reason}] }.
export function extractModule(entryFile, opts = {}) {
    const program = makeProgram(entryFile)
    const checker = program.getTypeChecker()
    const source = program.getSourceFile(entryFile)
    if (!source) throw new Error(`Could not load source file: ${entryFile}`)

    const moduleSymbol = checker.getSymbolAtLocation(source)
    if (!moduleSymbol) throw new Error(`No module symbol for ${entryFile}`)
    const exports = checker.getExportsOfModule(moduleSymbol)
    const from = opts.from

    const components = []
    const skipped = []
    const seen = new Set()
    for (const exp of exports) {
        let sym = exp
        if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
        // Resolve a usable component name; default exports inherit their original name.
        let name = exp.getName()
        if (name === 'default' || name === 'export=') {
            const real = sym.getName()
            name = real && real !== 'default' && /^[A-Z]/.test(real) ? real : guessName(entryFile)
        }
        if (seen.has(name)) continue
        const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0])
        if (!decl) { skipped.push({ name, reason: 'no-declaration' }); continue }
        let type
        try { type = checker.getTypeOfSymbolAtLocation(sym, decl) } catch { skipped.push({ name, reason: 'type-error' }); continue }
        if (!isReactComponent(type, checker)) { skipped.push({ name, reason: 'not-a-component' }); continue }
        try {
            const ir = buildComponentIR(checker, sym, source, name, from, opts)
            seen.add(name)
            if (ir.props.length) components.push({ name, ir })
            else skipped.push({ name, reason: 'no-props' })
        } catch (e) {
            skipped.push({ name, reason: 'extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
        }
    }
    return { components, skipped }
}

function guessName(file) {
    const base = file.split('/').pop().replace(/\.d\.ts$/, '').replace(/\.tsx?$/, '')
    return base
}

const MAX_DEPTH = 6

// classify: TS type -> IR type node. ctx accumulates named enums/records.
function classify(type, ctx, propName = '', depth = 0) {
    const { checker } = ctx
    const flags = type.flags

    // depth / cycle guards — complex library types resolve to deep self-
    // referential object graphs; beyond a few levels we emit opaque + flag.
    if (depth > MAX_DEPTH) return { kind: 'opaque', text: checker.typeToString(type) }
    if (type.id != null) {
        if (!ctx.visiting) ctx.visiting = new Set()
        if (ctx.visiting.has(type.id)) return { kind: 'opaque', text: checker.typeToString(type) }
    }

    // unknown / any -> flagged defect, never mapped.
    if (flags & ts.TypeFlags.Unknown) return { kind: 'unknown' }
    if (flags & ts.TypeFlags.Any) return { kind: 'any' }

    // primitives
    if (flags & ts.TypeFlags.String) return { kind: 'string' }
    if (flags & ts.TypeFlags.Number) return { kind: 'number' }
    if (flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return { kind: 'boolean' }

    const name = typeName(type)

    // well-known named types
    if (name === 'Date') return { kind: 'date' }
    if (name === 'ReactNode' || name === 'ReactElement' || name === 'ReactNode[]')
        return { kind: 'reactElement' }
    if (name === 'CSSProperties') return { kind: 'style' }
    if (name === 'Ref' || name === 'RefObject' || name === 'MutableRefObject' || name === 'LegacyRef')
        return { kind: 'domRef' }
    if (name && /Element$/.test(name) && /^(HTML|SVG|Dom)/.test(name)) return { kind: 'domElement' }

    // enum (real TS enum used as a type)
    if (flags & ts.TypeFlags.EnumLike) {
        return enumNode(type, ctx, propName)
    }

    // arrays
    if (checker.isArrayType?.(type)) {
        const elem = checker.getTypeArguments(type)[0]
        return { kind: 'array', of: classify(elem, ctx, propName, depth + 1) }
    }

    // Record<K,V> / index-signature dicts
    if (name === 'Record') {
        const args = checker.getTypeArguments(type)
        return { kind: 'dict', of: args[1] ? classify(args[1], ctx, propName, depth + 1) : { kind: 'opaque', text: 'JSON.t' } }
    }

    // functions / callbacks
    const callSigs = type.getCallSignatures()
    if (callSigs.length) {
        return functionNode(callSigs[0], ctx, propName, depth)
    }

    // unions
    if (flags & ts.TypeFlags.Union) {
        return unionNode(type, ctx, propName, depth)
    }

    // anonymous object literal -> inline record.
    // Only genuine anonymous literals (symbol "__type") become records;
    // named/complex library objects are emitted opaque to avoid deep graphs.
    const sym = type.getSymbol() || type.symbol
    const isAnonObject =
        flags & ts.TypeFlags.Object &&
        type.getProperties().length > 0 &&
        sym &&
        sym.getName() === '__type'
    if (isAnonObject) {
        return recordNode(type, ctx, propName, depth)
    }

    // give up -> opaque, flagged for review
    return { kind: 'opaque', text: checker.typeToString(type) }
}

function enumNode(type, ctx, propName) {
    const { checker } = ctx
    const ename = typeName(type) || pascal(propName)
    const members = []
    const constituents = type.isUnion?.() ? type.types : [type]
    for (const c of constituents) {
        if (c.isLiteral && c.isLiteral()) {
            const value = c.value
            // Derive the ReScript constructor from the string VALUE (primary -> Primary)
            // so output matches canonical style; fall back to the member name for numerics.
            const basis = typeof value === 'string' ? value : (c.symbol ? c.symbol.getName() : String(value))
            members.push({ as: String(value), ctor: pascal(basis) })
        }
    }
    const key = lower(ename)
    if (!ctx.seenEnums.has(key)) {
        ctx.seenEnums.set(key, true)
        ctx.enums.push({ name: key, members })
    }
    return { kind: 'typeRef', to: key, _enum: true }
}

const RESCRIPT_RESERVED = new Set([
    'type', 'and', 'as', 'open', 'let', 'rec', 'in', 'switch', 'if', 'else',
    'for', 'while', 'fun', 'mutable', 'try', 'exception', 'module', 'external',
    'when', 'with', 'lazy', 'assert', 'true', 'false', 'include', 'of', 'to',
])

function lower(s) {
    let n = s.charAt(0).toLowerCase() + s.slice(1)
    n = n.replace(/[^a-zA-Z0-9_]/g, '_')
    if (RESCRIPT_RESERVED.has(n) || /^[0-9]/.test(n)) n = n + '_'
    return n
}

function unionNode(type, ctx, propName, depth = 0) {
    const { checker } = ctx
    // strip null/undefined (handled by optional)
    const parts = type.types.filter(
        (t) => !(t.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined))
    )
    if (parts.length === 1) return classify(parts[0], ctx, propName, depth + 1)

    // all string literals -> @as variant
    if (parts.every((t) => t.isStringLiteral && t.isStringLiteral())) {
        const ename = pascal(propName)
        const members = parts.map((t) => ({ as: t.value, ctor: pascal(t.value) }))
        const key = lower(ename)
        if (!ctx.seenEnums.has(key)) {
            ctx.seenEnums.set(key, true)
            ctx.enums.push({ name: key, members })
        }
        return { kind: 'typeRef', to: key, _enum: true }
    }

    // boolean union (true|false)
    if (parts.every((t) => t.flags & (ts.TypeFlags.BooleanLiteral | ts.TypeFlags.Boolean)))
        return { kind: 'boolean' }

    // Genuine multi-runtime-type union (string|number, string|string[], …).
    // Emit a ReScript 11 UNTAGGED variant — type-safe AND zero-cost (the raw
    // value reaches JS, no %identity, no wrapper). Only possible when every
    // member has a DISTINCT runtime type (typeof/Array.isArray can discriminate).
    const members = []
    const usedRt = new Set()
    let discriminable = parts.length >= 2
    for (const p of parts) {
        const m = memberOf(p, ctx, propName, depth)
        if (!m || usedRt.has(m.rt)) { discriminable = false; break }
        usedRt.add(m.rt)
        members.push({ ctor: m.ctor, type: m.type })
    }
    if (discriminable) {
        const name = lower(pascal(propName)) + 'Value'
        if (!ctx.seenUnboxed.has(name)) {
            ctx.seenUnboxed.set(name, true)
            ctx.unboxed.push({ name, members })
        }
        return { kind: 'typeRef', to: name, _unboxed: true }
    }

    // Not cleanly discriminable. Flag for human review ONLY if a member is
    // genuinely structured (function / array / named object) — those need a real
    // decision. String-ish unions (CSSObject['width'] = string & {} | Globals |
    // number, etc.) are fine as `string` → loose, matching the canonical bindings.
    const isStructured = (t) => {
        if (t.getCallSignatures && t.getCallSignatures().length) return true // function
        if (asArray(t, checker)) return true // array
        const s = t.getSymbol && t.getSymbol()
        if ((t.flags & ts.TypeFlags.Object) && s && s.getName() !== '__type' && t.getProperties().length) return true // named object
        return false
    }
    if (parts.some(isStructured)) return { kind: 'review', text: checker.typeToString(type) }
    return { kind: 'opaque', text: checker.typeToString(type) }
}

// Is `t` an Array / ReadonlyArray? Return the element type or null.
function asArray(t, checker) {
    if (checker.isArrayType && checker.isArrayType(t)) return checker.getTypeArguments(t)[0]
    const n = typeName(t)
    if ((n === 'ReadonlyArray' || n === 'Array') && checker.getTypeArguments) {
        const a = checker.getTypeArguments(t)
        if (a && a[0]) return a[0]
    }
    return null
}

// Map one union member to an untagged-variant constructor.
// rt = runtime kind used to check discriminability (no two members may share it).
function memberOf(t, ctx, propName, depth) {
    const c = ctx.checker
    if (t.flags & (ts.TypeFlags.String | ts.TypeFlags.StringLiteral)) return { ctor: 'Str', rt: 'string', type: { kind: 'string' } }
    if (t.flags & (ts.TypeFlags.Number | ts.TypeFlags.NumberLiteral)) return { ctor: 'Num', rt: 'number', type: { kind: 'number', _float: true } }
    if (t.flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return { ctor: 'Bool', rt: 'boolean', type: { kind: 'boolean' } }
    const elem = asArray(t, c)
    if (elem) {
        const inner = memberOf(elem, ctx, propName, depth)
        const ctor = inner ? inner.ctor + 'Arr' : 'Arr'
        const elemType = inner ? inner.type : classify(elem, ctx, propName, depth + 1)
        return { ctor, rt: 'array', type: { kind: 'array', of: elemType } }
    }
    return null // objects / functions / etc. — not auto-discriminable
}

function functionNode(sig, ctx, propName, depth = 0) {
    const { checker } = ctx
    const params = sig.getParameters()
    // single event-typed param -> Event.t => unit
    if (params.length >= 1) {
        const p0 = checker.getTypeOfSymbolAtLocation(params[0], ctx.decl)
        const n = typeName(p0)
        if (n && REACT_EVENTS[n]) return { kind: 'callback', arg: { kind: 'event', res: REACT_EVENTS[n] }, ret: { kind: 'unit' } }
    }
    if (params.length === 0) return { kind: 'callback', arg: { kind: 'unit' }, ret: { kind: 'unit' } }
    const argType = checker.getTypeOfSymbolAtLocation(params[0], ctx.decl)
    return {
        kind: 'callback',
        arg: classify(argType, ctx, propName, depth + 1),
        ret: { kind: 'unit' },
    }
}

function recordNode(type, ctx, propName, depth = 0) {
    const { checker } = ctx
    if (type.id != null) ctx.visiting?.add(type.id)
    const rname = lower(pascal(propName)) + 'Config'
    const fields = type.getProperties().map((p) => {
        const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
        const t = checker.getTypeOfSymbolAtLocation(p, ctx.decl)
        return { name: p.getName(), optional, type: classify(t, ctx, p.getName(), depth + 1) }
    })
    if (type.id != null) ctx.visiting?.delete(type.id)
    if (!ctx.seenRecords.has(rname)) {
        ctx.seenRecords.set(rname, true)
        ctx.records.push({ name: rname, fields })
    }
    return { kind: 'typeRef', to: rname }
}
