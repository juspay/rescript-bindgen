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
import { DOM_ELEMENT_BY_LOWER, DOM_PROPS_FIELDS } from './stdlib-types.mjs'
import { TS_NAME_TO_GROUP, chainFields } from './html-attrs.mjs'
import { label } from './emit.mjs'

/** Map a TS DOM element name to the exact built-in Dom type, e.g.
 *  `HTMLDivElement` -> `Dom.htmlDivElement`; falls back to `Dom.element`. */
function domElementType(name) {
    const specific = DOM_ELEMENT_BY_LOWER.get(String(name).toLowerCase())
    return specific ? `Dom.${specific}` : 'Dom.element'
}

/** Is this type declared in a known library (not first-party)? Used to avoid
 *  generating records for React/DOM/csstype/styled-components library objects. */
function isLibraryType(type) {
    const sym = type.aliasSymbol || (type.getSymbol && type.getSymbol()) || type.symbol
    const decl = sym && sym.getDeclarations && sym.getDeclarations()[0]
    const file = (decl && decl.getSourceFile().fileName) || ''
    return /node_modules\/(@types|typescript|csstype|styled-components|@floating-ui)\//.test(file) ||
        /\/lib\.(dom|es|scripthost)/.test(file)
}

// TS utility-type aliases that WRAP another type: the alias itself lives in lib.es5,
// but the CONTENT is the inner type arg. We "see through" them so `Partial<MenuProps>`
// (and nested `Partial<Omit<…>>`) still resolves to its first-party object instead of
// being rejected as a "library" type. `Record` is handled earlier (as a dict) and
// `Exclude`/`Extract` resolve to unions, so neither belongs here.
const UTILITY_ALIASES = new Set(['Partial', 'Required', 'Readonly', 'Pick', 'Omit', 'NonNullable'])

/** Recursively descend `Partial<Omit<X, …>>` → `X` by following the first alias type
 *  argument while the alias is a known utility wrapper. Returns the innermost type
 *  (or the input unchanged if it isn't a utility wrap). */
function unwrapUtility(type) {
    let t = type
    for (let i = 0; i < 8; i++) {
        const a = t.aliasSymbol && t.aliasSymbol.getName()
        if (!a || !UTILITY_ALIASES.has(a)) break
        const inner = t.aliasTypeArguments && t.aliasTypeArguments[0]
        if (!inner) break
        t = inner
    }
    return t
}

// ── Shared-type registry (module mode) ──────────────────────────────────────
// When generating a whole package, every named/anonymous type is registered ONCE
// in a module-level `shared` registry (keyed by `type.id`), assigned a HOME module
// derived from its source `.d.ts`, and referenced from there — so `tooltipSide`
// isn't redeclared in 8 files. emit.mjs groups these by home, merges cyclic groups
// (SCC), and emits one `*Types.res` per module. Single-file mode doesn't use this.

/** The declaring `.d.ts` file of a type (via its alias/symbol), or null. */
function declFileOf(type) {
    const sym = (type.aliasSymbol) || (type.getSymbol && type.getSymbol()) || type.symbol
    const decl = sym && sym.getDeclarations && sym.getDeclarations()[0]
    return decl ? decl.getSourceFile().fileName : null
}

/** Derive a ReScript type-module name from a source path:
 *  `.../components/Tooltip/types.d.ts` -> `TooltipTypes`; non-component or
 *  unknown sources fall back to the parent dir, else `CommonTypes`. */
function homeModuleOf(file) {
    if (!file) return 'CommonTypes'
    const cm = file.match(/\/components\/([^/]+)\//)
    let base
    if (cm) base = cm[1]
    else {
        const parts = file.replace(/\.d\.ts$/, '').split('/')
        base = parts[parts.length - 2] || parts[parts.length - 1] || 'Common'
    }
    base = base.replace(/[^a-zA-Z0-9]+/g, ' ').trim().split(/\s+/)
        .map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join('')
    if (!/^[A-Z]/.test(base)) base = 'M' + base
    return base + 'Types'
}

/** Home module for a generated type — by its (unwrapped) declaration file,
 *  falling back to the current component's source file for anonymous types. */
function homeOf(type, ctx) {
    return homeModuleOf(declFileOf(unwrapUtility(type)) || ctx.sourceFile)
}

/** A generic type argument that's really a "fill-in-anything" placeholder — the export
 *  erased a `<T>` by instantiating it to `unknown` / `any` / `{}` / `Record<string, unknown>`.
 *  Such args are recovered as ReScript type variables, not bound concretely.
 *  A real shape (named props) or a typed record (`Record<string, string>`) returns false. */
function isPlaceholderArg(t, checker) {
    if (t.flags & (ts.TypeFlags.Unknown | ts.TypeFlags.Any)) return true
    if (t.flags & ts.TypeFlags.Object) {
        if (t.getProperties().length) return false // a concrete shape, not a placeholder
        const idx = checker.getIndexInfoOfType(t, ts.IndexKind.String)
        if (!idx) return true // bare `{}`
        return !!(idx.type.flags & (ts.TypeFlags.Unknown | ts.TypeFlags.Any)) // Record<string, unknown>
    }
    return false
}

/** A globally-unique ReScript type name (suffix on collision) so two domains that
 *  merge into one module via SCC never clash. */
function uniqueName(base, shared) {
    let n = base, i = 2
    while (shared.names.has(n)) n = base + i++
    shared.names.add(n)
    return n
}

/** Build an IR typeRef from a registry entry, carrying its key + home so emit can
 *  qualify it by the entry's final (post-SCC) module. */
function refTo(entry) {
    const r = { kind: 'typeRef', to: entry.name, key: entry.key, home: entry.home }
    if (entry.tparams && entry.tparams.length) r.tparams = entry.tparams // generic record -> name<'a>
    if (entry.kind === 'enum') r._enum = true
    if (entry.kind === 'unboxed') r._unboxed = true
    return r
}

/** Collect the registry keys an IR type tree references (for the module graph). */
function collectRefKeys(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'typeRef' && t.key) out.add(t.key)
    if (t.of) collectRefKeys(t.of, out)
    if (t.ret) collectRefKeys(t.ret, out)
    if (t.arg) collectRefKeys(t.arg, out)
    if (t.mapKey) collectRefKeys(t.mapKey, out)
    if (t.mapVal) collectRefKeys(t.mapVal, out)
    if (Array.isArray(t.params)) t.params.forEach((p) => collectRefKeys(p, out))
}

/** Collect the ReScript type-variable names ('a, 'b) an IR type tree uses, so a record
 *  containing them can be emitted parameterized (`type foo<'a> = {…}`). */
function collectTypeVars(t, out) {
    if (!t || typeof t !== 'object') return
    if (t.kind === 'typeVar' && t.name) out.add(t.name)
    if (t.kind === 'typeRef' && Array.isArray(t.tparams)) t.tparams.forEach((x) => out.add(x))
    if (t.of) collectTypeVars(t.of, out)
    if (t.ret) collectTypeVars(t.ret, out)
    if (t.arg) collectTypeVars(t.arg, out)
    if (t.mapKey) collectTypeVars(t.mapKey, out)
    if (t.mapVal) collectTypeVars(t.mapVal, out)
    if (Array.isArray(t.params)) t.params.forEach((p) => collectTypeVars(p, out))
    if (Array.isArray(t.fields)) t.fields.forEach((f) => collectTypeVars(f.type, out))
}

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
 * Does this type come from the `csstype` package? Those are CSS property values
 * (e.g. `Width<number | (string & {})>`, `JustifyContent`) which are correctly
 * `string` in ReScript — a precise mapping, not a loose fallback. Detected by the
 * declaration's source file path.
 * @param {ts.Type} type
 * @returns {boolean}
 */
