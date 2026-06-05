// ============================================================================
// extract.mjs — STAGE 2 of the pipeline (the "brain"): a .d.ts -> normalized IR.
//
// It boots the real TypeScript compiler and uses the type-CHECKER (not the raw
// syntax tree) to read types. The checker is what resolves `Omit`, intersections,
// `RefAttributes`, indexed-access, imports, and generics into a flat, fully-
// computed property list — things a regex/text approach can never see.
//
// Output is the IR: a neutral data object describing the component's props and
// the types they need (enums, @unboxed variants, records). emit.mjs turns the IR
// into ReScript. The two never share concerns: this file knows TS, not ReScript.
//
// Mental model for classify(): get a Type -> ask which category it is (.flags)
// -> if it's a container (array/union/object/function), recurse into the inner
// type(s). See test/DEMOS.md for a hands-on walkthrough of these compiler calls.
// ============================================================================

import ts from 'typescript'
import { dirname } from 'path'

/**
 * React/DOM event types -> their ReScript equivalents. Matched by the type's
 * name so a callback param like `MouseEvent` becomes `ReactEvent.Mouse.t`.
 */
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

// HTML aria-* / role attributes -> the EXACT ReScript types the official
// @rescript/react JsxDOM module uses (node_modules/@rescript/runtime/.../JsxDOM.res).
// Mapped by name (aria names are standardised) so they get precise types instead of
// being widened to `string`. Poly variants here are structurally shared in ReScript.
const ARIA_TYPES = {
    // tri-state / enum -> polymorphic variants (verbatim from JsxDOM.res)
    'aria-checked': '[#"true" | #"false" | #mixed]',
    'aria-pressed': '[#"true" | #"false" | #mixed]',
    'aria-current': '[#page | #step | #location | #date | #time | #"true" | #"false"]',
    'aria-haspopup': '[#menu | #listbox | #tree | #grid | #dialog | #"true" | #"false"]',
    'aria-invalid': '[#grammar | #"false" | #spelling | #"true"]',
    'aria-autocomplete': '[#inline | #list | #both | #none]',
    'aria-orientation': '[#horizontal | #vertical | #undefined]',
    'aria-live': '[#off | #polite | #assertive | #rude]',
    'aria-dropeffect': '[#copy | #move | #link | #execute | #popup | #none]',
    // boolean aria
    'aria-disabled': 'bool', 'aria-hidden': 'bool', 'aria-expanded': 'bool',
    'aria-modal': 'bool', 'aria-multiline': 'bool', 'aria-multiselectable': 'bool',
    'aria-readonly': 'bool', 'aria-required': 'bool', 'aria-selected': 'bool',
    'aria-atomic': 'bool', 'aria-busy': 'bool', 'aria-grabbed': 'bool',
    // numeric aria
    'aria-level': 'int', 'aria-colcount': 'int', 'aria-colindex': 'int',
    'aria-colspan': 'int', 'aria-posinset': 'int', 'aria-rowcount': 'int',
    'aria-rowindex': 'int', 'aria-rowspan': 'int', 'aria-setsize': 'int',
    'aria-valuemax': 'float', 'aria-valuemin': 'float', 'aria-valuenow': 'float',
    // string aria / role
    'role': 'string', 'aria-label': 'string', 'aria-describedby': 'string',
    'aria-labelledby': 'string', 'aria-controls': 'string', 'aria-details': 'string',
    'aria-keyshortcuts': 'string', 'aria-roledescription': 'string',
    'aria-placeholder': 'string', 'aria-sort': 'string', 'aria-valuetext': 'string',
    'aria-relevant': 'string', 'aria-activedescendant': 'string',
    'aria-errormessage': 'string', 'aria-flowto': 'string', 'aria-owns': 'string',
}