function isCssType(type) {
    const sym = type.aliasSymbol || (type.getSymbol && type.getSymbol()) || type.symbol
    // getDeclarations() can return undefined (not []) for synthesized/transient symbols.
    const decls = sym && sym.getDeclarations && sym.getDeclarations()
    const decl = decls && decls[0]
    const file = decl && decl.getSourceFile().fileName
    return !!(file && /[\\/]csstype[\\/]/.test(file))
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
// `AllHTMLAttributes` is the everything-bag and `SVGAttributes` is out of scope —
// a component touching either keeps the legacy labeled-args output entirely.
const BLOCKED_ATTRS = new Set(['AllHTMLAttributes', 'SVGAttributes'])

/**
 * Detect a component-props HTML-attributes base (issue #16): an intersection part or
 * heritage `extends` whose interface NAME is one of the vendored attribute groups
 * (`ButtonHTMLAttributes`, …), optionally wrapped in `Omit` (keys recorded) or
 * `Partial` (a no-op — every attribute field is optional anyway). Name-based, so
 * self-contained golden stubs work exactly like the real @types/react.
 * @returns {{leaf: string, omitKeys: string[]} | null}  null -> legacy labeled args
 */
function detectAttrsBase(propsType, checker) {
    const parts = (propsType.flags & ts.TypeFlags.Intersection) ? propsType.types : [propsType]
    const leaves = []
    const omitKeys = []
    for (const part of parts) {
        const aliasName = part.aliasSymbol && part.aliasSymbol.getName()
        let core = part
        if (aliasName === 'Omit' || aliasName === 'Partial') {
            const args = part.aliasTypeArguments || []
            core = args[0] || part
            if (aliasName === 'Omit') {
                const keys = args[1]
                for (const k of keys ? (keys.isUnion() ? keys.types : [keys]) : []) {
                    if (k.isStringLiteral()) omitKeys.push(k.value)
                    else return null // computed/non-literal Omit keys -> legacy
                }
            }
        }
        const coreSym = core.aliasSymbol || core.getSymbol?.()
        const coreName = coreSym && coreSym.getName()
        if (coreName && BLOCKED_ATTRS.has(coreName)) return null
        if (coreName && TS_NAME_TO_GROUP.has(coreName)) { leaves.push(TS_NAME_TO_GROUP.get(coreName)); continue }
        // own interface that `extends ButtonHTMLAttributes<…>` (heritage instead of `&`)
        const ifaceDecl = coreSym && (coreSym.declarations || []).find((d) => ts.isInterfaceDeclaration(d))
        if (ifaceDecl) for (const h of ifaceDecl.heritageClauses || []) for (const t of h.types) {
            const base = t.expression.getText()
            if (BLOCKED_ATTRS.has(base)) return null
            if (TS_NAME_TO_GROUP.has(base)) leaves.push(TS_NAME_TO_GROUP.get(base))
        }
    }
    if (!leaves.length) return null
    // Deepest chain wins (field-count is the depth proxy); a second base must be fully
    // contained in the winner's chain (Button extends HTML — fine), else -> legacy.
    leaves.sort((a, b) => chainFields(b).size - chainFields(a).size)
    const leaf = leaves[0]
    for (const other of leaves.slice(1)) {
        for (const f of chainFields(other)) if (!chainFields(leaf).has(f)) return null
    }
    return { leaf, omitKeys }
}

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

    // Generic component (e.g. `VirtualList<T extends VirtualListItem>`): map each of the
    // signature's type parameters to a ReScript type variable ('a, 'b, …). classify turns
    // a `T` prop into `{kind:'typeVar'}`, so `items: T[]` becomes `array<'a>` and the
    // `external make` is polymorphic (the `extends` constraint is dropped, as in juspay's
    // hand-written DataTable binding).
    const typeVars = new Map()
    const TV = ['a', 'b', 'c', 'd', 'e', 'f']
    const tparams = (sigs.length && sigs[0].typeParameters) || []
    tparams.forEach((tp, i) => { if (tp.symbol) typeVars.set(tp.symbol, "'" + (TV[i] || `t${i}`)) })

    // Erased generic: a `forwardRef`/`memo` export pins a generic props alias to a
    // placeholder type argument (e.g. `DataTableProps<Record<string, unknown>>`), so the
    // call signature above is monomorphic and every `T` would surface as the placeholder.
    // Recover the generic: find the aliased props member, map each placeholder type-param
    // back to a ReScript type variable, and re-bind against the *generic declared* props so
    // `T` reappears as a TypeParameter — classify then yields `'a` and records parameterize
    // themselves (the same machinery the VirtualList<T> path uses).
    if (typeVars.size === 0) {
        const inter = (propsType.flags & ts.TypeFlags.Intersection) ? propsType.types : [propsType]
        for (const m of inter) {
            const aliasSym = m.aliasSymbol
            const args = m.aliasTypeArguments || []
            const tpNodes = (aliasSym && aliasSym.declarations && aliasSym.declarations[0] && aliasSym.declarations[0].typeParameters) || []
            if (!aliasSym || !args.length || !tpNodes.length) continue
            let n = 0, hit = false
            args.forEach((arg, i) => {
                if (isPlaceholderArg(arg, checker) && tpNodes[i] && tpNodes[i].symbol) {
                    typeVars.set(tpNodes[i].symbol, "'" + (TV[n++] || `t${i}`))
                    hit = true
                }
            })
            if (hit) { propsType = checker.getDeclaredTypeOfSymbol(aliasSym); break }
        }
    }

    const enums = []
    const records = []
    const unboxed = []
    // `shared` (module mode) routes all generated types into ONE module-level registry
    // deduped by type.id; absent (single-file mode) -> the local enums/records/unboxed
    // arrays are used and the file stays self-contained. `sourceFile` is the home
    // fallback for anonymous types with no declaration symbol.
    const ctx = {
        checker, decl, enums, records, unboxed, webapi: !!opts.webapi,
        seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map(),
        shared: opts.shared || null,
        typeVars,
        sourceFile: (decl && decl.getSourceFile && decl.getSourceFile().fileName) || (source && source.fileName) || null,
    }
    const allow = new Set(opts.htmlAllowlist || DEFAULT_HTML_ALLOWLIST)

    const isInherited = (p) => {
        const d = p.declarations && p.declarations[0]
        const f = (d && d.getSourceFile().fileName) || ''
        return /node_modules\/(@types|typescript)\//.test(f) || /\/lib\.(dom|es|scripthost)/.test(f)
    }

    // Components extending HTML attributes (issue #16): emit the attribute surface as
    // ONE shared spread (`...HtmlAttrs.<leaf>`) instead of inlining 70+ labeled args.
    // Module mode only (HtmlAttrs.res is a second output file) and never for generic
    // components (no `type props<'a>` spread interactions). `--no-html-attrs` opts out.
    const attrsBase = (opts.htmlAttrs !== false && opts.shared && typeVars.size === 0)
        ? detectAttrsBase(propsType, checker)
        : null

    // A flattened prop is "covered by the spread" when every declaration of it lives in
    // a vendored attribute interface inside the leaf's chain. Anything redeclared in the
    // component's OWN types keeps its own (more specific) mapping and joins `removed`.
    const coveredBySpread = (p) => {
        if (!attrsBase) return false
        const decls = p.declarations || []
        return decls.length > 0 && decls.every((d) => {
            const parent = d.parent
            return parent && ts.isInterfaceDeclaration(parent) && TS_NAME_TO_GROUP.has(parent.name.text)
        }) && chainFields(attrsBase.leaf).has(p.getName())
    }

    const props = checker
        .getPropertiesOfType(propsType)
        .filter((p) => !['ref', 'key'].includes(p.getName()))
        .filter((p) => !coveredBySpread(p))
        .filter((p) => !isInherited(p) || allow.has(p.getName()))
        .map((p) => {
            const name = p.getName()
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
            const t = checker.getTypeOfSymbolAtLocation(p, decl)
            const d = p.declarations && p.declarations[0]
            // aria-* / role -> the exact JsxDOM type (verbatim), bypassing classify.
            // hasOwnProperty guard: a prop literally named `toString`/`valueOf`/`constructor`/…
            // would otherwise pick up an inherited Object.prototype member (a native function).
            const aria = Object.prototype.hasOwnProperty.call(ARIA_TYPES, name) ? ARIA_TYPES[name] : undefined
            // `LiteralUnion | string` (e.g. `ToastPosition | string`) collapses to bare `string` in
            // the resolved type, so recover the known literals from the SYNTACTIC node -> an @unboxed
            // variant with a `Custom(string)` catch-all (typo-safe known values + open escape hatch).
            const litOpen = !aria && d && literalUnionOpen(d.type, checker)
            return {
                name,
                optional,
                inherited: isInherited(p),
                type: aria ? { kind: 'raw', res: aria }
                    : litOpen ? literalUnionOpenNode(litOpen, unionRefName(d.type), ctx, name)
                    : classify(t, ctx, name),
                // raw TS info, used by the report to describe unmapped props
                tsType: checker.typeToString(t).replace(/\s+/g, ' ').slice(0, 200),
                declText: (d ? d.getText() : '').replace(/\s+/g, ' ').trim().slice(0, 200),
            }
        })

    // `removed` = Omit keys + own props that collide with a chain field at the ReScript
    // id level (raw `children` = chain `children`, but also own `ariaLabel` vs chain
    // `aria-label` — both render to the id `ariaLabel`). The own prop always wins; the
    // base is narrowed so the spread can never produce a duplicate-field compile error.
    let attrsBaseInfo = null
    if (attrsBase) {
        const chain = chainFields(attrsBase.leaf)
        const idToRaw = new Map()
        for (const n of chain) idToRaw.set(label(n).id, n)
        const removed = new Set(attrsBase.omitKeys.filter((k) => chain.has(k)))
        for (const p of props) {
            const hit = idToRaw.get(label(p.name).id)
            if (hit) removed.add(hit)
        }
        attrsBaseInfo = { leaf: attrsBase.leaf, removed: [...removed].sort() }
    }

    return { module: importName, import: { from, name: importName }, kind: 'react-component', enums, records, unboxed, props, attrsBase: attrsBaseInfo }
}

/**
 * Build the IR for a standalone exported FUNCTION (or a const whose type has a call
 * signature) — e.g. `export function add(a: number, b: number): number` or
 * `export const handler: (c: Context) => Response`. This is the non-React analogue of
 * buildComponentIR: same `ctx`/type-variable setup, but it classifies the call
 * signature itself (params + return) via `functionNode` instead of a props object.
 * Nested enums/records/@unboxed register into the SAME shared registry the component
 * path uses, so generic-TS types land in the same `*Types.res` modules.
 *
 * @param {ts.TypeChecker} checker
 * @param {ts.Symbol} sym       the exported symbol (caller alias-resolves first)
 * @param {ts.SourceFile} source
 * @param {string} importName   the JS export name (also the ReScript binding name)
 * @param {string} from         the `@module(...)` name
 * @param {object} opts         { shared?, webapi?, … } — same shape buildComponentIR takes
 * @returns {import('../types').FunctionIR}
 */
function buildFunctionIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const fnType = checker.getTypeOfSymbolAtLocation(sym, decl)
    const sig = fnType.getCallSignatures()[0]
    if (!sig) throw new Error('no call signature')

    // Generic function (`function map<T, U>(…)`): map each signature type parameter to a
    // ReScript type variable ('a, 'b, …), exactly as buildComponentIR does — so a `T` param
    // surfaces as `'a` and the external is polymorphic (the `extends` constraint is dropped).
    const typeVars = new Map()
    const TV = ['a', 'b', 'c', 'd', 'e', 'f']
    const tparams = sig.typeParameters || []
    tparams.forEach((tp, i) => { if (tp.symbol) typeVars.set(tp.symbol, "'" + (TV[i] || `t${i}`)) })

    const enums = []
    const records = []
    const unboxed = []
    const ctx = {
        checker, decl, enums, records, unboxed, webapi: !!opts.webapi,
        seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map(),
        shared: opts.shared || null,
        typeVars,
        sourceFile: (decl && decl.getSourceFile && decl.getSourceFile().fileName) || (source && source.fileName) || null,
    }

    // sigToMembers keeps each param's NAME + optionality (so the emitter can bind optional
    // args as labeled `~name=?` — a positional external can't express a trailing optional).
    const { params, ret: rawRet } = sigToMembers(sig, ctx, 0)
    // A type parameter used ONLY in the return doesn't round-trip, so `'a` there is unsound
    // (rule #4) — demote it to its constraint (`nanoid<T extends string>(): T` -> string).
    const ret = demoteReturnOnly(rawRet, params.map((p) => p.type), sig, ctx, typeVars)

    return {
        module: importName,
        import: { from, name: importName },
        kind: 'function',
        enums, records, unboxed,
        sig: { params, ret },
    }
}