// React `*EventHandler<T>` alias types -> their ReScript event. These often don't
// expose a call signature (the "bivariance hack" in @types/react), so we map them
// by NAME to a proper callback instead of letting them fall back to `string`.
const EVENT_HANDLERS = {
    MouseEventHandler: 'ReactEvent.Mouse.t',
    ChangeEventHandler: 'ReactEvent.Form.t',
    FormEventHandler: 'ReactEvent.Form.t',
    InputEventHandler: 'ReactEvent.Form.t',
    SubmitEventHandler: 'ReactEvent.Form.t',
    FocusEventHandler: 'ReactEvent.Focus.t',
    KeyboardEventHandler: 'ReactEvent.Keyboard.t',
    ClipboardEventHandler: 'ReactEvent.Clipboard.t',
    DragEventHandler: 'ReactEvent.Mouse.t',
    TouchEventHandler: 'ReactEvent.Touch.t',
    WheelEventHandler: 'ReactEvent.Wheel.t',
    UIEventHandler: 'ReactEvent.UI.t',
    AnimationEventHandler: 'ReactEvent.Animation.t',
    PointerEventHandler: 'ReactEvent.Mouse.t',
    ReactEventHandler: 'ReactEvent.Synthetic.t',
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

/**
 * Boot a TypeScript Program over one entry `.d.ts`. The compiler automatically
 * loads every file it imports (its types, `react`, etc.), so the checker can
 * resolve cross-file references. `skipLibCheck`/`strict:false` keep it fast since
 * we only READ types, never type-check the program.
 * @param {string} entryFile  absolute path to the `.d.ts`
 * @returns {ts.Program}
 */
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

/**
 * Best-effort readable name for a resolved type. Prefers the alias name
 * (`ReactNode`, `CSSProperties`) then the symbol name (`Date`, `ButtonType`,
 * `HTMLButtonElement`). Used to special-case well-known types.
 * @param {ts.Type} type
 * @returns {string | undefined}
 */
function typeName(type) {
    if (type.aliasSymbol) return type.aliasSymbol.getName()
    const s = type.getSymbol() || type.symbol
    if (s) return s.getName()
    return undefined
}

/**
 * Make a valid ReScript variant CONSTRUCTOR name from a raw value.
 * `"primary"` -> `Primary`, `"icon-only"` -> `IconOnly`, `"2xl"` -> `V2xl`
 * (constructors must start with an uppercase letter, so digit-leading get a `V`).
 * @param {string|number} raw
 * @returns {string}
 */
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

/**
 * Heuristic: does this type look like a React component? True for `FC`,
 * `ForwardRefExoticComponent`, `ComponentType`, or any callable whose return
 * type looks element-ish (`ReactNode`/`JSX.Element`). Used by `extractModule`
 * to pick which exports of a package to bind.
 * @param {ts.Type} type
 * @param {ts.TypeChecker} checker
 * @returns {boolean}
 */
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

/**
 * Build the IR for one component symbol — the core of the brain.
 *
 * Steps: resolve the symbol's type -> take the first call-signature parameter
 * (the props object) -> `getPropertiesOfType` to flatten it (Omit/intersection/
 * imports resolved) -> drop `ref`/`key`, keep own props + an allowlist of common
 * inherited HTML/ARIA props -> `classify` each prop's type into IR.
 *
 * @param {ts.TypeChecker} checker
 * @param {ts.Symbol} sym         the component export symbol
 * @param {ts.SourceFile} source  the entry file (used as a fallback location)
 * @param {string} importName     the `make = "..."` JS name to bind
 * @param {string} from           the `@module(...)` package name
 * @param {{htmlAllowlist?: string[]}} opts
 * @returns {import('../types').ComponentIR}
 */
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
            const name = p.getName()
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
            const t = checker.getTypeOfSymbolAtLocation(p, decl)
            const d = p.declarations && p.declarations[0]
            // aria-* / role -> the exact JsxDOM type (verbatim), bypassing classify.
            const aria = ARIA_TYPES[name]
            return {
                name,
                optional,
                inherited: isInherited(p),
                type: aria ? { kind: 'raw', res: aria } : classify(t, ctx, name),
                // raw TS info, used by the report to describe unmapped props
                tsType: checker.typeToString(t).replace(/\s+/g, ' ').slice(0, 200),
                declText: (d ? d.getText() : '').replace(/\s+/g, ' ').trim().slice(0, 200),
            }
        })

    return { module: importName, import: { from, name: importName }, kind: 'react-component', enums, records, unboxed, props }
}

/**
 * Extract ONE component from a per-component `.d.ts` (one that default-exports,
 * or first-capitalized-exports, the component). Use this for a single file.
 *
 * @param {string} entryFile  path to the `.d.ts`
 * @param {{from?: string, importName?: string, htmlAllowlist?: string[]}} [opts]
 *   from — `@module(...)` name (defaults to the component name);
 *   importName — override the export/JS name.
 * @returns {import('../types').ComponentIR}
 * @throws if no exported component is found
 */
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
    const from = opts.from || importName
    return buildComponentIR(checker, exp, source, importName, from, opts)
}

/**
 * Extract EVERY exported React component from a package's entry `.d.ts` (e.g.
 * its `index.d.ts`). Non-component exports (types, hooks, constants) are skipped
 * with a reason. Use this for a whole package (`--pkg`).
 *
 * @param {string} entryFile  path to the package's entry `.d.ts`
 * @param {{from?: string, htmlAllowlist?: string[]}} [opts]
 * @returns {{ components: Array<{name:string, ir:import('../types').ComponentIR}>,
 *            skipped: Array<{name:string, reason:string}> }}
 */
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

/**
 * Derive a component name from a file path: `.../Button.d.ts` -> `Button`.
 * @param {string} file
 * @returns {string}
 */
function guessName(file) {
    const base = file.split('/').pop().replace(/\.d\.ts$/, '').replace(/\.tsx?$/, '')
    return base
}

/** Max recursion depth for classify (complex library types are deeply nested). */
const MAX_DEPTH = 6

/**
 * Map one resolved TypeScript type to an IR type node — the central decision
 * tree. Checks categories most-specific first (unknown, primitives, well-known
 * names, enum, array, Record, function, union, object) and recurses into
 * containers. `ctx` accumulates the named enum/record/@unboxed declarations the
 * type references, plus depth/cycle guards.
 *
 * @param {ts.Type} type
 * @param {{checker: ts.TypeChecker, decl: ts.Node, enums:any[], records:any[], unboxed:any[], visiting?:Set<number>}} ctx
 * @param {string} [propName]  owning prop name (used to name inline enums/unions)
 * @param {number} [depth]
 * @returns {object}  an IR type node, e.g. `{kind:'string'}` or `{kind:'typeRef', to:'size'}`
 */
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

    // React `*EventHandler` alias (e.g. InputEventHandler<T>) -> a typed callback.
    // Handled here because these often expose no call signature to fall through to.
    if (name && EVENT_HANDLERS[name]) {
        return { kind: 'callback', arg: { kind: 'event', res: EVENT_HANDLERS[name] }, ret: { kind: 'unit' } }
    }

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

/**
 * Turn an enum / string-literal-union type into an `@as` variant declaration,
 * register it on `ctx.enums` (deduped), and return a reference to it.
 * @param {ts.Type} type
 * @param {object} ctx
 * @param {string} propName
 * @returns {{kind:'typeRef', to:string, _enum:true}}
 */