/**
 * Classify a call signature's RETURN type, mirroring functionNode's return handling
 * (`void`/`undefined` -> `unit`; `void | Promise<void>` -> polymorphic `'a`). Factored
 * out so class methods/constructors reuse the exact same return logic as functions.
 * @param {ts.Signature} sig
 * @param {object} ctx
 * @param {number} [depth]
 * @returns {object} an IR type node
 */
function returnNode(sig, ctx, depth = 0) {
    const retType = sig.getReturnType()
    if (retType.isUnion && retType.isUnion()) {
        const hasVoid = retType.types.some((t) => t.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined))
        const hasPromise = retType.types.some((t) => typeName(t) === 'Promise')
        if (hasVoid && hasPromise) return { kind: 'typeVar', name: "'a" }
    }
    const retVoid = !!(retType.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined))
    return retVoid ? { kind: 'unit' } : classify(retType, ctx, '', depth + 1)
}

/**
 * Whether a function/constructor PARAMETER is optional. Parameter symbols don't carry
 * `SymbolFlags.Optional` reliably (that flag is for object properties), so read it off the
 * declaration: a `?` token, a default initializer, or a rest param all make the arg omittable.
 * @param {ts.Symbol} paramSym
 * @returns {boolean}
 */
function isOptionalParam(paramSym) {
    if (paramSym.getFlags() & ts.SymbolFlags.Optional) return true
    const d = paramSym.valueDeclaration || (paramSym.declarations && paramSym.declarations[0])
    return !!(d && ts.isParameter(d) && (d.questionToken || d.initializer || d.dotDotDotToken))
}

/**
 * Classify a call signature into LABELED-ARG members: each param keeps its name +
 * optionality (class methods/constructors bind as labeled args, unlike M1's positional
 * functions, because methods lean on optional params and ReScript only allows optionals
 * when labeled). React-event params are recognised the same way functionNode does.
 * @returns {{params: Array<{name:string, optional:boolean, type:object}>, ret:object}}
 */
function sigToMembers(sig, ctx, depth = 0) {
    const { checker } = ctx
    const params = sig.getParameters().map((pp) => {
        const pt = checker.getTypeOfSymbolAtLocation(pp, ctx.decl)
        const optional = isOptionalParam(pp)
        const n = typeName(pt)
        const type = (n && Object.prototype.hasOwnProperty.call(REACT_EVENTS, n))
            ? { kind: 'event', res: REACT_EVENTS[n] }
            : classify(pt, ctx, pp.getName(), depth + 1)
        return { name: pp.getName(), optional, type }
    })
    return { params, ret: returnNode(sig, ctx, depth) }
}

/** Deep-replace `typeVar` nodes named in `subst` with their substitute IR. */
function substTypeVars(node, subst) {
    if (!node || typeof node !== 'object') return node
    if (node.kind === 'typeVar' && subst[node.name]) return subst[node.name]
    const out = { ...node }
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal']) if (out[k]) out[k] = substTypeVars(out[k], subst)
    if (Array.isArray(out.params)) out.params = out.params.map((p) => substTypeVars(p, subst))
    return out
}

/**
 * Demote RETURN-ONLY type variables to their constraint. A type parameter that appears only
 * in the return (never in a parameter) does NOT round-trip, so emitting it as `'a` is unsound
 * (contract rule #4): `nanoid<T extends string>(): T` as `=> 'a` lets a caller pick any `T`
 * while the runtime value is a string. Replace each such var with its constraint type
 * (`extends string` -> `string`), or `unknown` (-> flagged) when there's no constraint.
 * @returns {object} the return IR, with return-only vars substituted
 */
function demoteReturnOnly(retNode, paramNodes, sig, ctx, typeVars) {
    const used = new Set()
    for (const p of paramNodes) collectTypeVars(p, used)
    const retVars = new Set()
    collectTypeVars(retNode, retVars)
    const subst = {}
    for (const tp of (sig.typeParameters || [])) {
        const name = tp.symbol && typeVars.get(tp.symbol)
        if (!name || !retVars.has(name) || used.has(name)) continue
        const c = tp.getConstraint && tp.getConstraint()
        subst[name] = c ? classify(c, ctx, '', 0) : { kind: 'unknown' }
    }
    return Object.keys(subst).length ? substTypeVars(retNode, subst) : retNode
}

/**
 * Build the IR for an exported CLASS (M2) — bound as a ReScript module with an abstract
 * `type t` (the canonical cookbook pattern): the constructor -> `@new`, instance methods
 * -> `@send` (instance as first arg), data properties / getters -> `@get`. Param and
 * return types reuse `classify`, so records/enums/unions land in the shared `*Types.res`,
 * and a reference to ANOTHER exported class resolves to `OtherClass.t` (via ctx.classTypes).
 * First-slice scope: non-generic classes; statics and generic type params are not bound yet.
 *
 * @param {ts.TypeChecker} checker
 * @param {ts.Symbol} sym       the exported class symbol (caller alias-resolves first)
 * @param {ts.SourceFile} source
 * @param {string} importName   the JS class name (also the ReScript module / `= "…"` name)
 * @param {string} from         the `@module(...)` name
 * @param {object} opts         { shared?, webapi?, classTypes? }
 * @returns {import('../types').ClassIR}
 */
function buildClassIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const instanceType = checker.getDeclaredTypeOfSymbol(sym)        // instance side (members)
    const staticType = checker.getTypeOfSymbolAtLocation(sym, decl)  // constructor / static side

    const enums = []
    const records = []
    const unboxed = []
    const ctx = {
        checker, decl, enums, records, unboxed, webapi: !!opts.webapi,
        seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map(),
        shared: opts.shared || null,
        typeVars: new Map(),
        classTypes: opts.classTypes || null,
        classSink: opts.classSink || null,
        currentClass: importName, // a self-reference renders as bare `t`, not the sink
        sourceFile: (decl && decl.getSourceFile && decl.getSourceFile().fileName) || (source && source.fileName) || null,
    }

    // Constructor: first construct signature (overloads collapse to the first).
    const ctors = staticType.getConstructSignatures()
    const ctor = ctors.length ? { params: sigToMembers(ctors[0], ctx, 0).params } : null

    // Instance members. A property whose type has a call signature is a method (-> @send);
    // anything else is a data property / getter (-> @get). Inherited lib/@types members and
    // private/protected/#private members are dropped.
    const isInherited = (p) => {
        const d = p.declarations && p.declarations[0]
        const f = (d && d.getSourceFile().fileName) || ''
        return /node_modules\/(@types|typescript)\//.test(f) || /\/lib\.(dom|es|scripthost)/.test(f)
    }
    const isHidden = (p) => {
        if (/^[#_]/.test(p.getName())) return true
        const d = p.declarations && p.declarations[0]
        return !!(d && (ts.getCombinedModifierFlags(d) & (ts.ModifierFlags.Private | ts.ModifierFlags.Protected)))
    }
    const methods = []
    const getters = []
    for (const p of instanceType.getProperties()) {
        const pname = p.getName()
        if (pname === 'constructor' || pname === 'prototype') continue
        if (isInherited(p) || isHidden(p)) continue
        const pt = checker.getTypeOfSymbolAtLocation(p, decl)
        if (pt.getCallSignatures().length) {
            const { params, ret } = sigToMembers(pt.getCallSignatures()[0], ctx, 0)
            methods.push({ jsName: pname, params, ret })
        } else {
            getters.push({ jsName: pname, type: classify(pt, ctx, pname, 0) })
        }
    }

    return {
        module: importName,
        import: { from, name: importName },
        kind: 'class',
        enums, records, unboxed,
        // The class's own abstract type in the sink — emit aliases `type t = InstanceTypes.<sinkName>`.
        sinkName: (opts.classSink && opts.classSink.get(importName)) || lower(importName),
        ctor, methods, getters,
    }
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
 * its `index.d.ts`), plus standalone function/const-with-call-signature exports
 * (generic-TS support). Remaining exports (classes, bare types, hooks) are skipped
 * with a reason. Use this for a whole package (`--pkg`).
 *
 * @param {string} entryFile  path to the package's entry `.d.ts`
 * @param {{from?: string, htmlAllowlist?: string[]}} [opts]
 * @returns {{ components: Array<{name:string, ir:import('../types').ComponentIR}>,
 *            functions: Array<{name:string, ir:import('../types').FunctionIR}>,
 *            classes: Array<{name:string, ir:import('../types').ClassIR}>,
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

    // Module-level registry: every generated type lives here ONCE, keyed by type.id
    // (structural name for synthesized @unboxed), with a home module + reference edges.
    // emit.mjs groups these by home, SCC-merges cycles, and writes one `*Types.res` each.
    const shared = { byKey: new Map(), entries: [], names: new Set(), bySig: new Map() }

    // Pre-pass: map every exported CLASS's instance-type symbol -> its ReScript module
    // name, so a method/param/return typed as another exported class resolves to `Name.t`
    // (not a misclassified record). Built up front so cross-class refs work in any order.
    const classTypes = new Map()
    for (const exp of exports) {
        let s = exp
        if (s.flags & ts.SymbolFlags.Alias) s = checker.getAliasedSymbol(s)
        if (!(s.flags & ts.SymbolFlags.Class)) continue
        let nm = exp.getName()
        if (nm === 'default' || nm === 'export=') nm = s.getName()
        if (!nm || !/^[A-Z]/.test(nm)) continue
        classTypes.set(s, nm)
        const instSym = checker.getDeclaredTypeOfSymbol(s)?.symbol
        if (instSym) classTypes.set(instSym, nm)
    }

    // For each class, register an abstract instance type in a dependency-FREE sink module
    // (`InstanceTypes`). Everything (shared records, other class files) references the sink
    // instead of the class file, so a `*Types.res` that mentions a class can't form a cycle
    // back through the class file — and a reference to a class we never fully emit (e.g. a
    // generic one) still resolves to its abstract `type`, never a dangling `X.t`.
    const classSink = new Map() // className -> sink type name (within `InstanceTypes`)
    for (const cn of new Set(classTypes.values())) {
        const key = 'class:' + cn
        let entry = shared.byKey.get(key)
        if (!entry) {
            entry = { key, kind: 'nominal', name: uniqueName(lower(cn), shared), home: INSTANCE_MODULE, deps: new Set() }
            shared.byKey.set(key, entry)
            shared.entries.push(entry)
        }
        classSink.set(cn, entry.name)
    }

    const components = []
    const functions = []
    const classes = []
    const skipped = []
    const seen = new Set()
    for (const exp of exports) {
        let sym = exp
        if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
        // Resolve a usable binding name + the actual JS export name. For a default export the
        // JS name is `"default"` (NOT the resolved identifier) — binding `= "mitt"`/`= "index"`
        // would call `require("pkg").mitt`, which doesn't exist. The ReScript id prefers the
        // declaration's own name (e.g. `mitt`), even lowercase, falling back to the file name.
        const exportName = exp.getName()
        const isDefault = exportName === 'default' || exportName === 'export='
        let name = exportName
        if (isDefault) {
            // The aliased symbol of a default export is named `default`; the declaration keeps
            // the real identifier (`function mitt` -> `mitt`), so prefer that for a tidy id.
            const d0 = sym.valueDeclaration || (sym.declarations && sym.declarations[0])
            const declName = d0 && d0.name && d0.name.getText && d0.name.getText()
            const real = sym.getName()
            name = (declName && declName !== 'default') ? declName
                : (real && real !== 'default' && real !== 'export=') ? real
                : guessName(entryFile)
        }
        const jsName = isDefault ? 'default' : exportName
        if (seen.has(name)) continue
        const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0])
        if (!decl) { skipped.push({ name, reason: 'no-declaration' }); continue }
        let type
        try { type = checker.getTypeOfSymbolAtLocation(sym, decl) } catch { skipped.push({ name, reason: 'type-error' }); continue }
        if (!isReactComponent(type, checker)) {
            // Not a React component. Bind a CLASS (M2) as a `@new`/`@send`/`@get` module, or
            // a standalone FUNCTION / const-with-call-signature (M1) as a `@module external`.
            // Bare type aliases (M3) are still bucketed `not-a-component` for now.
            if (sym.flags & ts.SymbolFlags.Class) {
                try {
                    const ir = buildClassIR(checker, sym, source, name, from, { ...opts, shared, classTypes, classSink })
                    ir.import.jsName = jsName
                    ir.import.isDefault = isDefault
                    seen.add(name)
                    classes.push({ name, ir })
                } catch (e) {
                    skipped.push({ name, reason: 'class-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
                }
            } else if (sym.valueDeclaration && type.getCallSignatures().length) {
                try {
                    const ir = buildFunctionIR(checker, sym, source, name, from, { ...opts, shared })
                    ir.import.jsName = jsName
                    ir.import.isDefault = isDefault
                    seen.add(name)
                    functions.push({ name, ir })
                } catch (e) {
                    skipped.push({ name, reason: 'fn-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
                }
            } else {
                skipped.push({ name, reason: 'not-a-component' })
            }
            continue
        }
        try {
            const ir = buildComponentIR(checker, sym, source, name, from, { ...opts, shared })
            ir.import.jsName = jsName
            ir.import.isDefault = isDefault
            seen.add(name)
            // A component with zero OWN props is still real when its whole surface is
            // the HTML-attributes spread (e.g. day-picker's `NextMonthButton(props:
            // ButtonHTMLAttributes<…>)`) — `type props = {...HtmlAttrs.x}` alone.
            if (ir.props.length || ir.attrsBase) components.push({ name, ir })
            else skipped.push({ name, reason: 'no-props' })
        } catch (e) {
            skipped.push({ name, reason: 'extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
        }
    }
    return { components, functions, classes, skipped, shared }
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

/** The dependency-free sink module that holds every class's abstract instance `type`.
 *  Class files and shared records reference these instead of each other, so a type module
 *  that mentions a class can never cycle back through the class file. */
const INSTANCE_MODULE = 'InstanceTypes'

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
        if (ctx.visiting.has(type.id)) {
            // A back-reference into a record we're still building (e.g. MenuItemType's
            // `subMenu?: MenuItemType[]`): resolve to that record's typeRef instead of a
            // lossy `opaque`/string. The name was registered early in recordNode.
            if (ctx.shared) {
                const e = ctx.shared.byKey.get('id:' + type.id)
                if (e) return refTo(e)
            }
            const nm = typeName(type)
            const k = nm && lower(nm)
            if (k && ctx.seenRecords.has(k)) return { kind: 'typeRef', to: k }
            return { kind: 'opaque', text: checker.typeToString(type) }
        }
    }

    // `unknown` -> `JSON.t`: an opaque value the consumer builds/decodes. This is the
    // honest mapping for a genuinely-unknown value (a callback-supplied id, an opaque
    // filter) — unlike a type variable, which would be unsound in callback position.
    // `any` stays a flagged defect (it means "untyped", not "opaque value").
    if (flags & ts.TypeFlags.Unknown) return { kind: 'raw', res: 'JSON.t' }
    if (flags & ts.TypeFlags.Any) return { kind: 'any' }

    // A generic type parameter `T` -> the ReScript type variable it was mapped to ('a).
    // An unmapped param (e.g. from a nested generic not on the component signature) is
    // flagged rather than silently widened.
    if (flags & ts.TypeFlags.TypeParameter) {
        const tv = ctx.typeVars && ctx.typeVars.get(type.symbol)
        return tv ? { kind: 'typeVar', name: tv } : { kind: 'unknown' }
    }

    // primitives
    if (flags & ts.TypeFlags.String) return { kind: 'string' }
    if (flags & ts.TypeFlags.Number) return { kind: 'number' }
    if (flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return { kind: 'boolean' }

    // CSS property values (csstype) are correctly `string`, not a loose fallback.
    if (isCssType(type)) return { kind: 'string' }

    const name = typeName(type)

    // A reference to an exported CLASS instance -> its abstract type in the `InstanceTypes`
    // sink (M2). The class currently being built renders as bare `t` (its module's local
    // alias); any other class as `InstanceTypes.<name>`. Gated on ctx.classTypes, so the
    // component/function paths are unaffected.
    if (ctx.classTypes && type.symbol && ctx.classTypes.has(type.symbol)) {
        const cn = ctx.classTypes.get(type.symbol)
        const sink = (ctx.classSink && ctx.classSink.get(cn)) || lower(cn)
        return { kind: 'classRef', to: sink, home: INSTANCE_MODULE, self: cn === ctx.currentClass }
    }

    // JS built-in containers -> precise ReScript stdlib types (`Map.t` / `Set.t`). Detected by
    // the RESOLVED symbol name, so a first-party alias (`type EventHandlerMap = Map<…>`) is
    // caught too. MUST precede the object/record branch: a Map/Set's methods are all
    // lib-inherited, which would otherwise misfire the domProps-spread heuristic and emit a
    // nonsensical (and unflagged) `{...JsxDOM.domProps}` record.
    const builtin = (type.getSymbol && type.getSymbol() && type.getSymbol().getName()) || ''
    if (/^(Map|WeakMap|ReadonlyMap|Set|WeakSet|ReadonlySet)$/.test(builtin)) {
        const args = (checker.getTypeArguments && checker.getTypeArguments(type)) || type.aliasTypeArguments || []
        const cl = (i, fb) => (args[i] ? classify(args[i], ctx, propName, depth + 1) : { kind: 'opaque', text: fb })
        return /Set$/.test(builtin)
            ? { kind: 'set', of: cl(0, 'value') }
            : { kind: 'map', mapKey: cl(0, 'key'), mapVal: cl(1, 'value') }
    }

    // well-known named types
    if (name === 'Date') return { kind: 'date' }
    if (name === 'ReactNode' || name === 'ReactElement' || name === 'ReactNode[]')
        return { kind: 'reactElement' }
    if (name === 'CSSProperties') return { kind: 'style' }
    if (name === 'Ref' || name === 'RefObject' || name === 'MutableRefObject' || name === 'LegacyRef')
        return { kind: 'domRef' }
    // Specific DOM elements -> Dom.htmlDivElement etc. (built-in, no dep);
    // generic Element/Node -> Dom.element/Dom.node.
    if (name && /Element$/.test(name) && /^(HTML|SVG|Dom)/.test(name))
        return { kind: 'raw', res: domElementType(name) }
    if (name === 'Element') return { kind: 'domElement' }
    if (name === 'Node') return { kind: 'raw', res: 'Dom.node' }

    // File / FileList / FormData -> rescript-webapi, only if the project depends on it (ctx.webapi).
    if (name === 'File') return ctx.webapi ? { kind: 'raw', res: 'Webapi.File.t' } : { kind: 'opaque', text: 'File' }
    if (name === 'FileList') return ctx.webapi ? { kind: 'raw', res: 'Webapi.FileList.t' } : { kind: 'opaque', text: 'FileList' }
    if (name === 'FormData') return ctx.webapi ? { kind: 'raw', res: 'Webapi.FormData.t' } : { kind: 'opaque', text: 'FormData' }

    // React `*EventHandler` alias (e.g. InputEventHandler<T>) -> a typed callback.
    // Handled here because these often expose no call signature to fall through to.
    // Uses `params` (not `arg`) so emit's callback renderer picks it up — an `arg`
    // here renders as `unit => unit` (the event payload is silently dropped).
    if (name && Object.prototype.hasOwnProperty.call(EVENT_HANDLERS, name)) {
        return { kind: 'callback', params: [{ kind: 'event', res: EVENT_HANDLERS[name] }], ret: { kind: 'unit' } }
    }

    // A component-VALUED prop (`ComponentType<P>`, `FC<P>`, `FunctionComponent<P>`,
    // `ComponentClass<P>`) -> `React.component<p>`, where `p` is the bound props record.
    // Only used when the props argument classifies cleanly; otherwise we fall through.
    if (name && /^(ComponentType|ComponentClass|FunctionComponent|FC)$/.test(name)) {
        const pArg = (type.aliasTypeArguments || checker.getTypeArguments?.(type) || [])[0]
        const props = pArg ? classify(pArg, ctx, propName, depth + 1) : null
        if (props && !['opaque', 'review', 'unknown', 'any'].includes(props.kind)) {
            return { kind: 'reactComponent', of: props }
        }
    }

    // `ReactNode & (string | number)` etc. — a children-style intersection. The
    // `& ReactNode` is noise the component wrapper adds; treat the whole thing as
    // `React.element` (which already covers strings/numbers as renderable nodes).
    if ((flags & ts.TypeFlags.Intersection) &&
        (type.types || []).some((p) => /ReactElement|ReactNode/.test(typeName(p) || ''))) {
        return { kind: 'reactElement' }
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

    // Record<K,V> -> `Dict.t<V>`. A mapped `Record<>` isn't a TypeReference, so
    // `getTypeArguments` is empty; read the value type from the alias args, falling
    // back to the string index signature.
    if (name === 'Record') {
        const args = type.aliasTypeArguments || checker.getTypeArguments(type) || []
        let val = args[1]
        if (!val) { const si = checker.getIndexInfoOfType?.(type, ts.IndexKind.String); val = si && si.type }
        return { kind: 'dict', of: val ? classify(val, ctx, propName, depth + 1) : { kind: 'opaque', text: 'JSON.t' } }
    }
    // `{ [k: string]: V }` — a string-index map with no named props -> `Dict.t<V>`.
    const strIndex = checker.getIndexInfoOfType?.(type, ts.IndexKind.String)
    if (strIndex && type.getProperties().length === 0) {
        return { kind: 'dict', of: classify(strIndex.type, ctx, propName, depth + 1) }
    }

    // functions / callbacks
    const callSigs = type.getCallSignatures()
    if (callSigs.length) {
        // Overloaded function — ≥2 call signatures (a TS intersection of call sigs `A & B`,
        // or a multi-call-signature interface). No native ReScript overload type, so model it
        // as an opaque module with one zero-cost `%identity` accessor VIEW per signature (so
        // NEITHER overload is dropped). Falls back to 🔍 review if it can't be modelled cleanly.
        if (callSigs.length > 1) {
            const ov = overloadModule(ctx, type, callSigs, propName, depth)
            return ov || { kind: 'review', note: `overloaded function (${callSigs.length} call signatures) — no single ReScript type` }
        }
        return functionNode(callSigs[0], ctx, propName, depth)
    }

    // unions
    if (flags & ts.TypeFlags.Union) {
        return unionNode(type, ctx, propName, depth)
    }

    // object / intersection types -> records (the checker flattens `A & B`):
    //  - anonymous literals (symbol "__type") -> inline record named after the prop
    //  - first-party NAMED interface (AvatarData) or alias-to-intersection (ButtonProps)
    //    -> a record named after the type, spreading JsxDOM.domProps for the HTML part
    //  - utility-wrapped first-party object (Partial<MenuProps>, Omit<TagProps,…>,
    //    nested Partial<Omit<…>>) -> "see through" the wrapper: judge library-ness by
    //    the unwrapped core, and name the record after the PROP (the wrapped shape
    //    differs from the bare type, so it must be its own distinct record).
    const core = unwrapUtility(type)
    const isUtilityWrap = core !== type
    const libCore = isUtilityWrap ? core : type
    // `Omit<ButtonHTMLAttributes,"type">` (and bare `*HTMLAttributes`) = "all HTML attrs".
    // The core is a library (@types/react) type, but it maps cleanly to a record that
    // spreads `JsxDOM.domProps`, so allow it through the library gate. (Scoped to
    // /HTMLAttributes/ so no other library type becomes a record.)
    const isHtmlAttrs = /HTMLAttributes/.test(typeName(libCore) || '')
    const isObjectish = flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)
    if (isObjectish && type.getProperties().length > 0 && (!isLibraryType(libCore) || isHtmlAttrs)) {
        const sym = type.getSymbol() || type.symbol
        const symName = sym && sym.getName()
        const cap = (n) => (n && /^[A-Z]/.test(n) ? n : null)
        const named = isUtilityWrap
            ? null
            : cap(type.aliasSymbol && type.aliasSymbol.getName()) ||
              cap(symName && symName !== '__type' ? symName : null)
        if (named || isUtilityWrap || isHtmlAttrs || symName === '__type' || (flags & ts.TypeFlags.Intersection)) {
            return recordNode(type, ctx, propName, depth, named)
        }
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
    if (ctx.shared) return registerNamed(ctx, type, 'enum', lower(ename), { members })
    const key = lower(ename)
    if (!ctx.seenEnums.has(key)) {
        ctx.seenEnums.set(key, true)
        ctx.enums.push({ name: key, members })
    }
    return { kind: 'typeRef', to: key, _enum: true }
}

/**
 * Detect the LiteralUnion idiom `'a' | 'b' | string` from the SYNTACTIC type node. TS collapses
 * this to bare `string` in the resolved type (the literals are gone), so we read the AST node
 * pre-collapse. Returns the literal string values, or null. Skips the `(string & {})` brand form
 * (its member isn't a `string` keyword, so it bails) — that stays a closed enum via the type path.
 * @returns {string[] | null}
 */
function literalUnionOpen(typeNode, checker) {
    if (!typeNode || !ts.isUnionTypeNode(typeNode)) return null
    let hasString = false
    const literals = []
    for (const member of typeNode.types) {
        if (member.kind === ts.SyntaxKind.StringKeyword) { hasString = true; continue }
        const mt = checker.getTypeFromTypeNode(member)
        const parts = mt.isUnion && mt.isUnion() ? mt.types : [mt]
        for (const p of parts) {
            if (p.isStringLiteral && p.isStringLiteral()) literals.push(p.value)
            else return null // a non-string-literal, non-`string` member -> not this idiom
        }
    }
    if (!hasString || !literals.length) return null
    return [...new Set(literals)] // dedupe, preserve order
}

/** First TypeReference name in a union node (`ToastPosition | string` -> "ToastPosition"), for naming. */
function unionRefName(typeNode) {
    for (const m of typeNode.types) if (ts.isTypeReferenceNode(m)) return m.typeName.getText()
    return null
}

/**
 * Build the `LiteralUnion | string` mapping: an `@unboxed` variant with the known literals as
 * `@as` arms PLUS a `Custom(string)` catch-all (the `| string` escape hatch). Zero-cost, typo-safe
 * on the known values, still accepts any other string. Registered like any other `@unboxed` variant.
 * @returns {{kind:'typeRef', to:string, _unboxed:true}}
 */
function literalUnionOpenNode(literals, baseName, ctx, propName) {
    const members = literals.map((v) => ({ ctor: pascal(String(v)), as: String(v) }))
    members.push({ ctor: 'Custom', type: { kind: 'string' } }) // the `| string` escape hatch
    // `<base>OrString` (matches the `boolOrString` / `stringOrNumber` convention) — the `OrString`
    // signals the open `Custom(string)` arm and leaves the bare name free for the closed enum.
    const sname = lower(pascal(baseName || propName)) + 'OrString'
    if (ctx.shared) {
        // Key by the literal SET (NOT the collapsed `string` type.id, which every `| string`
        // prop shares) so distinct literal sets get distinct types and identical ones dedupe.
        const key = 'lu:' + sname + ':' + literals.join('|')
        if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
        const entry = { key, kind: 'unboxed', name: uniqueName(sname, ctx.shared), home: 'CommonTypes', members, deps: new Set() }
        ctx.shared.byKey.set(key, entry)
        ctx.shared.entries.push(entry)
        return refTo(entry)
    }
    if (!ctx.seenUnboxed.has(sname)) {
        ctx.seenUnboxed.set(sname, true)
        ctx.unboxed.push({ name: sname, members })
    }
    return { kind: 'typeRef', to: sname, _unboxed: true }
}

/**
 * Register a NAMED type (enum/record) in the module-level registry, deduped by
 * `type.id`. Returns its typeRef. For records, `data` is filled by the caller AFTER
 * this returns the entry (so self-references resolve during field building).
 * @returns {object} the typeRef (when reused) — see registerEntry for new ones
 */
function registerNamed(ctx, type, kind, base, data) {
    const key = 'id:' + type.id
    if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
    const entry = { key, kind, name: uniqueName(base, ctx.shared), home: homeOf(type, ctx), deps: new Set(), ...data }
    ctx.shared.byKey.set(key, entry)
    ctx.shared.entries.push(entry)
    return refTo(entry)
}

/**
 * The "logical" members of a union, re-grouping flattened enum literals back into their
 * enum type. TS represents `DateRangePreset | Foo` as `(CUSTOM | TODAY | … | Foo)` (the
 * enum is spread into its literals); this collapses each enum's literals back to the one
 * enum type. Null/undefined are dropped. Deduped by type id.
 * @returns {ts.Type[]}
 */
function unionMembers(checker, u) {
    const out = [], seen = new Set(), seenEnum = new Set()
    for (const t of (u.types || [])) {
        if (t.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) continue
        const sym = t.symbol
        if ((t.flags & ts.TypeFlags.EnumLiteral) && sym && sym.parent) {
            if (seenEnum.has(sym.parent)) continue
            seenEnum.add(sym.parent)
            const et = checker.getDeclaredTypeOfSymbol(sym.parent)
            if (et && et.id != null && !seen.has(et.id)) { seen.add(et.id); out.push(et) }
            continue
        }
        if (t.id != null && !seen.has(t.id)) { seen.add(t.id); out.push(t) }
    }
    return out
}

/**
 * A union of MULTIPLE object shapes (e.g. `PresetsConfig = DateRangePreset |
 * CustomPresetConfig | CustomPresetDefinition`) can't be an `@unboxed` variant (ReScript
 * allows at most one object case). Bind it as an OPAQUE-type module (the idiomatic ReScript
 * pattern — like `React.element` + `React.string`/`React.int`): an abstract `t` plus a
 * zero-cost `%identity` `from*` constructor per member. The prop type is `Module.t` (kept
 * TYPED), and the consumer builds a typed value and `->fromX`-casts it (compiles to the raw
 * value). Returns the prop's typeRef (`<Module>.t`), or null if any member can't be cleanly
 * typed (then the caller keeps it flagged).
 * @returns {{kind:'typeRef', to:string, home:string, key:string} | null}
 */
function opaqueUnion(ctx, type, memberTypes, propName, depth) {
    if (!ctx.shared) return null // module mode only
    const key = 't:' + type.id
    // carry the entry's `note` (how to construct the opaque value) onto each ref so
    // emit can surface it inline on the prop — even on a memoized cache-hit.
    const ref = (e) => ({ kind: 'typeRef', to: e.name + '.t', home: e.home, key: e.key, ...(e.note ? { note: e.note } : {}) })
    if (ctx.shared.byKey.has(key)) return ref(ctx.shared.byKey.get(key))
    const { checker } = ctx
    const members = []
    for (const mt of memberTypes) {
        const node = classify(mt, ctx, propName, depth + 1)
        if (!node || ['opaque', 'review', 'unknown', 'any'].includes(node.kind)) return null
        // Constructor-name hint so emit produces clean `from*` names regardless of
        // how the member renders: `Element` -> fromElement, `Element[]` ->
        // fromElements (plural of the element's name), `File`/`File[]` ->
        // fromFile/fromFiles. Falls back in emit when no hint is available.
        const elem = asArray(mt, checker)
        const name = elem ? (typeName(elem) ? typeName(elem) + 's' : undefined) : typeName(mt)
        members.push({ type: node, name })
    }
    if (members.length < 2) return null
    const name = uniqueName(pascal(typeName(type) || propName), ctx.shared) // a MODULE name
    const deps = new Set()
    for (const m of members) collectRefKeys(m.type, deps)
    // Sit with the records it references (first dep's home); else the prop's own
    // domain module (so anonymous prop-unions land in <Component>Types, not Common).
    let home = homeOf(type, ctx)
    if (deps.size) { const d = ctx.shared.byKey.get([...deps][0]); if (d && d.home) home = d.home }
    // Note telling the caller how to build this opaque value (the `from*` ctors),
    // since the prop only shows `<Module>.t`. Mirrors the Dom-node note convention.
    const note = members.every((m) => m.name)
        ? `was \`${checker.typeToString(type).replace(/ \| (null|undefined)\b/g, '')}\` — opaque; build with ${members.map((m) => `${name}.from${pascal(m.name)}`).join(' / ')}`
        : undefined
    const entry = { key, kind: 'opaque', name, home, members, deps, note }
    ctx.shared.byKey.set(key, entry)
    ctx.shared.entries.push(entry)
    return ref(entry)
}

/** True if a callback/type node tree contains anything we won't fake (unknown/any/review/opaque). */
function nodeImperfect(t) {
    if (!t || typeof t !== 'object') return false
    if (['unknown', 'any', 'review', 'opaque'].includes(t.kind)) return true
    if (t.of && nodeImperfect(t.of)) return true
    if (t.ret && nodeImperfect(t.ret)) return true
    if (t.arg && nodeImperfect(t.arg)) return true
    if (Array.isArray(t.params)) return t.params.some(nodeImperfect)
    return false
}

/**
 * An overloaded function (≥2 call signatures) has no native ReScript type. Model it as an
 * opaque-type module with one zero-cost `%identity` ACCESSOR per signature —
 * `external asReason: t => (option<…> => unit) = "%identity"` — so EVERY overload stays
 * callable with no runtime cost (the value passes straight through, unchanged). The fidelity
 * fallback for "can't @unboxed". Module mode only. Returns the prop's `<Module>.t` typeRef,
 * or null if it can't be modelled cleanly (the caller then flags it 🔍 review).
 * @returns {{kind:'typeRef', to:string, home:string, key:string} | null}
 */
function overloadModule(ctx, type, callSigs, propName, depth) {
    if (!ctx.shared) return null // needs the shared-type registry (module mode)
    const key = 't:' + type.id
    const ref = (e) => ({ kind: 'typeRef', to: e.name + '.t', home: e.home, key: e.key, ...(e.note ? { note: e.note } : {}) })
    if (ctx.shared.byKey.has(key)) return ref(ctx.shared.byKey.get(key))
    // Build a callback node per signature; bail (→ review) if any param/return can't be typed.
    const sigs = []
    const used = new Set()
    for (const s of callSigs) {
        const fn = functionNode(s, ctx, propName, depth + 1)
        if (nodeImperfect(fn)) return null
        // accessor name: `as` + the first param's NAME when descriptive (reason -> asReason);
        // else the React-event type (e: MouseEvent -> asMouse); else a no-arg `asThunk`.
        const p0 = s.getParameters()[0]
        const pname = p0 && p0.getName()
        const ev = fn.params && fn.params[0] && fn.params[0].kind === 'event' ? /ReactEvent\.(\w+)\.t/.exec(fn.params[0].res) : null
        let base = pname && pname.length > 1 ? 'as' + pascal(pname)
            : ev ? 'as' + pascal(ev[1])
            : !fn.params || fn.params.length === 0 ? 'asThunk'
            : pname ? 'as' + pascal(pname) : 'asFn'
        let accessor = base, n = 2
        while (used.has(accessor)) accessor = base + n++
        used.add(accessor)
        sigs.push({ accessor, fn })
    }
    if (sigs.length < 2) return null
    const name = uniqueName(pascal(typeName(type) || propName), ctx.shared) // a MODULE name
    const deps = new Set()
    for (const s of sigs) collectRefKeys(s.fn, deps)
    let home = homeOf(type, ctx)
    if (deps.size) { const d = ctx.shared.byKey.get([...deps][0]); if (d && d.home) home = d.home }
    const note = `was overloaded \`${typeName(type) || 'function'}\` (${callSigs.length} call signatures) — opaque; view with ${sigs.map((s) => `${name}.${s.accessor}`).join(' / ')}`
    const entry = { key, kind: 'opaque', variant: 'overload', name, home, sigs, deps, note }
    ctx.shared.byKey.set(key, entry)
    ctx.shared.entries.push(entry)
    return ref(entry)
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
    // de-acronym a leading uppercase run so `HTMLInputTypeAttribute` -> `htmlInputTypeAttribute`
    // (not `hTMLInput…`); a plain name just gets its first char lowercased.
    let n = s.replace(/^([A-Z]+)([A-Z][a-z])/, (_, run, next) => run.toLowerCase() + next)
    if (n === s) n = s.charAt(0).toLowerCase() + s.slice(1)
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

    // Collapse `T | (T & X)` to `T`. e.g. blend declares `value: string`, but the
    // component wrapper intersects it with React's `value?: string | number | readonly
    // string[]`, which TS distributes to `string | (string & readonly string[])`. The
    // `string & readonly string[]` part is uninhabitable (no value is both), so the type
    // is exactly `string` — emit it cleanly (not a flagged loose fallback). An
    // intersection counts as primitive `T` when one of its parts is that primitive.
    const primOf = (t) => {
        if (t.flags & ts.TypeFlags.String) return 'string'
        if (t.flags & ts.TypeFlags.Number) return 'number'
        if (t.flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return 'boolean'
        if (t.flags & ts.TypeFlags.Intersection) {
            const p = (t.types || []).map(primOf).find(Boolean)
            if (p) return p
        }
        return null
    }
    const prims = parts.map(primOf)
    if (prims.every(Boolean) && new Set(prims).size === 1) {
        return { kind: prims[0] === 'boolean' ? 'boolean' : prims[0] === 'number' ? 'number' : 'string' }
    }

    // String-literal union -> `@as` variant. Also covers the `"a" | "b" | (string & {})`
    // open-ended-literal idiom (e.g. `HTMLInputTypeAttribute`): the `string & {}` autocomplete
    // escape is dropped so the binding is a clean shared variant of the known literals
    // (deduped by type.id into one `*Types.res` module, referenced everywhere).
    const isLit = (t) => t.isStringLiteral && t.isStringLiteral()
    const isStrBrand = (t) => (t.flags & ts.TypeFlags.Intersection) && (t.types || []).some((x) => x.flags & ts.TypeFlags.String)
    const litParts = parts.filter(isLit)
    if (litParts.length >= 2 && parts.every((t) => isLit(t) || isStrBrand(t))) {
        const members = litParts.map((t) => ({ as: t.value, ctor: pascal(t.value) }))
        if (ctx.shared) return registerNamed(ctx, type, 'enum', lower(typeName(type) || pascal(propName)), { members })
        const key = lower(pascal(propName))
        if (!ctx.seenEnums.has(key)) {
            ctx.seenEnums.set(key, true)
            ctx.enums.push({ name: key, members })
        }
        return { kind: 'typeRef', to: key, _enum: true }
    }

    // boolean union (true|false)
    if (parts.every((t) => t.flags & (ts.TypeFlags.BooleanLiteral | ts.TypeFlags.Boolean)))
        return { kind: 'boolean' }

    // Any renderable-React union -> React.element. Covers `ReactElement | ReactElement[]`
    // AND `children: ReactNode & (string | number)` which TS distributes into
    // `string | number | (ReactElement & string) | …` (the reactish parts are
    // intersections, so we detect those too). If React content is allowed at all,
    // React.element is the correct ReScript type (it covers strings/numbers as nodes).
    const isReactish = (t) => {
        const n = typeName(t)
        if (n && /ReactElement|ReactNode/.test(n)) return true
        if ((t.flags & ts.TypeFlags.Intersection) &&
            (t.types || []).some((x) => /ReactElement|ReactNode/.test(typeName(x) || ''))) return true
        const elem = asArray(t, checker)
        const en = elem && typeName(elem)
        return !!(en && /ReactElement|ReactNode/.test(en))
    }
    if (parts.some(isReactish)) return { kind: 'reactElement' }

    // A union of DOM node/element/fragment types (e.g. a portal `container?: Element |
    // DocumentFragment`) -> `Dom.element` (the ergonomic portal-target type). A note is
    // attached so the consumer knows a fragment / shadow-root target isn't covered.
    const isDomNodeType = (t) => {
        const n = typeName(t)
        return !!(n && (/Element$/.test(n) || n === 'Node' || n === 'DocumentFragment' || n === 'ShadowRoot'))
    }
    if (parts.every(isDomNodeType)) {
        const note = parts.some((t) => { const n = typeName(t); return n === 'DocumentFragment' || n === 'ShadowRoot' })
            ? `was \`${checker.typeToString(type).replace(/\s+/g, ' ')}\` — bound to Dom.element; a DocumentFragment/ShadowRoot target is not supported`
            : undefined
        return note ? { kind: 'raw', res: 'Dom.element', note } : { kind: 'raw', res: 'Dom.element' }
    }

    // Union of ARRAY types (e.g. `PresetsConfig = A[] | B[] | (A|B|C)[]`) -> `array<E>`.
    // If every member's element is the SAME type, E is that element; otherwise the element
    // is heterogeneous (often multiple object shapes that can't be discriminated) -> JSON.t,
    // so the prop is usable (`array<JSON.t>`) rather than a flagged string placeholder.
    const arrElems = parts.map((p) => asArray(p, checker))
    if (arrElems.every(Boolean)) {
        const sameElem = arrElems.every((e) => e.id != null && e.id === arrElems[0].id)
        if (sameElem) return { kind: 'array', of: classify(arrElems[0], ctx, propName, depth + 1) }
        // Heterogeneous elements (e.g. PresetsConfig's `A[] | B[] | (A|B|C)[]`): collect the
        // distinct element types and bind as a tagged-variant + converter; else `array<JSON.t>`.
        // Collect the distinct element types. A genuine union element `(A|B|C)` expands to
        // its logical members (enum literals re-grouped to their enum); an enum element or a
        // single type stays as one.
        const elemTypes = []
        for (const e of arrElems) {
            if (e.isUnion && e.isUnion() && !(e.flags & ts.TypeFlags.EnumLike)) elemTypes.push(...unionMembers(checker, e))
            else elemTypes.push(e)
        }
        const seen = new Set(), distinct = []
        for (const e of elemTypes) { if (e.id != null && !seen.has(e.id)) { seen.add(e.id); distinct.push(e) } }
        const opaque = distinct.length >= 2 ? opaqueUnion(ctx, type, distinct, propName, depth) : null
        return { kind: 'array', of: opaque || { kind: 'raw', res: 'JSON.t' } }
    }

    // Genuine multi-runtime-type union (string|number, string|string[],
    // boolean|"indeterminate", …). Emit a ReScript UNTAGGED (@unboxed) variant —
    // type-safe AND zero-cost (the raw value reaches JS, no %identity, no wrapper).
    // Sound only when members are runtime-discriminable: at most ONE broad type per
    // JS `typeof` bucket (string/number/boolean/array), but several distinct string/
    // number LITERALS may coexist as bare `@as("…")` constructors (distinct constant
    // values) — e.g. `boolean | "indeterminate"` -> Bool(bool) | @as("indeterminate") Indeterminate.
    // TS expands `boolean` into `true | false`, so collapse those into one `bool`.
    let hasBool = false, hasString = false, hasNumber = false
    const strLits = [], numLits = [], others = []
    let buildable = true
    for (const p of parts) {
        if (p.flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) hasBool = true
        else if (p.flags & ts.TypeFlags.StringLiteral) strLits.push(p)
        else if (p.flags & ts.TypeFlags.NumberLiteral) numLits.push(p)
        else if (p.flags & ts.TypeFlags.String) hasString = true
        else if (p.flags & ts.TypeFlags.Number) hasNumber = true
        else {
            const m = memberOf(p, ctx, propName, depth)
            if (!m) { buildable = false; break }
            others.push(m)
        }
    }
    if (buildable) {
        const members = []
        const usedRt = new Set()
        const usedCtor = new Set()
        const uniqueCtor = (base) => { let c = base, i = 2; while (usedCtor.has(c)) c = base + i++; usedCtor.add(c); return c }
        const claim = (rt) => { if (usedRt.has(rt)) return false; usedRt.add(rt); return true }
        // Stable order so structurally-identical unions get one shared name: bool,
        // string (broad OR literals), number (broad OR literals), then arrays/others.
        if (hasBool && claim('boolean')) members.push({ ctor: uniqueCtor('Bool'), type: { kind: 'boolean' } })
        if (hasString) { if (claim('string')) members.push({ ctor: uniqueCtor('Str'), type: { kind: 'string' } }) }
        else if (strLits.length && claim('string')) {
            for (const l of strLits) members.push({ ctor: uniqueCtor(pascal(String(l.value))), as: String(l.value) })
        }
        if (hasNumber) { if (claim('number')) members.push({ ctor: uniqueCtor('Num'), type: { kind: 'number', _float: true } }) }
        else if (numLits.length && claim('number')) {
            for (const l of numLits) members.push({ ctor: uniqueCtor('N' + String(l.value).replace(/[^0-9a-zA-Z]/g, '_')), as: l.value, _num: true })
        }
        for (const m of others) { if (!claim(m.rt)) { buildable = false; break } members.push({ ctor: uniqueCtor(m.ctor), type: m.type }) }

        if (buildable && members.length >= 2) {
            // Name by STRUCTURE so identical unions share one type — EXCEPT function-bearing
            // ones (a signature has no short structural token), which are named after the
            // prop (`formAction`, `virtualItemHeight`). A member using a type variable (a
            // sync-or-async `=> 'a` return) makes the variant generic (`formAction<'a>`).
            const hasFn = members.some((m) => m.type && m.type.kind === 'callback')
            const sname = hasFn ? lower(pascal(propName)) : unboxedName(members)
            const tvars = new Set()
            for (const m of members) collectTypeVars(m.type, tvars)
            const tparams = tvars.size ? [...tvars] : undefined
            if (ctx.shared) {
                // Primitive-only variants have no TS source -> home `CommonTypes`. A variant
                // referencing a record/enum (object payload, or a fn over `menuItemType`)
                // lives WITH that type's module so `CommonTypes` stays a dependency-free sink
                // and never gets SCC-merged. Deduped via the `u:` key.
                const key = 'u:' + sname
                if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
                const deps = new Set()
                for (const m of members) collectRefKeys(m.type, deps)
                let home = 'CommonTypes'
                if (deps.size) { const d = ctx.shared.byKey.get([...deps][0]); if (d && d.home) home = d.home }
                const entry = { key, kind: 'unboxed', name: uniqueName(sname, ctx.shared), home, members, deps, tparams }
                ctx.shared.byKey.set(key, entry)
                ctx.shared.entries.push(entry)
                return refTo(entry)
            }
            if (!ctx.seenUnboxed.has(sname)) {
                ctx.seenUnboxed.set(sname, true)
                ctx.unboxed.push({ name: sname, members, tparams })
            }
            return tparams ? { kind: 'typeRef', to: sname, _unboxed: true, tparams } : { kind: 'typeRef', to: sname, _unboxed: true }
        }
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
    if (parts.some(isStructured)) {
        // ≥2 "structured" members that can't be discriminated by an @unboxed
        // variant (abstract objects / arrays) -> an opaque-type module with
        // zero-cost `from*` constructors. Two shapes qualify: multiple named
        // object types (e.g. customPresets), OR object | array<object> (e.g.
        // `Element | Element[]`, `File | File[]`) — the array is structured too,
        // so we count it. A single object alone still falls through to review.
        const structuredParts = parts.filter((t) => {
            if (asArray(t, checker)) return true
            const s = t.getSymbol && t.getSymbol()
            return (t.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)) && s && t.getProperties().length
        })
        if (structuredParts.length >= 2) {
            const opaque = opaqueUnion(ctx, type, unionMembers(checker, type), propName, depth)
            if (opaque) return opaque
        }
        return { kind: 'review', text: checker.typeToString(type) }
    }
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
    // A single function member -> runtime `typeof "function"` (distinct from string/number/
    // boolean/object/array). Only ONE allowed (`claim('function')` enforces it). Enables
    // `string | (fn)` (formAction) and `number | (fn)` (virtualItemHeight) as @unboxed.
    if (t.getCallSignatures && t.getCallSignatures().length) {
        return { ctor: 'Fn', rt: 'function', type: functionNode(t.getCallSignatures()[0], ctx, propName, depth) }
    }

    // A single ANONYMOUS inline-object member (e.g. `string | { key, color }`) -> runtime
    // `typeof "object"` (distinct from string/number/boolean/array). Only ONE is allowed
    // (two objects can't be discriminated); `claim('object')` in unionNode enforces that.
    // Restricted to anonymous literals (`__type`): expanding a NAMED cross-domain object
    // here would pull large interconnected graphs (e.g. Highcharts) into one SCC.
    const isObjectish = t.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)
    const sym = t.getSymbol && t.getSymbol()
    if (isObjectish && (sym && sym.getName()) === '__type' && t.getProperties().length > 0 && !isLibraryType(t)) {
        const node = classify(t, ctx, propName, depth + 1)
        if (node && node.kind === 'typeRef' && !node._enum && !node._unboxed) {
            return { ctor: pascal(node.to), rt: 'object', type: node }
        }
    }
    return null // named/library/Date/function objects — not expanded here
}

/**
 * Derive a STRUCTURAL name for an untagged variant from its members, so two
 * unions with the same shape get the same name (and are deduped into one type).
 * e.g. `string | string[]` -> `stringOrStringArray`, `string | number` -> `stringOrNumber`.
 * @param {Array<{ctor:string, type:object}>} members
 * @returns {string}
 */
function unboxedName(members) {
    const tokType = (t) => {
        switch (t.kind) {
            case 'string': return 'String'
            case 'number': return 'Number'
            case 'boolean': return 'Bool'
            case 'array': return tokType(t.of) + 'Array'
            case 'reactElement': return 'Element'
            case 'typeRef': return pascal(t.to)
            default: return 'Value'
        }
    }
    // bare `@as("indeterminate")` literal members contribute their value (Indeterminate);
    // payload members contribute their structural token (String/Number/…).
    const tok = (m) => (m.as !== undefined ? pascal(String(m.as)) : tokType(m.type))
    return lower(members.map(tok).join('Or'))
}

/**
 * Map a function/callback type to an IR callback node, classifying EVERY parameter
 * and the real return type. A param matching a React event becomes `ReactEvent.X.t`.
 * If a param/return can't be typed exactly it stays opaque/unknown and the emitter
 * flags the whole prop (rather than emitting a half-correct signature).
 * @param {ts.Signature} sig
 * @param {object} ctx
 * @param {string} propName
 * @param {number} [depth]
 * @returns {{kind:'callback', params:object[], ret:object}}
 */
function functionNode(sig, ctx, propName, depth = 0) {
    const { checker } = ctx
    const params = sig.getParameters().map((pp) => {
        // An optional param `reason?: T` (or one with a default) -> `option<T>` (emit wraps it).
        // Parameter symbols don't carry SymbolFlags.Optional reliably, so read the declaration's
        // `?`/initializer. Strip any `| undefined` the checker folds in so the inner type stays exact.
        const pdecl = pp.valueDeclaration
        const optional = (pp.getFlags() & ts.SymbolFlags.Optional) !== 0 ||
            !!(pdecl && ts.isParameter(pdecl) && (pdecl.questionToken || pdecl.initializer))
        let pt = checker.getTypeOfSymbolAtLocation(pp, ctx.decl)
        if (optional) pt = checker.getNonNullableType(pt)
        const n = typeName(pt)
        // hasOwnProperty guard: a param whose type resolves to a name like `toString`/`valueOf`
        // must not match an inherited Object.prototype member (which would be a native function).
        const node = (n && Object.prototype.hasOwnProperty.call(REACT_EVENTS, n))
            ? { kind: 'event', res: REACT_EVENTS[n] }
            : classify(pt, ctx, propName, depth + 1)
        return optional ? { ...node, optional: true } : node
    })
    const retType = sig.getReturnType()
    // `void | Promise<void>` (a handler that may be sync OR async, e.g. formAction) -> a
    // polymorphic return `'a`: it accepts both `=> unit` and `=> promise<unit>` handlers,
    // with `'a` inferred per call site. (Makes the enclosing variant generic.)
    let ret
    if (retType.isUnion && retType.isUnion()) {
        const hasVoid = retType.types.some((t) => t.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined))
        const hasPromise = retType.types.some((t) => typeName(t) === 'Promise')
        if (hasVoid && hasPromise) ret = { kind: 'typeVar', name: "'a" }
    }
    if (!ret) {
        const retVoid = !!(retType.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined))
        ret = retVoid ? { kind: 'unit' } : classify(retType, ctx, propName, depth + 1)
    }
    return { kind: 'callback', params, ret }
}

/**
 * A stable structural signature for an IR type node — identical structures produce
 * identical strings. typeRefs key on the registry `key` (stable across naming) so two
 * fields pointing at the same canonical record match; classRefs key on the sink target
 * only (the `self` flag is ignored — in a shared module it always renders to the sink).
 * Used to dedup structurally-identical records (Fix B, the generic-instantiation explosion).
 * @param {object} t
 * @returns {string}
 */
function typeSig(t) {
    if (!t || typeof t !== 'object') return JSON.stringify(t)
    switch (t.kind) {
        case 'typeRef': return 'R(' + (t.key || t.to) + (t.tparams ? '<' + t.tparams.join(',') + '>' : '') + ')'
        case 'classRef': return 'C(' + t.home + '.' + t.to + ')'
        case 'array': return 'A[' + typeSig(t.of) + ']'
        case 'dict': return 'D[' + typeSig(t.of) + ']'
        case 'map': return 'M[' + typeSig(t.mapKey) + ',' + typeSig(t.mapVal) + ']'
        case 'set': return 'S[' + typeSig(t.of) + ']'
        case 'promise': return 'P[' + typeSig(t.of) + ']'
        case 'callback': return 'F(' + (t.params || []).map(typeSig).join(',') + ')=>' + typeSig(t.ret || { kind: 'unit' })
        case 'event': return 'E(' + t.res + ')'
        case 'raw': return 'raw(' + t.res + ')'
        case 'typeVar': return 'V(' + t.name + ')'
        case 'number': return t._float ? 'numF' : 'num'
        // opaque / review / unknown / any all render to the SAME `opaqueFallback` (string),
        // so they're interchangeable for dedup — normalize, ignoring the (display-only) text.
        case 'opaque':
        case 'review':
        case 'unknown':
        case 'any': return 'opaque'
        default: return t.kind
    }
}

/** Structural signature of a whole record entry (spread + type params + each field's
 *  name/optionality/type). Two records with the same signature are interchangeable. */
function recordSig(entry) {
    return 'sp:' + (entry.spread || '') + '|tp:' + ((entry.tparams || []).join(',')) + '|' +
        entry.fields.map((f) => f.name + (f.optional ? '?' : '') + ':' + typeSig(f.type)).join(';')
}

/**
 * Turn an object type into a ReScript record declaration, register it (deduped),
 * and return a reference. Anonymous `{…}` → named `<prop>Config`; a NAMED interface
 * (typeName passed) → `<typeName>`. When the type pulls in inherited HTML fields
 * (it spreads HTMLAttributes), the record spreads `JsxDOM.domProps` and emits only
 * the own fields whose name doesn't collide with domProps (avoids duplicate-field
 * errors and keeps it small). Cycle-guarded via `ctx.visiting`.
 * @param {ts.Type} type
 * @param {object} ctx
 * @param {string} propName
 * @param {number} [depth]
 * @param {string} [typeName]  the named interface name (AvatarData) if first-party named
 * @returns {{kind:'typeRef', to:string}}
 */
function recordNode(type, ctx, propName, depth = 0, typeName = null) {
    const base = typeName ? lower(typeName) : lower(pascal(propName)) + 'Config'

    if (ctx.shared) {
        // Module mode: register the entry EARLY (with its final name) so self/mutual
        // references during field building resolve to its typeRef, then fill fields.
        const key = 'id:' + type.id
        if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
        const entry = { key, kind: 'record', name: uniqueName(base, ctx.shared), home: homeOf(type, ctx), deps: new Set(), spread: undefined, fields: [] }
        ctx.shared.byKey.set(key, entry)
        ctx.shared.entries.push(entry)
        if (type.id != null) ctx.visiting?.add(type.id)
        const built = buildRecordFields(type, ctx, depth)
        if (type.id != null) ctx.visiting?.delete(type.id)
        entry.spread = built.spread
        entry.fields = built.fields
        for (const f of built.fields) collectRefKeys(f.type, entry.deps)
        // generic record (uses a type variable) -> parameterize: `type foo<'a> = {…}`
        const tvars = new Set()
        for (const f of built.fields) collectTypeVars(f.type, tvars)
        if (tvars.size) entry.tparams = [...tvars]

        // Structural dedup: many distinct TS generic instantiations widen to the SAME record
        // (e.g. Hono's 1728 `honoNNN`, all `{get: …, post: …}` after the generics collapse).
        // If an identical record already exists, collapse into it: drop this entry, redirect
        // this type.id to the canonical one, and hand back its ref. Built bottom-up, so a
        // record's children are already deduped when we hash it. Recursive records carry a
        // self-key in their signature, so they never falsely merge.
        const sig = recordSig(entry)
        const canon = ctx.shared.bySig.get(sig)
        if (canon && canon !== entry) {
            const i = ctx.shared.entries.indexOf(entry)
            if (i >= 0) ctx.shared.entries.splice(i, 1)
            ctx.shared.names.delete(entry.name)
            ctx.shared.byKey.set(key, canon) // future refs to this type.id -> canonical
            return refTo(canon)
        }
        ctx.shared.bySig.set(sig, entry)
        return refTo(entry)
    }

    // Single-file mode: emit into the component's local record list, deduped by name.
    const rname = base
    if (ctx.seenRecords.has(rname)) return { kind: 'typeRef', to: rname }
    ctx.seenRecords.set(rname, true)
    if (type.id != null) ctx.visiting?.add(type.id)
    const built = buildRecordFields(type, ctx, depth)
    if (type.id != null) ctx.visiting?.delete(type.id)
    const tvars = new Set()
    for (const f of built.fields) collectTypeVars(f.type, tvars)
    const tparams = tvars.size ? [...tvars] : undefined
    ctx.records.push({ name: rname, spread: built.spread, fields: built.fields, tparams })
    return tparams ? { kind: 'typeRef', to: rname, tparams } : { kind: 'typeRef', to: rname }
}

/**
 * Compute a record's `spread` (`JsxDOM.domProps` when it inherits HTML attrs) and
 * its own `fields` (each classified). Shared by both single-file and module modes.
 * @returns {{spread:string|undefined, fields:Array<{name,optional,type}>}}
 */
function buildRecordFields(type, ctx, depth) {
    const { checker } = ctx
    const isInherited = (p) => {
        const d = p.declarations && p.declarations[0]
        const f = (d && d.getSourceFile().fileName) || ''
        return /node_modules\/(@types|typescript)\//.test(f) || /\/lib\.(dom|es|scripthost)/.test(f)
    }
    const props = type.getProperties()
    const hasHtml = props.some(isInherited)
    const spread = hasHtml ? 'JsxDOM.domProps' : undefined

    const fields = props
        // when spreading domProps, drop ALL inherited HTML fields + any own field whose
        // name already exists in domProps (collision); keep only the package's own fields.
        .filter((p) => !spread || (!isInherited(p) && !DOM_PROPS_FIELDS.has(p.getName())))
        .filter((p) => !['ref', 'key'].includes(p.getName()))
        .map((p) => {
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
            const t = checker.getTypeOfSymbolAtLocation(p, ctx.decl)
            return { name: p.getName(), optional, type: classify(t, ctx, p.getName(), depth + 1) }
        })
    return { spread, fields }
}