function enumNode(type, ctx, propName) {
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

/**
 * Make a valid lowercase ReScript TYPE name (types must start lowercase, can't
 * be reserved words or start with a digit). `Size` -> `size`, `type` -> `type_`.
 * @param {string} s
 * @returns {string}
 */
function lower(s) {
    let n = s.charAt(0).toLowerCase() + s.slice(1)
    n = n.replace(/[^a-zA-Z0-9_]/g, '_')
    if (RESCRIPT_RESERVED.has(n) || /^[0-9]/.test(n)) n = n + '_'
    return n
}

/**
 * Handle a union type `A | B`. In order: all string-literals -> `@as` variant;
 * all booleans -> `bool`; a genuine multi-runtime-type union (e.g. string|number,
 * string|string[]) -> an `@unboxed` untagged variant IF every member has a
 * distinct runtime type; otherwise flag for human `review` (structured) or fall
 * back to `opaque`/string (CSS-ish unions).
 * @param {ts.Type} type
 * @param {object} ctx
 * @param {string} propName
 * @param {number} [depth]
 * @returns {object}  an IR type node
 */
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

    // ReactElement | ReactElement[]  (a "children"-style union) -> React.element.
    // In ReScript, React.element already represents one node OR a list (via React.array),
    // so this is the correct, type-safe single mapping.
    const isReactish = (t) => {
        const n = typeName(t)
        if (n && /ReactElement|ReactNode/.test(n)) return true
        const elem = asArray(t, checker)
        const en = elem && typeName(elem)
        return !!(en && /ReactElement|ReactNode/.test(en))
    }
    if (parts.every(isReactish)) return { kind: 'reactElement' }

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
        // Name the untagged variant by its STRUCTURE, not the prop, so identical
        // unions (e.g. defaultValue/value/onValueChange all `string | string[]`)
        // collapse into ONE shared type instead of one per prop.
        const name = unboxedName(members)
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

/**
 * If `t` is an `Array<X>` / `ReadonlyArray<X>`, return its element type `X`,
 * else null.
 * @param {ts.Type} t
 * @param {ts.TypeChecker} checker
 * @returns {ts.Type | null}
 */
function asArray(t, checker) {
    if (checker.isArrayType && checker.isArrayType(t)) return checker.getTypeArguments(t)[0]
    const n = typeName(t)
    if ((n === 'ReadonlyArray' || n === 'Array') && checker.getTypeArguments) {
        const a = checker.getTypeArguments(t)
        if (a && a[0]) return a[0]
    }
    return null
}

/**
 * Map one union member to an `@unboxed` variant constructor, or null if it can't
 * be one (objects/functions). `rt` is the runtime kind (`string`/`number`/
 * `boolean`/`array`) used to check discriminability — two members may NOT share
 * an `rt`, because untagged variants discriminate via JS `typeof`/`Array.isArray`.
 * @param {ts.Type} t
 * @param {object} ctx
 * @param {string} propName
 * @param {number} depth
 * @returns {{ctor:string, rt:string, type:object} | null}
 */
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

/**
 * Derive a STRUCTURAL name for an untagged variant from its members, so two
 * unions with the same shape get the same name (and are deduped into one type).
 * e.g. `string | string[]` -> `stringOrStringArray`, `string | number` -> `stringOrNumber`.
 * @param {Array<{ctor:string, type:object}>} members
 * @returns {string}
 */
function unboxedName(members) {
    const tok = (t) => {
        switch (t.kind) {
            case 'string': return 'String'
            case 'number': return 'Number'
            case 'boolean': return 'Bool'
            case 'array': return tok(t.of) + 'Array'
            case 'reactElement': return 'Element'
            case 'typeRef': return pascal(t.to)
            default: return 'Value'
        }
    }
    return lower(members.map((m) => tok(m.type)).join('Or'))
}

/**
 * Map a function/callback type to an IR callback node. A single React-event
 * parameter becomes `ReactEvent.X.t => unit`; otherwise the first arg is
 * classified normally. Return type is always treated as `unit`.
 * @param {ts.Signature} sig  the call signature
 * @param {object} ctx
 * @param {string} propName
 * @param {number} [depth]
 * @returns {{kind:'callback', arg:object, ret:object}}
 */
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

/**
 * Turn an inline object type `{ a, b }` (a nested object prop) into a ReScript
 * record declaration, register it on `ctx.records` (deduped), and return a
 * reference. Each field is classified recursively. Cycle-guarded via `ctx.visiting`.
 * @param {ts.Type} type
 * @param {object} ctx
 * @param {string} propName  used to name the record (e.g. `footer` -> `footerConfig`)
 * @param {number} [depth]
 * @returns {{kind:'typeRef', to:string}}
 */
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
