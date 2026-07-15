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
import { DOM_ELEMENT_BY_LOWER, DOM_PROPS_FIELDS, RESCRIPT_RESERVED } from './stdlib-types.mjs'
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

/** Builtin generic containers whose instantiations all share ONE global `lib.es` symbol
 *  (`Array<A>` and `Array<B>` are the same `Array` symbol; likewise `Map`/`Set`/`Promise`/…).
 *  That shared symbol fools the same-generic-record union collapse into treating `Map<A> | Map<B>`
 *  as one record and building it from the container's prototype methods. Detected by name + a
 *  `isLibraryType` guard so a first-party type coincidentally named `Map` is NOT excluded. (#68) */
const BUILTIN_CONTAINERS = new Set([
    'Array', 'ReadonlyArray', 'Map', 'ReadonlyMap', 'WeakMap', 'Set', 'ReadonlySet', 'WeakSet', 'Promise',
])
function isBuiltinContainer(type, checker) {
    if (checker.isArrayType?.(type)) return true
    const s = (type.getSymbol && type.getSymbol()) || type.symbol
    return !!(s && BUILTIN_CONTAINERS.has(s.getName()) && isLibraryType(type))
}

/** A VENDOR library type: declared in a dependency package the library gate blocks, but
 *  NOT a platform surface (lib.*, @types/react, typescript, csstype — those have dedicated
 *  handling). Since isLibraryType's denylist is what blocks, this is EFFECTIVELY an
 *  allowlist of @floating-ui and styled-components today (every other node_modules
 *  package already passes the first record gate). Vendor records that extract perfectly
 *  may pass via `trialVendorRecord` (#39: @floating-ui's `Rect`, `VirtualElement` —
 *  small, stable, CONSUMER-CONSTRUCTED shapes that an opaque sink could not serve). */
function isVendorLibType(type) {
    const sym = type.aliasSymbol || (type.getSymbol && type.getSymbol()) || type.symbol
    const decl = sym && sym.getDeclarations && sym.getDeclarations()[0]
    const file = (decl && decl.getSourceFile().fileName) || ''
    return /node_modules\//.test(file) &&
        !/node_modules\/(@types|typescript|csstype)\//.test(file) &&
        !/\/lib\.(dom|es|scripthost)/.test(file)
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

/** ReScript pervasive type constructors a generated type must never shadow. An upstream
 *  interface named `Array`/`Option`/… would lower to `array`/`option` and, emitted bare,
 *  shadow the builtin within its module — so `array<string>` then fails to compile ("the
 *  type array is not generic"). `uniqueName` suffixes these exactly like a name collision. */
const RESERVED_TYPE_NAMES = new Set([
    'array', 'option', 'list', 'string', 'int', 'float', 'bool', 'char', 'bytes',
    'unit', 'result', 'dict', 'promise', 'lazy_t', 'exn', 'ref',
])

/** A globally-unique ReScript type name (suffix on collision) so two domains that
 *  merge into one module via SCC never clash — and never a pervasive builtin name.
 *  With every anonymous base path-anchored (#90/#96), the numeric suffix is a LAST RESORT
 *  (same-name distinct library types, or distinct shapes at one path); each hit is recorded
 *  on `shared.counterHits` so the CLI can surface it — a counter firing means a name that
 *  can renumber across versions, a stability smell worth seeing, not business as usual. */
function uniqueName(base, shared) {
    let n = base, i = 2
    while (shared.names.has(n) || RESERVED_TYPE_NAMES.has(n)) n = base + i++
    if (n !== base && !RESERVED_TYPE_NAMES.has(base)) (shared.counterHits || (shared.counterHits = [])).push(n)
    shared.names.add(n)
    return n
}

/** A short, deterministic, version-stable content token (base36) — the LAST-resort disambiguator
 *  for two distinct shapes sharing a base AND a home. Unlike an encounter-order counter it is a
 *  pure function of the shape, so adding/removing a sibling never renumbers it. (#90 residual) */
export function shapeHash(sig) {
    let h = 2166136261 >>> 0 // FNV-1a
    for (let i = 0; i < sig.length; i++) { h ^= sig.charCodeAt(i); h = Math.imul(h, 16777619) >>> 0 }
    return h.toString(36).slice(0, 5)
}

/** Kinds whose names are stabilized (a shared base = a shape/name that must not renumber). */
const STABILIZE_KINDS = new Set(['record', 'enum', 'unboxed', 'opaque'])

/** Canonical per-shape signature used both to detect a genuine collision and to seed the hash
 *  fallback — reuses `recordSig` for records (identical to the dedup key, so post-dedup distinct
 *  entries always differ) and the member set for enum/unboxed/opaque. */
function entrySig(e) {
    if (e.kind === 'record') return recordSig(e)
    // tparams MUST be part of the signature: a generic `portalStyle<'a>` and a non-generic
    // `portalStyle` @unboxed are NOT the same shape — merging them applies `<'a>` to a
    // non-generic type (compile break).
    const tp = 'tp:' + ((e.tparams || []).join(',')) + '|'
    if (e.members) return e.kind + ':' + tp + e.members.map((m) => (m.ctor || '') + (m.as !== undefined ? '=' + m.as : '') + (m.type ? ':' + typeSig(m.type) : '')).join(',')
    return e.kind + ':' + tp + (e.name || '')
}

/**
 * A PURELY STRUCTURAL signature of a shared entry, for #90's stable-name hash — like `entrySig`,
 * but a `typeRef` to another entry recurses into THAT entry's SHAPE instead of encoding its
 * `type.id`-based key. `entrySig`/`recordSig` fold `type.id` into the sig (via ref keys), and
 * `type.id` is assigned in checker encounter order, so an unrelated upstream edit OR a compiler
 * version bump renumbers it and the "stable" hash churns (`fooConfig3` → `fooConfig`). This
 * bottoms out on structure only, so identical shapes hash identically across versions/edits.
 * Cycle- and diamond-safe via an add-only `seen` set: a re-encountered entry emits `Rcyc`, so each
 * entry is expanded at most once per call (linear, no exponential blow-up on deep DAGs). Used
 * ONLY for the hash suffix — dedup and the merge keep the id-based `entrySig` (correct within a run).
 */
function structuralTypeSig(t, shared, seen) {
    if (!t || typeof t !== 'object') return JSON.stringify(t)
    if (t.kind === 'typeRef') {
        const tp = t.tparams ? '<' + t.tparams.join(',') + '>' : ''
        const re = t.key && shared.byKey.get(t.key)
        if (!re) return 'R(' + (t.to || '?') + ')' // unresolved (rare): fall back to the name
        // Include the referenced entry's anchor BASE (stable — path/named-type/discriminant derived,
        // NOT counter-suffixed, NOT id-based). Two records that differ ONLY in a ref to a distinct
        // but STRUCTURALLY-IDENTICAL entry (base-ui's `rootMenuStore…` vs `triggerMenuStore…`, both
        // broken→opaque) would otherwise hash alike and collide onto an order-dependent counter —
        // a narrower slice of the very churn #90 kills. The base distinguishes them stably. (#90 rev)
        const b = re.base || re.name || ''
        if (seen.has(re.key)) return 'Rcyc:' + b + tp
        return 'R:' + b + '{' + structuralSig(re, shared, seen) + '}' + tp
    }
    switch (t.kind) {
        case 'array': return 'A[' + structuralTypeSig(t.of, shared, seen) + ']'
        case 'tuple': return 'T[' + (t.params || []).map((x) => structuralTypeSig(x, shared, seen)).join(',') + ']'
        case 'nullable': return 'N[' + structuralTypeSig(t.of, shared, seen) + ']'
        case 'dict': return 'D[' + structuralTypeSig(t.of, shared, seen) + ']'
        case 'map': return 'M[' + structuralTypeSig(t.mapKey, shared, seen) + ',' + structuralTypeSig(t.mapVal, shared, seen) + ']'
        case 'set': return 'S[' + structuralTypeSig(t.of, shared, seen) + ']'
        case 'promise': return 'P[' + structuralTypeSig(t.of, shared, seen) + ']'
        case 'callback': return 'F(' + (t.params || []).map((x) => structuralTypeSig(x, shared, seen)).join(',') + ')=>' + structuralTypeSig(t.ret || { kind: 'unit' }, shared, seen)
        // Broken/opaque fields all EMIT `string`, but two records distinguishable ONLY through them
        // must still hash apart (else collision → order-dependent counter). The original TS type
        // text is stable (source-declared, not id/order-based), so a bounded slice discriminates
        // them without instability. (typeSig collapses these to 'opaque' — correct for DEDUP, not
        // for the stable-name hash.) (#90 rev)
        case 'opaque':
        case 'review':
        case 'unknown':
        case 'any': return t.kind + '(' + String(t.text || '').replace(/\s+/g, '').slice(0, 48) + ')'
        default: return typeSig(t) // scalars / event / raw / typeVar / classRef(home.name) — already id-free
    }
}
export function structuralSig(e, shared, seen = new Set()) {
    seen.add(e.key)
    const enc = (t) => structuralTypeSig(t, shared, seen)
    if (e.kind === 'record') {
        return 'rec:sp' + (e.spread || '') + '|tp' + ((e.tparams || []).join(',')) + '|' +
            e.fields.map((f) => f.name + (f.optional ? '?' : '') + ':' + enc(f.type)).join(';')
    }
    if (e.members) return e.kind + ':tp' + ((e.tparams || []).join(',')) + '|' + e.members.map((m) => (m.ctor || '') + (m.as !== undefined ? '=' + m.as : '') + (m.type ? ':' + enc(m.type) : '')).join(',')
    return e.kind + ':' + (e.base || '')
}

/** FINALIZATION pass (#90 residual): reassign names so a base shared by ≥2 DISTINCT shapes gets a
 *  per-shape INTRINSIC suffix instead of an encounter-order counter. A base used by ONE shape keeps
 *  its bare name — so non-colliding names (base-ui's `baseUIEvent`, already deduped to one entry)
 *  are untouched. Suffix priority: the HOME stem when it uniquely distinguishes every collider and
 *  the base isn't already home-prefixed (readable + stable: `variantTokenSingleSelectV2` /
 *  `…MenuV2`); otherwise a content hash of the shape (stable, order-independent). Runs after all
 *  entries + dedup, so the colliding set is known and the assignment is order-independent. Returns
 *  the count renamed (drives the ref-name resync). */
function stabilizeNames(shared) {
    const groups = new Map()
    for (const e of shared.entries) {
        if (!e.base || !STABILIZE_KINDS.has(e.kind)) continue
        if (!groups.has(e.base)) groups.set(e.base, [])
        groups.get(e.base).push(e)
    }
    // record (home|oldName -> surviving entry) so the FINAL name is read after all renaming, then
    // resolved to a `home|oldName -> newName` map applied at emit's single resolveRef chokepoint —
    // robust against keyless refs and every ref-bearing IR shape, no IR mutation. (#90 residual)
    const rec = []
    for (const [base, group] of groups) {
        // Merge entries that became structurally IDENTICAL after post-extraction healing/tparam
        // propagation (so escaped the early per-home dedup) — else two same-home identical shapes
        // hash alike and reintroduce a counter. Redirect the merged key to the survivor; refs to the
        // merged name resolve to the survivor's final name. Keyed by home+sig (per-home, like dedup).
        const bySig = new Map(), entries = []
        for (const e of group) {
            const s = e.home + '|' + entrySig(e)
            const canon = bySig.get(s)
            if (canon) {
                shared.byKey.set(e.key, canon)
                const i = shared.entries.indexOf(e); if (i >= 0) shared.entries.splice(i, 1)
                shared.names.delete(e.name)
                rec.push({ home: e.home, oldName: e.name, entry: canon })
            } else { bySig.set(s, e); entries.push(e) }
        }
        if (entries.length < 2) continue // single distinct shape → bare base stays (zero churn)
        // Deterministic order (#90 rev): sort colliders by their STRUCTURAL signature so the counter
        // tiebreak below (when two distinct shapes land on the same target) is order-INDEPENDENT —
        // not assigned by registration order, which an unrelated upstream edit can permute. Memoized
        // (the sig is reused for the hash). Two entries with an identical structuralSig sort equal —
        // a vanishingly narrow residual (identical base + fields + referenced shapes + broken-field
        // text) noted in TYPE_MAPPING; everything genuinely distinct now orders stably.
        const sigOf = new Map(entries.map((e) => [e, structuralSig(e, shared)]))
        entries.sort((a, b) => (sigOf.get(a) < sigOf.get(b) ? -1 : sigOf.get(a) > sigOf.get(b) ? 1 : 0))
        const homeStem = (e) => lower((e.home || '').replace(/Types$/, ''))
        const stems = entries.map(homeStem)
        // home stem disambiguates when every collider has a DISTINCT home. The doubling check is
        // PER-ENTRY (#115 pkg): an entry whose base already carries ITS OWN stem stays bare (avoids
        // `menuV2MenuV2…`), but a COLLIDER's coincidental stem prefix must NOT suppress the others'
        // suffixes — the old global guard hashed `selectMenuGroupType` (Select vs SingleSelect) just
        // because the base starts with `select`. Now Select→`selectMenuGroupType`,
        // SingleSelect→`selectMenuGroupTypeSingleSelect` (semantic, hash-free, stable).
        const homeUnique = new Set(stems.filter(Boolean)).size === entries.length
        for (const e of entries) {
            const stem = homeStem(e)
            const ownPrefixed = homeUnique && stem && base.startsWith(stem)
            const target = ownPrefixed ? base : base + (homeUnique ? pascal(stem) : pascal(shapeHash(sigOf.get(e)))) // #90: id-FREE structural hash so identical shapes get identical names across compiler versions / unrelated edits
            let cand = target, i = 2
            while (shared.names.has(cand) && cand !== e.name) cand = target + (i++)
            if (cand !== e.name) {
                const old = e.name
                shared.names.delete(old)
                shared.names.add(cand)
                e.name = cand
                rec.push({ home: e.home, oldName: old, entry: e })
            }
        }
    }
    const renames = new Map()
    for (const { home, oldName, entry } of rec) renames.set(home + '|' + oldName, entry.name)
    shared.renames = renames
    return renames.size
}

/** Run `fn` with `seg` pushed onto the property-path stack, so an anonymous record
 *  reached underneath is named after WHERE it lives (home + field chain) rather than a
 *  bare field name disambiguated by a global encounter-order counter. That counter made a
 *  byte-identical shape's name (`fooConfig` vs `fooConfig2`/`fooConfig3`) depend on which
 *  unrelated sibling shapes happened to register first, so an unrelated upstream edit
 *  renumbered it and broke downstream consumers. The path is intrinsic to the shape's
 *  location, so the name is stable across versions. (#90) */
function withPath(ctx, seg, fn) {
    if (!ctx.path) ctx.path = []
    ctx.path.push(seg)
    try { return fn() } finally { ctx.path.pop() }
}

/** Stable base name for an ANONYMOUS generated type — the home module's stem + the property
 *  path that reaches it (`dataTableColumnsAvatarColor`), generalizing #90's record recipe to
 *  EVERY naming site (#96). A bare prop-derived base (`color`) collided across siblings into a
 *  registration-order counter (`color2`/`color3`) that renumbered unchanged types whenever
 *  anything upstream — or the generator itself — changed what registers first (blend-rescript#106).
 *  The path is intrinsic to where the type lives, so the name survives unrelated changes.
 *  Library-NAMED types never come here (follow-the-library, #62). `type` may be null (skips the
 *  home lookup — e.g. the CommonTypes literal-open variants). `pascal()` the result for MODULE names. */
function stableAnonBase(ctx, type, propName) {
    const segs = (ctx.path && ctx.path.length ? ctx.path : [propName]).map(pascal).join('')
    const home = (type && ctx.shared) ? homeOf(type, ctx).replace(/Types$/, '') : ''
    return lower(home + segs)
}

/** Conventional discriminant property names, tried first when anchoring a discriminated
 *  union's arm to its own tag (#90). */
const DISCRIMINANT_NAMES = ['type', 'kind', 'variant', 'tag', 'mode', 'status', 'discriminator']

/** The discriminant VALUE of a union arm — the literal tag that tells it apart from its
 *  siblings (`type: ColumnType.TEXT` -> `"TEXT"`). Used as a path segment so each arm of a
 *  discriminated union (e.g. blend's `ColumnDefinition<T>`, 10 arms all at prop `columns`) is
 *  named after ITS tag — `dataTableColumnsTextConfig`, `…NumberConfig`, … — instead of a
 *  registration-order counter (`…Config2`/`…Config10`) that renumbers when an arm is added or
 *  removed. The tag is intrinsic to the arm, so the name is stable. Returns null when no single
 *  literal-typed property identifies the arm (then the arm keeps its path-only name). */
function discriminantSeg(type, ctx) {
    if (!type || !type.getProperties) return null
    const { checker } = ctx
    const litVal = (p) => {
        const d = p.valueDeclaration || (p.declarations && p.declarations[0]) || ctx.decl
        let pt; try { pt = checker.getTypeOfSymbolAtLocation(p, d) } catch { return null }
        if (!pt) return null
        if (pt.flags & ts.TypeFlags.EnumLiteral) return pt.symbol && pt.symbol.getName() // ColumnType.TEXT -> "TEXT"
        if (pt.isStringLiteral && pt.isStringLiteral()) return String(pt.value)
        return null
    }
    // SCREAMING_SNAKE enum members (`TEXT`, `DATE_RANGE`) -> lowercase so `pascal` Title-cases
    // them (`Text`, `DateRange`); mixed-case string literals are left as-is.
    const norm = (v) => (/^[A-Z0-9_]+$/.test(v) ? v.toLowerCase() : v)
    const props = type.getProperties()
    for (const name of DISCRIMINANT_NAMES) {        // a conventional discriminant first
        const p = props.find((x) => x.getName() === name)
        if (p) { const v = litVal(p); if (v) return norm(v) }
    }
    for (const p of props) { const v = litVal(p); if (v) return norm(v) } // else any literal-tagged prop
    return null
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
    if (t.thisArg) collectRefKeys(t.thisArg, out)
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
    if (t.thisArg) collectTypeVars(t.thisArg, out)
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
function makeProgram(entryFile, augment = []) {
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
    // `--augment <module>`: add each augmenting module's `.d.ts` as a program root so TypeScript's
    // declaration MERGING surfaces its `declare module "…" { interface X {…} }` additions on the base
    // interface. These files (e.g. `highcharts/modules/xrange` adding `Point.x2`) are opt-in
    // side-effect imports the entry `.d.ts` deliberately omits, so they're never in the import graph;
    // rooting them explicitly is the faithful equivalent of the app's `import "highcharts/modules/xrange"`.
    const roots = [entryFile]
    if (augment.length) {
        const host = ts.createCompilerHost(options)
        for (const spec of augment) {
            const r = ts.resolveModuleName(spec, entryFile, options, host)
            const f = r.resolvedModule && r.resolvedModule.resolvedFileName
            if (f) roots.push(f)
            else console.error(`[bindgen] --augment: could not resolve "${spec}" from ${entryFile}`)
        }
    }
    return ts.createProgram(roots, options)
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
 * A TypeScript branded primitive is an intersection such as
 * `string & {readonly __brand: "user"}`. The object arm is compile-time-only:
 * the runtime value is still the primitive, so treating the checker's flattened
 * properties as a record invents an object that does not exist.
 *
 * Return the primitive payload IR only when every non-primitive arm is a
 * non-callable marker object and at least one marker property exists. The
 * property requirement deliberately excludes the `(string & {})` autocomplete
 * escape used in open literal unions; that form is not a nominal brand.
 */
function brandedPrimitivePayload(type) {
    if (!(type.flags & ts.TypeFlags.Intersection)) return null
    let primitive = null
    let markerFields = 0
    for (const part of type.types || []) {
        let kind = null
        if (part.flags & ts.TypeFlags.String) kind = 'string'
        else if (part.flags & ts.TypeFlags.Number) kind = 'number'
        else if (part.flags & ts.TypeFlags.BigInt) kind = 'bigint'
        else if (part.flags & ts.TypeFlags.Boolean) kind = 'boolean'
        if (kind) {
            if (primitive && primitive !== kind) return null
            primitive = kind
            continue
        }
        if (!(part.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)) ||
            (part.getCallSignatures && part.getCallSignatures().length)) return null
        markerFields += part.getProperties ? part.getProperties().length : 0
    }
    if (!primitive || markerFields === 0) return null
    // A TS `number` has one runtime representation; force the existing @unboxed
    // payload convention (`float`) instead of applying a field-name int heuristic.
    return primitive === 'number' ? { kind: 'number', _float: true } : { kind: primitive }
}

/** Register a branded primitive as a nominal, single-constructor `@unboxed`
 * variant. ReScript keeps the aliases distinct statically while erasing the
 * constructor at runtime, so JS still receives the original primitive. */
function brandedPrimitiveNode(type, ctx, propName) {
    const payload = brandedPrimitivePayload(type)
    if (!payload || isCssType(type)) return null
    const alias = type.aliasSymbol && type.aliasSymbol.getName()
    const base = alias && alias !== '__type'
        ? lower(alias)
        : stableAnonBase(ctx, type, propName)
    const members = [{ ctor: pascal(alias || base), type: payload }]
    if (ctx.shared) return registerNamed(ctx, type, 'unboxed', base, { members, _brand: true })
    if (!ctx.seenUnboxed.has(base)) {
        ctx.seenUnboxed.set(base, true)
        ctx.unboxed.push({ name: base, members, _brand: true })
    }
    return { kind: 'typeRef', to: base, _unboxed: true }
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
 * Ensure variant constructor names are UNIQUE within one enum/variant. Two literals can
 * pascal-case to the same constructor — most often a case-only pair like `'a'`/`'A'`
 * (both -> `A`), or `'x-y'`/`'x_y'`. ReScript rejects duplicate constructors in a type
 * ("Two constructors are named A"). The `@as` arm preserves the real runtime value, so a
 * numeric suffix on later collisions is purely cosmetic and always safe. (#33 — surfaced
 * by the heal recovering Highcharts' `'a'|…|'A'|…` svgPathCommand.)
 * @param {Array<{ctor:string}>} members  mutated in place; returned for chaining
 */
function dedupeCtors(members) {
    const seen = new Set()
    for (const m of members) {
        if (!m.ctor) continue
        let c = m.ctor, i = 2
        while (seen.has(c)) c = m.ctor + i++
        m.ctor = c
        seen.add(c)
    }
    return members
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
        // A React FC takes 0 or 1 (props) arg. A multi-arg callable is a plain function —
        // binding it as a component silently drops every arg past the first (#63 C4:
        // `renderVariantFallbackValue(tokens, variant)` lost `variant`).
        const params = sig.getParameters()
        if (params.length > 1) continue
        // The single arg must be a props bag, not a PRIMITIVE (`(s: string) => …` is a fn). Only
        // reject clearly-primitive params — object / intersection (`A & B`) / union / generic
        // props are all valid component shapes, so a blanket `!Object` check would over-reject.
        if (params.length === 1) {
            const d = params[0].valueDeclaration || (params[0].declarations && params[0].declarations[0])
            const pt = d && checker.getTypeOfSymbolAtLocation(params[0], d)
            const PRIM = ts.TypeFlags.StringLike | ts.TypeFlags.NumberLike | ts.TypeFlags.BooleanLike |
                ts.TypeFlags.BigIntLike | ts.TypeFlags.ESSymbolLike | ts.TypeFlags.Null |
                ts.TypeFlags.Undefined | ts.TypeFlags.Void
            if (pt && (pt.flags & PRIM)) continue
        }
        const ret = sig.getReturnType()
        const rs = checker.typeToString(ret)
        // The return must BE a React element, not merely CONTAIN one: a tuple `[ReactNode?]` or
        // array `ReactNode[]` is a data-returning util, not a component (#63 C4: `getItemSlots`).
        if (/^(readonly )?\[/.test(rs) || /\[\]$/.test(rs) || /^(Readonly)?Array</.test(rs)) continue
        const rn = typeName(ret) || rs
        if (/Element|ReactNode|ReactElement|JSX/.test(rn)) return true
    }
    return false
}

/**
 * A React CLASS component (#101): `class Slider extends React.Component<Props>`. Its export type
 * has CONSTRUCT signatures, not call signatures, so `isReactComponent` (call-sig based) misses it
 * and it binds as an unusable `@new`/`@send` module (`make: unit => t`, `@send render`). React
 * renders a class component identically to an FC in JSX, so it should bind `@react.component
 * external make` from its Props. Returns the props type node (`P` in `Component<P>`, or the
 * constructor's first param when a `render(): ReactElement` is present) + the class's type params,
 * or null for a non-React class (which keeps the `@new`/`@send` path). Syntactic heritage match
 * (like `detectAttrsBase`), so self-contained golden stubs behave like real `@types/react`.
 * @returns {{propsNode: ts.TypeNode, typeParams: ts.NodeArray|[]} | null}
 */
const _reactClassPropsCache = new WeakMap() // #101: computed once per class symbol (pre-pass + main loop both ask)
function reactClassComponentProps(sym, checker) {
    if (_reactClassPropsCache.has(sym)) return _reactClassPropsCache.get(sym)
    const result = computeReactClassComponentProps(sym, checker)
    _reactClassPropsCache.set(sym, result)
    return result
}
function computeReactClassComponentProps(sym, checker) {
    const decl = (sym.declarations || []).find((d) => ts.isClassDeclaration(d) || ts.isInterfaceDeclaration(d))
    if (!decl) return null
    const typeParams = decl.typeParameters || []
    // A real React class component ALWAYS extends (Pure)Component. Require that heritage — a
    // `render()` method alone is NOT sufficient: canvas/chart/D3 renderers and custom-element
    // wrappers have `render(): HTMLElement/SVGElement` + a constructor but are NOT React components.
    // Firing on render() alone would reintroduce the exact silently-wrong output #101 eliminates. (rev)
    let extendsComponent = false
    for (const h of decl.heritageClauses || []) {
        if (h.token !== ts.SyntaxKind.ExtendsKeyword) continue
        for (const t of h.types) {
            const base = t.expression.getText().replace(/^React\./, '')
            if (/^(Pure)?Component$/.test(base)) {
                extendsComponent = true
                if (t.typeArguments && t.typeArguments[0]) return { propsNode: t.typeArguments[0], typeParams } // Component<P> — props are P
            }
        }
    }
    if (!extendsComponent) return null
    // `extends Component` with no (or `{}`) type arg → it IS a React component; props come from the
    // constructor's first param when present (else it's a no-props component and is skipped upstream).
    const ctor = (decl.members || []).find((m) => ts.isConstructorDeclaration(m))
    const p0 = ctor && ctor.parameters && ctor.parameters[0]
    if (p0 && p0.type) return { propsNode: p0.type, typeParams }
    return null
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

// React / third-party WRAPPER type names that must never become a shared-base spread (#82):
// on a real package these are vendor-declared (path-excluded), but self-contained fixtures
// stub them locally — the name keeps fixture behavior identical to real-package behavior.
const VENDOR_WRAPPER_NAMES = new Set(['RefAttributes', 'ClassAttributes', 'Attributes', 'PropsWithChildren', 'PropsWithRef', 'PropsWithoutRef', 'ExecutionProps', 'ThemeProps'])

/**
 * Detect a component-props HTML-attributes base (issue #16): an intersection part or
 * heritage `extends` whose interface NAME is one of the vendored attribute groups
 * (`ButtonHTMLAttributes`, …), optionally wrapped in `Omit` (keys recorded) or
 * `Partial` (a no-op — every attribute field is optional anyway). Name-based, so
 * self-contained golden stubs work exactly like the real @types/react.
 *
 * The walk is TRANSITIVE (#130): blend's `Omit<BlockProps, 'children'>` where
 * `BlockProps = StyledBlockProps & Omit<React.HTMLAttributes<HTMLElement>, 'as'|'color'> & {…}`
 * reaches the attrs surface only through a package-local ALIAS-of-intersection and nested
 * `Omit` wrappers — the recursion accumulates every layer's omit keys and still finds the leaf.
 * Heritage names strip a `React.` qualifier, and non-vendored heritage interfaces recurse too.
 *
 * Along the way it collects `bases` (#82): PURE package-local NAMED parts (an alias/interface
 * whose flattened properties carry no vendor declarations — blend's `StyledBlockProps` ~95 CSS
 * fields, `BaseSkeletonProps`). buildComponentIR turns each into a shared-record SPREAD instead
 * of inlining its fields, when it can prove that's collision-free.
 *
 * @returns {{leaf: string|null, omitKeys: string[], bases: ts.Type[]} | null}
 *          null -> a BLOCKED surface or unanalyzable Omit; caller uses legacy labeled args
 */
function detectAttrsBase(propsType, checker) {
    const leaves = []
    const omitKeys = []
    const bases = []
    const seenBase = new Set()
    let blocked = false
    const isPureLocal = (t) => {
        // a named part is a shared-base candidate only when NONE of its flattened props is
        // vendor-declared — then spreading it can never overlap the HtmlAttrs chain's decls.
        // "Vendor" is BOTH path-based (real @types/react, styled-components, …: isVendorDecl)
        // and NAME-based (TS_NAME_TO_GROUP + the wrapper set below — self-contained golden
        // stubs declare these locally, and fixtures must behave exactly like real packages),
        // the same duality coveredBySpread relies on. An impure part (blend's BlockProps)
        // descends instead, so its attrs portion still becomes the HtmlAttrs leaf.
        const props = checker.getPropertiesOfType(t) || []
        if (!props.length) return false
        return props.every((p) => (p.declarations || []).length > 0 && (p.declarations || []).every((d) => {
            if (isVendorDecl(d)) return false
            const parent = d.parent
            return !(parent && ts.isInterfaceDeclaration(parent) && TS_NAME_TO_GROUP.has(parent.name.text))
        }))
    }
    const visit = (part, depth, inIntersection) => {
        if (blocked || depth > 6) return
        const aliasName = part.aliasSymbol && part.aliasSymbol.getName()
        let core = part
        if (aliasName === 'Omit' || aliasName === 'Partial') {
            const args = part.aliasTypeArguments || []
            core = args[0] || part
            if (aliasName === 'Omit') {
                const keys = args[1]
                for (const k of keys ? (keys.isUnion() ? keys.types : [keys]) : []) {
                    if (k.isStringLiteral()) omitKeys.push(k.value)
                    else { blocked = true; return } // computed/non-literal Omit keys -> legacy
                }
            }
        }
        const coreSym = core.aliasSymbol || core.getSymbol?.()
        const coreName = coreSym && coreSym.getName()
        if (coreName && BLOCKED_ATTRS.has(coreName)) { blocked = true; return }
        if (coreName && TS_NAME_TO_GROUP.has(coreName)) { leaves.push(TS_NAME_TO_GROUP.get(coreName)); return }
        // A pure package-local NAMED part is a shared-base candidate — spread whole, no descent.
        // Only as a member of some intersection: a component whose props are ONE named alias
        // keeps today's inline record (a spread-only `props` adds indirection for no dedup win).
        // Known REACT/vendor WRAPPER names never qualify (fixtures stub them locally, but on a
        // real package they're vendor-declared and must behave identically): `RefAttributes`
        // carries the reserved `ref` the #98 synthesis owns; `ExecutionProps` is styled-components'.
        if (inIntersection && coreName && coreName !== '__type' && !(coreSym.flags & ts.SymbolFlags.TypeParameter)
            && !VENDOR_WRAPPER_NAMES.has(coreName) && isPureLocal(core)) {
            if (core.id != null && !seenBase.has(core.id)) { seenBase.add(core.id); bases.push(core) }
            return
        }
        // Impure named part over an intersection (blend's BlockProps): descend into its parts.
        // TypeScript NORMALIZES nested intersections into one flat `.types` list, dissolving
        // intermediate aliases (`StyledBlockProps = StateStyles & {…}` disappears into its
        // members) — so prefer the SYNTACTIC members of the alias declaration, where each type
        // reference resolves with its aliasSymbol intact and can become a base candidate.
        if (core.flags & ts.TypeFlags.Intersection) {
            const aliasDecl = core.aliasSymbol && (core.aliasSymbol.declarations || []).find((d) => ts.isTypeAliasDeclaration(d) && d.type && ts.isIntersectionTypeNode(d.type))
            if (aliasDecl) {
                for (const m of aliasDecl.type.types) {
                    try { visit(checker.getTypeFromTypeNode(m), depth + 1, true) } catch { /* unresolvable member: its fields inline via the normal flatten */ }
                }
                return
            }
            for (const t of core.types) visit(t, depth + 1, true)
            return
        }
        // own interface `extends …` (heritage instead of `&`): vendored base -> leaf; a
        // package-local base recurses (its own heritage may reach the vendored surface).
        const ifaceDecl = coreSym && (coreSym.declarations || []).find((d) => ts.isInterfaceDeclaration(d))
        if (ifaceDecl) for (const h of ifaceDecl.heritageClauses || []) for (const t of h.types) {
            const base = t.expression.getText().replace(/^React\./, '')
            if (BLOCKED_ATTRS.has(base)) { blocked = true; return }
            if (TS_NAME_TO_GROUP.has(base)) { leaves.push(TS_NAME_TO_GROUP.get(base)); continue }
            try {
                const hs = checker.getSymbolAtLocation(t.expression)
                const hr = hs && ((hs.flags & ts.SymbolFlags.Alias) ? checker.getAliasedSymbol(hs) : hs)
                if (hr && hr.declarations && hr.declarations.some((d) => ts.isInterfaceDeclaration(d))) visit(checker.getDeclaredTypeOfSymbol(hr), depth + 1, inIntersection)
            } catch { /* unresolvable heritage: skip */ }
        }
    }
    visit(propsType, 0, false)
    if (blocked) return null
    if (!leaves.length) return (bases.length ? { leaf: null, omitKeys, bases } : null)
    // Deepest chain wins (field-count is the depth proxy); a second base must be fully
    // contained in the winner's chain (Button extends HTML — fine), else -> legacy.
    leaves.sort((a, b) => chainFields(b).size - chainFields(a).size)
    const leaf = leaves[0]
    for (const other of leaves.slice(1)) {
        for (const f of chainFields(other)) if (!chainFields(leaf).has(f)) return null
    }
    return { leaf, omitKeys, bases }
}

/** `Omit<X, K>` → `{ base: X, omit: Set<string> }` (K's string-literal members), else null.
 *  Recovers named props that TypeScript collapses when `Omit` is applied over a type carrying a
 *  string index signature (`[key: string]: any`): the index sig swallows every named property, so
 *  `Omit<{ [k:string]: any; options?: … }, "ref">` degrades to just `{ [k:string]: any }` and the
 *  real props vanish. A forwardRef component built on such props (e.g. highcharts-react's
 *  `HighchartsReactProps`, blend's `BlendChart`/`ChartV2`) then extracted ZERO props and was
 *  silently dropped as a non-component. (#92) */
function unwrapOmit(t, checker) {
    if (!(t.aliasSymbol && t.aliasSymbol.getName() === 'Omit') || !t.aliasTypeArguments || t.aliasTypeArguments.length < 2) return null
    const [base, keys] = t.aliasTypeArguments
    const omit = new Set()
    const collect = (k) => {
        if (k.isStringLiteral && k.isStringLiteral()) omit.add(String(k.value))
        else if (k.isUnion && k.isUnion()) (k.types || []).forEach(collect)
    }
    collect(keys)
    return { base, omit }
}

function buildComponentIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const compType = checker.getTypeOfSymbolAtLocation(sym, decl)

    const sigs = compType.getCallSignatures()
    // A styled-components export (`IStyledComponentBase<…> & string`) exposes TWO call signatures:
    // first the polymorphic `as`-rebinding form (`<AsTarget, ForwardedAsTarget>(…)`), whose visible
    // props are only the styling plumbing — theme/as/forwardedAs/style — as giant unresolved
    // conditionals; then the CONCRETE zero-typeparam forwardRef form carrying the component's real
    // props (the tab/checkbox props a hand-writer binds). Reading sigs[0] bound the plumbing and
    // dropped every functional prop (`children` included). Prefer the concrete signature when
    // several exist; a single-signature generic component (VirtualList<T>) is untouched. (#84)
    const sig = (sigs.length > 1 && sigs.find((s) => s.parameters.length && !(s.typeParameters || []).length)) || sigs[0]
    let propsType
    if (opts.propsType) {
        // React CLASS component (#101): props come from `Component<P>` (or the ctor param), NOT a
        // call signature — the caller resolved and passes `P` directly.
        propsType = opts.propsType
    } else if (sigs.length && sig.parameters.length) {
        propsType = checker.getTypeOfSymbolAtLocation(sig.parameters[0], decl)
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
    // A class component's type params come off the class declaration, not a call signature. (#101)
    const tparams = opts.propsType
        ? (opts.classTypeParams || []).map((tp) => checker.getTypeAtLocation(tp).symbol).filter(Boolean).map((symbol) => ({ symbol }))
        : (sigs.length && sig.typeParameters) || []
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
        if (!attrsBase || !attrsBase.leaf) return false
        const decls = p.declarations || []
        return decls.length > 0 && decls.every((d) => {
            const parent = d.parent
            return parent && ts.isInterfaceDeclaration(parent) && TS_NAME_TO_GROUP.has(parent.name.text)
        }) && chainFields(attrsBase.leaf).has(p.getName())
    }

    // Discriminated-union props — `Base & (A | B | C)` distributes to `(Base&A)|(Base&B)|(Base&C)`,
    // and `getPropertiesOfType` returns only the props common to ALL arms (Base + the shared
    // discriminant), silently DROPPING every variant-specific prop (blend's `Card` lost
    // `headerTitle`/`content`/`alignment`/`children` — unusable). Gather the arm-specific props
    // too: take the union's common props (their types are correctly merged, e.g. the `variant`
    // discriminant), then add each arm-only prop as OPTIONAL (it only applies to its variant, and
    // ReScript can't express the discriminated dependency — flatten-optional is the faithful,
    // compilable model). (#63 C2)
    let commonSyms = checker.getPropertiesOfType(propsType)
    // A string index signature (`[key: string]: any`) in the props collapses every NAMED prop
    // through `Omit<…>` (a TS quirk), so a forwardRef component reads only `ref`/`key` and gets
    // dropped as `no-props`. Recover the named props from the pre-`Omit` type (`X` in `Omit<X, K>`,
    // minus the omitted keys), so the component binds with its real surface instead of vanishing.
    // Only fires when an index signature is actually present, so normal components are untouched. (#92)
    if (checker.getIndexInfoOfType?.(propsType, ts.IndexKind.String)) {
        const byName = new Map(commonSyms.map((s) => [s.getName(), s]))
        const before = byName.size
        // The collapse compounds through EVERY `Omit` layer: `Omit<Omit<Poisoned, K2> & Extra, K1>`
        // loses the whole `Poisoned` side, because the unwrapped base is itself still
        // index-signature-poisoned (blend's `ChartV2` lost all 8 `HighchartsReactProps` members
        // this way, #98). Descend recursively: unwrap each `Omit` (accumulating its keys), split
        // intersections that still carry the index signature, and read properties only off leaves —
        // where no mapped type has been applied, so the named members are intact.
        const visit = (t, omitAcc, depth) => {
            if (depth > 8) return
            const u = unwrapOmit(t, checker)
            if (u) return visit(u.base, new Set([...omitAcc, ...u.omit]), depth + 1)
            if ((t.flags & ts.TypeFlags.Intersection) && checker.getIndexInfoOfType?.(t, ts.IndexKind.String)) {
                for (const arm of t.types) visit(arm, omitAcc, depth + 1)
                return
            }
            for (const p of checker.getPropertiesOfType(t))
                if (!omitAcc.has(p.getName()) && !byName.has(p.getName())) byName.set(p.getName(), p)
        }
        const arms = (propsType.flags & ts.TypeFlags.Intersection) ? propsType.types : [propsType]
        for (const arm of arms) if (unwrapOmit(arm, checker)) visit(arm, new Set(), 0)
        if (byName.size > before) commonSyms = [...byName.values()]
    }
    const unionOptional = new Set()
    let propSyms = commonSyms
    if (propsType.isUnion && propsType.isUnion()) {
        const commonNames = new Set(commonSyms.map((p) => p.getName()))
        const extra = []
        const seen = new Set()
        for (const arm of propsType.types) {
            for (const p of checker.getPropertiesOfType(arm)) {
                const nm = p.getName()
                if (commonNames.has(nm) || seen.has(nm)) continue
                seen.add(nm); extra.push(p); unionOptional.add(nm)
            }
        }
        propSyms = [...commonSyms, ...extra]
    }

    // Shared-base spreads (#82): a pure package-local NAMED part (blend's StyledBlockProps —
    // the ~95-field Block CSS surface — or BaseSkeletonProps) becomes ONE shared record spread
    // (`...BlendTypes.styledBlockProps`) instead of inlining its fields into every component.
    // A base spreads ONLY when provably collision-free (ReScript record spreads hard-error on
    // duplicate labels):
    //   (a) UNSHADOWED — every base field's flattened prop resolves to the base's OWN property
    //       DECLARATIONS. Symbol identity is NOT enough: an `Omit<>` wrapper (blend's
    //       `Omit<BlockProps, 'children'>`) synthesizes fresh mapped symbols, but they keep the
    //       original declaration nodes — while a component-level redeclaration adds a declaration
    //       OUTSIDE the base, breaking containment exactly when it must. This also proves no
    //       `Omit` key stripped a base field: a stripped field never reaches the flattened props
    //       (and a same-named survivor from ANOTHER part fails the containment);
    //   (b) no ReScript-id collision with the component's remaining own props or another base.
    // Anything failing a gate silently falls back to today's inline flattening.
    const baseCandidates = (attrsBase && attrsBase.bases) || []
    const spreadBases = []
    if (baseCandidates.length) {
        const flatByName = new Map(propSyms.map((p) => [p.getName(), p]))
        for (const bt of baseCandidates) {
            const fields = checker.getPropertiesOfType(bt) || []
            const declsOf = (s) => s.declarations || []
            const baseDecls = new Set(fields.flatMap(declsOf))
            const coveredFlat = (f) => {
                const pf = flatByName.get(f.getName())
                return !!pf && declsOf(pf).length > 0 && declsOf(pf).every((d) => baseDecls.has(d))
            }
            const usable = fields.length > 0 && fields.every(coveredFlat) // (a) containment: unshadowed
            // `flat` keeps the FLATTENED symbols (the Omit-mapped ones) — ownership filtering on
            // propSyms must use these, not the base's originals, or the fields inline AND spread.
            if (usable) spreadBases.push({ type: bt, fields, flat: fields.map((f) => flatByName.get(f.getName())), ids: new Set(fields.map((f) => label(f.getName()).id)) })
        }
        // (c) id-level fixpoint: a base colliding with the inline surface (or a dropped base's
        // returned fields, or a prior base) drops back to inline. Drops only grow the inline
        // id set, so iterate to stability.
        const baseOwnedSyms = () => new Set(spreadBases.flatMap((b) => b.flat))
        let stable = false
        while (!stable) {
            stable = true
            const owned = baseOwnedSyms()
            const inlineIds = new Set(propSyms
                .filter((p) => !['ref', 'key'].includes(p.getName()) && !coveredBySpread(p) && !owned.has(p))
                .filter((p) => !isInherited(p) || allow.has(p.getName()))
                .map((p) => label(p.getName()).id))
            for (let i = 0; i < spreadBases.length; i++) {
                const b = spreadBases[i]
                const priorIds = new Set(spreadBases.slice(0, i).flatMap((o) => [...o.ids]))
                if ([...b.ids].some((id) => inlineIds.has(id) || priorIds.has(id))) {
                    spreadBases.splice(i, 1); stable = false; break
                }
            }
        }
    }
    const baseOwned = new Set(spreadBases.flatMap((b) => b.flat))

    // Symbol-keyed props (`[kSecret]?: string`, #109.3) surface as TS's mangled internal name
    // (`__@kSecret@69`) — a JSX attribute that can't exist at runtime. Skip them; record the source
    // names so the emitter can leave an ⓘ note instead of emitting a broken `@as("__@…")` binding.
    const symbolProps = propSyms.filter((p) => /^__@/.test(p.getName())).map((p) => p.getName().replace(/^__@/, '').replace(/@\d+$/, ''))
    const props = propSyms
        .filter((p) => !['ref', 'key'].includes(p.getName()))
        .filter((p) => !/^__@/.test(p.getName()))
        .filter((p) => !coveredBySpread(p))
        .filter((p) => !baseOwned.has(p))
        .filter((p) => !isInherited(p) || allow.has(p.getName()))
        .map((p) => {
            const name = p.getName()
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0 || unionOptional.has(name)
            const t = checker.getTypeOfSymbolAtLocation(p, decl)
            const d = p.declarations && p.declarations[0]
            ctx.lastAnyAlias = null // each prop keys its implicit-any vars fresh (#31)
            // aria-* / role -> the exact JsxDOM type (verbatim), bypassing classify.
            // hasOwnProperty guard: a prop literally named `toString`/`valueOf`/`constructor`/…
            // would otherwise pick up an inherited Object.prototype member (a native function).
            const aria = Object.prototype.hasOwnProperty.call(ARIA_TYPES, name) ? ARIA_TYPES[name] : undefined
            // `LiteralUnion | string` (e.g. `ToastPosition | string`) collapses to bare `string` in
            // the resolved type, so recover the known literals from the SYNTACTIC node -> an @unboxed
            // variant with a `Custom(string)` catch-all (typo-safe known values + open escape hatch).
            const litOpen = !aria && d && literalUnionOpen(d.type, checker)
            // `value?: number | null` -> `Nullable.t<float>` (#34, I-5). strictNullChecks
            // is off, so `null` already collapsed in the resolved type — recover it from
            // the SYNTACTIC node, and only for a value-position primitive (passing `null`
            // = controlled-clear, distinct from omitting the prop).
            // Trust the syntactic `T | null` / `| undefined` recovery via the single FIRST-PARTY
            // property signature. A MERGED intersection property (`HTMLAttributes & { title: string }`)
            // has signatures from BOTH the own object AND an external base (`@types/react`,
            // `@radix-ui`, …) with conflicting optionality; `p.declarations[0]` may pick the inherited
            // one, which wrongly flipped required own props (`title`/`children`) to optional. The own
            // signature carries the library's intent: `title: string` (required) wins over inherited
            // `title?`, and `value: number | undefined` (UnitInput) wins over `@types/react`'s
            // `value?: string|…` so its `| undefined` -> optional. Falls back to a lone signature,
            // else defers to the symbol flag. (#63 review / #65 B1)
            const propSigs = (p.declarations || []).filter((dd) => ts.isPropertySignature(dd) && dd.type)
            const ownSigs = propSigs.filter((dd) => !isVendorDecl(dd))
            const ownDecl = ownSigs.length === 1 ? ownSigs[0] : (propSigs.length === 1 ? propSigs[0] : null)
            const nb = !aria && !litOpen && ownDecl && syntacticNullability(ownDecl.type)
            // push the prop name so a nested anonymous `{…}` under it is path-anchored (#90)
            const baseType = withPath(ctx, name, () => salvageCallbackParams(
                aria ? { kind: 'raw', res: aria }
                    : litOpen ? literalUnionOpenNode(litOpen, unionRefName(d.type), ctx, name)
                    : classify(t, ctx, name),
                ctx))
            return {
                name,
                // a syntactic `| undefined` on a REQUIRED prop means it can be omitted -> optional
                // (`=?`), distinct from `| null` (an explicit value -> Nullable.t). (#63 C5)
                optional: optional || !!(nb && nb.hasUndef) || indexedAccessOptional(ownDecl && ownDecl.type, checker),
                inherited: isInherited(p),
                type: applyNullable(baseType, nb),
                // raw TS info, used by the report to describe unmapped props
                tsType: checker.typeToString(t).replace(/\s+/g, ' ').slice(0, 200),
                declText: (d ? d.getText() : '').replace(/\s+/g, ' ').trim().slice(0, 200),
            }
        })

    // Synthesize `~ref` for a forwardRef surface (#98 follow-up): the `ref` symbol is filtered
    // from the props (React-reserved), but the JSX v4 ppx DOES accept and forward a `~ref`
    // labeled arg on an external — without it, a `RefAttributes<R>` handle (highcharts-react's
    // `HighchartsReactRefObject`) is unreachable from ReScript. The ref's payload type decides:
    // a DOM element → the generic constructable domRef; a cleanly-modelled handle →
    // `React.ref<Nullable.t<handle>>` (created with `React.useRef(Nullable.null)`). An
    // unmodellable payload is SKIPPED (flag-don't-fake) — same as today, just no longer silent.
    const refSym = propSyms.find((p) => p.getName() === 'ref')
    if (refSym && !props.some((p) => p.name === 'ref')) {
        const rt = checker.getTypeOfSymbolAtLocation(refSym, decl)
        // Syntactic gate BEFORE classifying: only a React ref family type (`Ref<R>` /
        // `RefObject<R>` — possibly behind a union with the callback form) qualifies. Classifying
        // an arbitrary `ref`-named prop here would register junk record types into the shared
        // registry even when the synthesis then declines.
        const rParts = rt.isUnion && rt.isUnion() ? rt.types : [rt]
        const refArm = rParts.find((t) => { const n = typeName(t); return n && REF_NAMES.test(n) })
        if (refArm) {
            ctx.lastAnyAlias = null
            const rNode = classify(refArm, ctx, 'ref', 0)
            if (rNode.kind === 'domRef' || (rNode.kind === 'reactRef' && !irHasImperfection(rNode))) {
                props.push({
                    name: 'ref', optional: true, inherited: false, type: rNode,
                    tsType: checker.typeToString(rt).replace(/\s+/g, ' ').slice(0, 200), declText: '',
                })
            }
        }
    }

    // `removed` = Omit keys + own props that collide with a chain field at the ReScript
    // id level (raw `children` = chain `children`, but also own `ariaLabel` vs chain
    // `aria-label` — both render to the id `ariaLabel`). The own prop always wins; the
    // base is narrowed so the spread can never produce a duplicate-field compile error.
    // A shared-base spread's fields narrow the chain the same way (blend's
    // `StyledBlockProps.color` vs the chain's `color`): the package-specific field wins.
    let attrsBaseInfo = null
    if (attrsBase && attrsBase.leaf) {
        const chain = chainFields(attrsBase.leaf)
        const idToRaw = new Map()
        for (const n of chain) idToRaw.set(label(n).id, n)
        const removed = new Set(attrsBase.omitKeys.filter((k) => chain.has(k)))
        for (const p of props) {
            const hit = idToRaw.get(label(p.name).id)
            if (hit) removed.add(hit)
        }
        for (const b of spreadBases) for (const f of b.fields) {
            const hit = idToRaw.get(label(f.getName()).id)
            if (hit) removed.add(hit)
        }
        attrsBaseInfo = { leaf: attrsBase.leaf, removed: [...removed].sort() }
    }

    // Register each surviving base in the shared registry (dedup by type.id makes every
    // consumer spread the SAME record) and keep its typeRef for emit. classify is deferred
    // to here — past every gate — so a rejected candidate never registers an orphan record.
    // Only a plain (non-generic) record ref can be spread; anything else falls back inline.
    const baseSpreads = []
    for (const b of spreadBases) {
        ctx.lastAnyAlias = null
        const ref = withPath(ctx, importName, () => classify(b.type, ctx, typeName(b.type) || importName))
        if (ref && ref.kind === 'typeRef' && !(ref.tparams && ref.tparams.length) && !irHasImperfection(ref)) {
            baseSpreads.push({ ref })
        } else {
            // fall back: re-inline this base's fields (rebuild the prop nodes it owned)
            for (const f of b.fields) {
                const name = f.getName()
                if (props.some((p) => p.name === name)) continue
                const t = checker.getTypeOfSymbolAtLocation(f, decl)
                ctx.lastAnyAlias = null
                const node = withPath(ctx, name, () => salvageCallbackParams(classify(t, ctx, name), ctx))
                props.push({
                    name, optional: (f.getFlags() & ts.SymbolFlags.Optional) !== 0, inherited: false,
                    type: node, tsType: checker.typeToString(t).replace(/\s+/g, ' ').slice(0, 200), declText: '',
                })
            }
        }
    }

    return { module: importName, import: { from, name: importName }, kind: 'react-component', enums, records, unboxed, props, attrsBase: attrsBaseInfo, baseSpreads, ...(symbolProps.length ? { symbolProps } : {}) }
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
/** A deterministic, readable ReScript-name suffix distinguishing a function overload from the first
 *  (#109.8). Params BEYOND the base overload's arity → `WithRadixAndBase`; a same-/lower-arity
 *  overload (differs by type) → `ForInput`; empty names → `Alt`. Stable — derived from param names,
 *  never encounter order. Collisions are counter-suffixed by the caller. */
function overloadSuffix(sig, baseSig) {
    const params = sig.getParameters()
    const extra = params.slice(baseSig.getParameters().length).map((p) => pascal(p.getName())).filter(Boolean)
    if (extra.length) return 'With' + extra.join('And')
    const names = params.map((p) => pascal(p.getName())).filter(Boolean)
    return names.length ? 'For' + names.join('') : 'Alt'
}

function buildFunctionIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const fnType = checker.getTypeOfSymbolAtLocation(sym, decl)
    const sig = opts.sig || fnType.getCallSignatures()[0] // #109.8: caller may pass a specific overload
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
        // anchor anonymous param/return `{…}` to the function name, so a standalone function's
        // return record is `<fn>ResultConfig` (stable) not a bare encounter-numbered name. (#90)
        path: [importName],
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
 * Build the IR for a plain exported const VALUE with no call signature — e.g. blend's
 * `declare const FOUNDATION_THEME: FoundationTokenType`. Binds as a typed
 * `@module external <name>: <type> = "<jsName>"`, reusing the shared type registry so the
 * value's type (the same `foundationTokenType` record consumed by `getButtonTokens`) is one
 * canonical type. Used only when the type models cleanly; the caller keeps an unmodellable
 * value in the skipped bucket rather than emit a bogus binding. (#105)
 * @returns {import('../types').ValueIR}
 */
function buildValueIR(checker, sym, source, importName, from, opts) {
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const type = checker.getTypeOfSymbolAtLocation(sym, decl)
    const enums = [], records = [], unboxed = []
    const ctx = {
        checker, decl, enums, records, unboxed, webapi: !!opts.webapi,
        seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map(),
        // typeVars: null — a const value has NO signature to thread a generic through, and it is
        // library-PRODUCED / consumer-RECEIVED (class-getter polarity): an `any` inside must stay a
        // flagged defect, never generalize to an output-only `'a` that unifies with anything
        // (rule #4). With no var map, `any` classifies as `{kind:'any'}` → irHasImperfection →
        // the value stays skipped. (#105)
        shared: opts.shared || null, typeVars: null,
        sourceFile: (decl && decl.getSourceFile && decl.getSourceFile().fileName) || (source && source.fileName) || null,
        path: [importName],
        produced: false,
        constValue: true,
    }
    const valueType = classify(type, ctx, importName, 0)
    return { module: importName, import: { from, name: importName }, kind: 'value', enums, records, unboxed, value: { type: valueType } }
}

/** A `React.Context<T>` value export (`import('react').Context<…>` or `React.Context<…>`).
 *  Its alias/symbol name is `Context` and it carries one type argument (the context value). */
function isReactContextType(type) {
    if (typeName(type) !== 'Context') return false
    const args = type.aliasTypeArguments || type.typeArguments || []
    return args.length === 1
}

/**
 * Build the IR for a `React.Context<T>` value export. Classifies the context value `T`
 * through the shared pipeline (so a named value record lands in its `*Types.res`), and
 * emits a VALUE binding `external <name>: React.Context.t<T> = "<jsName>"` — the honest
 * shape of a context object, not a faked `@react.component`. (#63 C6)
 */
function buildContextIR(checker, sym, source, importName, from, opts) {
    if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
    const decl = sym.valueDeclaration || (sym.declarations && sym.declarations[0]) || source
    const type = checker.getTypeOfSymbolAtLocation(sym, decl)
    const inner = (type.aliasTypeArguments || type.typeArguments || [])[0]
    const enums = []
    const records = []
    const unboxed = []
    const ctx = {
        checker, decl, enums, records, unboxed, webapi: !!opts.webapi,
        seenEnums: new Map(), seenRecords: new Map(), seenUnboxed: new Map(),
        shared: opts.shared || null,
        typeVars: new Map(),
        sourceFile: (decl && decl.getSourceFile && decl.getSourceFile().fileName) || (source && source.fileName) || null,
    }
    const ofType = inner ? classify(inner, ctx, importName) : { kind: 'unknown' }
    return {
        module: importName,
        import: { from, name: importName },
        kind: 'function',
        enums, records, unboxed,
        context: { ofType },
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
 * declaration: a `?` token or default initializer makes the arg omittable. A REST param is
 * deliberately NOT optional: `...args: T[]` means zero-or-more positional JS arguments, not one
 * optional array argument. It is tracked separately by `isRestParam` and emitted via `@variadic`.
 * @param {ts.Symbol} paramSym
 * @returns {boolean}
 */
function isOptionalParam(paramSym) {
    if (paramSym.getFlags() & ts.SymbolFlags.Optional) return true
    const d = paramSym.valueDeclaration || (paramSym.declarations && paramSym.declarations[0])
    return !!(d && ts.isParameter(d) && (d.questionToken || d.initializer))
}

/** Whether a signature parameter is declared with `...` (a variadic JS call boundary). */
function isRestParam(paramSym) {
    const d = paramSym.valueDeclaration || (paramSym.declarations && paramSym.declarations[0])
    return !!(d && ts.isParameter(d) && d.dotDotDotToken)
}

const UNSUPPORTED_REST = 'unsupported-rest-parameter: only a final homogeneous `...args: T[]` can use @variadic'

function unsupportedRestError() {
    const error = new Error(UNSUPPORTED_REST)
    error.code = 'UNSUPPORTED_REST_PARAMETER'
    return error
}

function isUnsupportedRestError(error) {
    return error && error.code === 'UNSUPPORTED_REST_PARAMETER'
}

/**
 * Classify a call signature into LABELED-ARG members: each param keeps its name +
 * optionality (class methods/constructors bind as labeled args, unlike M1's positional
 * functions, because methods lean on optional params and ReScript only allows optionals
 * when labeled). React-event params are recognised the same way functionNode does.
 * @returns {{params: Array<{name:string, optional:boolean, rest:boolean, type:object}>, ret:object}}
 */
function sigToMembers(sig, ctx, depth = 0) {
    const { checker } = ctx
    // POLARITY for a method/function the consumer CALLS (#50 review): its PARAMS are
    // consumer-supplied (input -> produced) and its RETURN is consumer-received
    // (output -> NOT produced). This is what stops an output-only `any` from being
    // generalized to an unsound `'a` — e.g. hono's `routes(): RouterRoute[]` getter,
    // whose `handler` field return would otherwise become a free `'a` that unifies with
    // anything. (functionNode flips this again for any nested callback values.)
    const prev = ctx.produced
    ctx.produced = true
    try {
        const params = sig.getParameters().map((pp) => {
            const pt = checker.getTypeOfSymbolAtLocation(pp, ctx.decl)
            const rest = isRestParam(pp)
            // `asArray` accepts Array/ReadonlyArray aliases but rejects heterogeneous tuple rests.
            // The finally below restores signature polarity when a class catches this error and
            // continues extracting sibling members.
            if (rest && !asArray(pt, checker)) throw unsupportedRestError()
            const optional = !rest && isOptionalParam(pp)
            const n = typeName(pt)
            const type = (n && Object.prototype.hasOwnProperty.call(REACT_EVENTS, n))
                ? { kind: 'event', res: REACT_EVENTS[n] }
                : withPath(ctx, pp.getName(), () => classify(pt, ctx, pp.getName(), depth + 1)) // path-anchor param `{…}` (#90)
            return { name: pp.getName(), optional, rest, type }
        })
        ctx.produced = false
        return { params, ret: returnNode(sig, ctx, depth) }
    } finally {
        ctx.produced = prev
    }
}

/** Deep-replace `typeVar` nodes named in `subst` with their substitute IR. */
function substTypeVars(node, subst) {
    if (!node || typeof node !== 'object') return node
    if (node.kind === 'typeVar' && subst[node.name]) return subst[node.name]
    const out = { ...node }
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal', 'thisArg']) if (out[k]) out[k] = substTypeVars(out[k], subst)
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

    // Constructor: first construct signature (overloads collapse to the first). An unsupported
    // tuple rest removes only `make`; the abstract class type + usable methods still emit.
    const skippedMembers = []
    const ctors = staticType.getConstructSignatures()
    let ctor = null
    if (ctors.length) {
        try {
            ctor = { params: sigToMembers(ctors[0], ctx, 0).params }
        } catch (error) {
            if (!isUnsupportedRestError(error)) throw error
            skippedMembers.push({ name: 'constructor', reason: error.message })
        }
    }

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
    const setters = [] // #109.4: `set value(v)` accessors -> `@set external`
    for (const p of instanceType.getProperties()) {
        const pname = p.getName()
        if (pname === 'constructor' || pname === 'prototype') continue
        if (isInherited(p) || isHidden(p)) continue
        const pt = checker.getTypeOfSymbolAtLocation(p, decl)
        if (pt.getCallSignatures().length) {
            try {
                const { params, ret } = sigToMembers(pt.getCallSignatures()[0], ctx, 0)
                methods.push({ jsName: pname, params, ret })
            } catch (error) {
                if (!isUnsupportedRestError(error)) throw error
                skippedMembers.push({ name: pname, reason: error.message })
            }
        } else {
            // A getter / data property is consumer-RECEIVED (output): mark `produced=false`
            // so an output-only `any` inside it (hono's `routes: RouterRoute[]` whose
            // `handler` returns `any`) stays a flagged placeholder rather than an unsound
            // free `'a`. (#50 review)
            const prev = ctx.produced
            ctx.produced = false
            const ty = classify(pt, ctx, pname, 0)
            const decls = p.declarations || []
            // #109.4: a `set value(v)` accessor (or a writable data property with a matching setter)
            // was silently absent — emit `@set external value: (t, V) => unit`. Detected off the
            // declarations so a get-only accessor / readonly field stays @get-only.
            const hasSetter = decls.some((d) => ts.isSetAccessor(d))
            // A WRITE-ONLY accessor (a `set token(v)` with no getter) has NO reader at runtime, so it
            // must NOT emit a `@get` (reading returns `undefined`). Skip the getter only when every
            // declaration is a set-accessor; a data property or a get/set pair still reads.
            const writeOnly = hasSetter && decls.length > 0 && decls.every((d) => ts.isSetAccessor(d))
            if (!writeOnly) getters.push({ jsName: pname, type: ty })
            if (hasSetter) setters.push({ jsName: pname, type: ty })
            ctx.produced = prev
        }
    }

    // Static members (#109.4): `static create()` / `static readonly VERSION` live on the
    // constructor/static type and were silently dropped. Bind them THROUGH the class object with
    // `@scope("ClassName")` (the namespace-export mechanism): a static method -> `@module @scope
    // external create`, a static value -> `@module @scope @get`/`external`. Filter to OWN `static`
    // members — Function.prototype members (`call`/`apply`/`bind`/`length`/`name`) are lib-inherited.
    const staticMethods = []
    const staticValues = []
    for (const p of staticType.getProperties()) {
        const pname = p.getName()
        if (pname === 'prototype') continue
        const d = p.declarations && p.declarations[0]
        if (!d || !(ts.getCombinedModifierFlags(d) & ts.ModifierFlags.Static) || isHidden(p)) continue
        const pt = checker.getTypeOfSymbolAtLocation(p, decl)
        if (pt.getCallSignatures().length) {
            try {
                const { params, ret } = sigToMembers(pt.getCallSignatures()[0], ctx, 0)
                staticMethods.push({ jsName: pname, params, ret })
            } catch (error) {
                if (!isUnsupportedRestError(error)) throw error
                skippedMembers.push({ name: pname, reason: error.message })
            }
        } else {
            const prev = ctx.produced
            ctx.produced = false
            staticValues.push({ jsName: pname, type: classify(pt, ctx, pname, 0) })
            ctx.produced = prev
        }
    }

    return {
        module: importName,
        import: { from, name: importName },
        kind: 'class',
        enums, records, unboxed,
        // The class's own abstract type in the sink — emit aliases `type t = InstanceTypes.<sinkName>`.
        sinkName: (opts.classSink && opts.classSink.get(importName)) || lower(importName),
        ctor, methods, getters, setters, staticMethods, staticValues, skippedMembers,
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
/**
 * The module symbol for the entry source. A `.d.ts` with top-level exports resolves via
 * `getSymbolAtLocation`. An AMBIENT-MODULE-ONLY file (`declare module "pkg" { … }`, no top-level
 * exports — common in older `@types/*`) has NO source symbol, so it crashed "No module symbol";
 * fall back to the ambient module declared in this file (preferring one whose name matches the
 * package). (#109.1)
 * @returns {ts.Symbol | null}
 */
function entryModuleSymbol(checker, source, from) {
    const direct = checker.getSymbolAtLocation(source)
    if (direct) return direct
    const ambient = (checker.getAmbientModules && checker.getAmbientModules()) || []
    const inFile = ambient.filter((m) => (m.declarations || []).some((d) => d.getSourceFile && d.getSourceFile() === source))
    if (!inFile.length) return null
    const bare = (m) => m.getName().replace(/^["']|["']$/g, '') // symbol name is quoted: `"pkg"`
    return inFile.find((m) => from && bare(m) === from) || inFile[0]
}

export function extractComponent(entryFile, opts = {}) {
    const program = makeProgram(entryFile, opts.augment || [])
    const checker = program.getTypeChecker()
    const source = program.getSourceFile(entryFile)
    if (!source) throw new Error(`Could not load source file: ${entryFile}`)

    const moduleSymbol = entryModuleSymbol(checker, source, opts.from)
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
    const program = makeProgram(entryFile, opts.augment || [])
    const checker = program.getTypeChecker()
    const source = program.getSourceFile(entryFile)
    if (!source) throw new Error(`Could not load source file: ${entryFile}`)

    const moduleSymbol = entryModuleSymbol(checker, source, opts.from)
    if (!moduleSymbol) throw new Error(`No module symbol for ${entryFile}`)
    const exports = checker.getExportsOfModule(moduleSymbol)
    // `export = value` describes `module.exports = value`: getExportsOfModule exposes the
    // assigned value's namespace/static members (`bind`, `prototype`, …) but NOT the root
    // callable/class itself. resolveExternalModuleSymbol follows the assignment; for ordinary
    // ESM modules it returns moduleSymbol unchanged. Treat a distinct result as a synthetic
    // `export=` entry AFTER the normal members: when a merged namespace member shares the root's
    // name (clsx's `namespace clsx { function clsx }`), the member's real JS name works under BOTH
    // module systems, while the root's `= "default"` is undefined under a CommonJS target
    // (`require("clsx").default`) — so the named member must win the `seen` dedup. (#102)
    let exportEqualsSymbol = null
    try {
        const resolved = checker.resolveExternalModuleSymbol(moduleSymbol)
        if (resolved && resolved !== moduleSymbol) exportEqualsSymbol = resolved
    } catch { /* malformed external module: ordinary export traversal still reports what it can */ }
    const exportEntries = [
        ...exports.map((exp) => ({ exp, exportName: exp.getName() })),
        ...(exportEqualsSymbol ? [{ exp: exportEqualsSymbol, exportName: 'export=' }] : []),
    ]
    const from = opts.from

    // Module-level registry: every generated type lives here ONCE, keyed by type.id
    // (structural name for synthesized @unboxed), with a home module + reference edges.
    // emit.mjs groups these by home, SCC-merges cycles, and writes one `*Types.res` each.
    const shared = { byKey: new Map(), entries: [], names: new Set(), bySig: new Map() }

    // Pre-pass: map every exported CLASS's instance-type symbol -> its ReScript module
    // name, so a method/param/return typed as another exported class resolves to `Name.t`
    // (not a misclassified record). Built up front so cross-class refs work in any order.
    const classTypes = new Map()
    for (const { exp, exportName } of exportEntries) {
        let s = exp
        if (s.flags & ts.SymbolFlags.Alias) s = checker.getAliasedSymbol(s)
        if (!(s.flags & ts.SymbolFlags.Class)) continue
        // A React CLASS component (#101) binds as a component, not an `InstanceTypes` nominal — skip
        // it here so the classSink pre-pass below doesn't emit an orphan `type slider` no ref uses.
        if (reactClassComponentProps(s, checker)) continue
        let nm = exportName
        if (nm === 'default' || nm === 'export=') nm = s.getName()
        if (!nm || !/^[A-Z]/.test(nm)) continue
        classTypes.set(s, nm)
        const instSym = checker.getDeclaredTypeOfSymbol(s)?.symbol
        if (instSym) classTypes.set(instSym, nm)
    }

    // Also register each exported class's BASE-class symbols (transitively) → the exported
    // name, so a method returning the (non-exported) base maps to the class's own `t` instead
    // of minting a numbered opaque record per call site — e.g. hono's `get/post/…` return
    // `HonoBase<…>` instantiations, which now render as chainable `t`. Ambiguity guard: a
    // base claimed by TWO different exported classes is dropped (can't pick a side). (#24)
    {
        const claims = new Map() // baseSym -> exported name | null (ambiguous)
        // NEVER claim a LIBRARY base (lib.es Date, lib.dom EventTarget, …): `TZDate extends
        // Date` must not remap every `Date` in the package to `InstanceTypes.tzDate`. Only
        // first-party non-exported bases (hono's `HonoBase`) qualify. (Caught by the
        // benchmark gate on react-day-picker.)
        const isLibBase = (bsym) => {
            const d = bsym.declarations && bsym.declarations[0]
            const f = (d && d.getSourceFile().fileName) || ''
            return /node_modules\/(@types|typescript)\//.test(f) || /\/lib\.(dom|es|scripthost|webworker)/.test(f)
        }
        for (const [s, nm] of [...classTypes]) {
            let t = checker.getDeclaredTypeOfSymbol(s)
            for (let i = 0; i < 6 && t; i++) {
                const bases = (checker.getBaseTypes && t.isClassOrInterface?.()) ? checker.getBaseTypes(t) : (t.symbol && checker.getBaseTypes?.(checker.getDeclaredTypeOfSymbol(t.symbol)) || [])
                const base = bases && bases[0]
                if (!base || !base.symbol || classTypes.has(base.symbol) || isLibBase(base.symbol)) break
                claims.set(base.symbol, claims.has(base.symbol) && claims.get(base.symbol) !== nm ? null : nm)
                t = base
            }
        }
        for (const [bs, nm] of claims) if (nm) classTypes.set(bs, nm)
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

    // Namespace exports (`export * as Accordion from './index.parts.js'`): map each
    // member's RESOLVED value symbol -> { ns, member }. base-ui's runtime exports ONLY
    // these namespaces — the flat names (`AccordionRoot`) are `export type *` (type-only),
    // so a binding `= "AccordionRoot"` is undefined at runtime. A component reachable as a
    // namespace member binds `@scope("Accordion") … = "Root"` instead (correct whether or
    // not a flat VALUE export also exists). (#25)
    const scopeOf = new Map() // resolved member symbol -> { ns, member }
    const nsNames = []
    for (const exp of exports) {
        let s = exp
        try { if (s.flags & ts.SymbolFlags.Alias) s = checker.getAliasedSymbol(s) } catch { continue }
        if (!(s.flags & (ts.SymbolFlags.ValueModule | ts.SymbolFlags.NamespaceModule))) continue
        const ns = exp.getName()
        if (!/^[A-Z]/.test(ns)) continue
        nsNames.push(ns)
        for (const m of checker.getExportsOfModule(s)) {
            let ms = m
            try { if (ms.flags & ts.SymbolFlags.Alias) ms = checker.getAliasedSymbol(ms) } catch { continue }
            if (!scopeOf.has(ms)) scopeOf.set(ms, { ns, member: m.getName() })
        }
    }

    const components = []
    const functions = []
    const classes = []
    const skipped = []
    const seen = new Set()
    const componentBySym = new Map() // resolved symbol -> emitted module name (for NS alias files)
    const compounds = [] // component exports queued for the compound-statics pass below (#100)
    for (const { exp, exportName } of exportEntries) {
        let sym = exp
        if (sym.flags & ts.SymbolFlags.Alias) sym = checker.getAliasedSymbol(sym)
        // Resolve a usable binding name + the actual JS export name. For a default export the
        // JS name is `"default"` (NOT the resolved identifier) — binding `= "mitt"`/`= "index"`
        // would call `require("pkg").mitt`, which doesn't exist. The ReScript id prefers the
        // declaration's own name (e.g. `mitt`), even lowercase, falling back to the file name.
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
        if (!decl) {
            // Distinguish a BROKEN RE-EXPORT from a plain declarationless symbol: the export
            // specifier exists but de-aliasing resolved to nothing — the package's own types are
            // inconsistent (e.g. blend 0.0.37's `export { FOUNDATION_THEME } from './tokens'`
            // where a new `tokens.d.ts` shadows the `tokens/` directory, so the target module
            // doesn't export the name). Every TS consumer sees `any` for such an export; surface
            // it loudly instead of burying it in the generic skip pile. (#105)
            const brokenReexport = exp !== sym && (exp.flags & ts.SymbolFlags.Alias)
            skipped.push({ name, reason: brokenReexport ? 'unresolvable-reexport (upstream .d.ts bug? the re-export target does not export this name)' : 'no-declaration' })
            continue
        }
        let type
        try { type = checker.getTypeOfSymbolAtLocation(sym, decl) } catch { skipped.push({ name, reason: 'type-error' }); continue }
        // A `React.Context<T>` value (React 19 makes it renderable, so it has element-returning
        // call signatures and would otherwise fake a `@react.component` taking value+children).
        // Bind it faithfully as the context VALUE — `React.Context.t<T>` (#63 C6).
        if (isReactContextType(type)) {
            try {
                const ir = buildContextIR(checker, sym, source, name, from, { ...opts, shared })
                ir.import.jsName = jsName
                ir.import.isDefault = isDefault
                seen.add(name)
                functions.push({ name, ir })
            } catch (e) {
                skipped.push({ name, reason: 'context-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
            }
            continue
        }
        // React CLASS component (#101): `class X extends React.Component<P>`. Its type has construct
        // (not call) signatures, so isReactComponent misses it and it would bind as an unusable
        // `@new`/`@send` module. Bind it `@react.component` from `P` — React renders it like an FC.
        const classProps = (sym.flags & ts.SymbolFlags.Class) ? reactClassComponentProps(sym, checker) : null
        if (classProps) {
            try {
                const propsType = checker.getTypeFromTypeNode(classProps.propsNode)
                const ir = buildComponentIR(checker, sym, source, name, from, { ...opts, shared, propsType, classTypeParams: classProps.typeParams })
                ir.import.jsName = jsName
                ir.import.isDefault = isDefault
                componentBySym.set(sym, name)
                seen.add(name)
                if (ir.props.length || ir.attrsBase || (ir.baseSpreads && ir.baseSpreads.length)) components.push({ name, ir })
                else skipped.push({ name, reason: 'no-props' })
            } catch (e) {
                skipped.push({ name, reason: 'class-component-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
            }
            continue
        }
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
                    for (const member of ir.skippedMembers || []) {
                        skipped.push({ name: `${name}.${member.name}`, reason: member.reason })
                    }
                } catch (e) {
                    skipped.push({ name, reason: 'class-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
                }
            } else if (sym.valueDeclaration && type.getCallSignatures().length &&
                ((sym.flags & ts.SymbolFlags.Module) || !callableOwnProps(type, checker, decl).length)) {
                // A callable that also CARRIES own properties (i18next's `t`, axios instances)
                // falls through to the value branch below so classify can model it as an opaque
                // callable module (#103) — EXCEPT a function+namespace merge (clsx's `export=`
                // shape, #102), whose "properties" are the namespace's own members: those emit
                // separately, and the root must stay a plain positional function binding.
                try {
                    // #109.8: a function with MULTIPLE call signatures (top-level overloads) bound
                    // only signature[0], silently dropping the rest. Bind EACH overload: the first
                    // keeps the bare name, the others get a deterministic suffix from their params;
                    // all share the one JS name (`= "parse"`), the hand-written N-externals idiom.
                    const sigs = type.getCallSignatures()
                    let bound = false
                    const emittedSigs = new Set() // dedup overloads that COLLAPSE to the same ReScript
                    for (let i = 0; i < sigs.length; i++) {                    // signature (e.g. generic params flattened to `string`)
                        let oname = i === 0 ? name : name + overloadSuffix(sigs[i], sigs[0])
                        for (let n = 2; seen.has(oname); n++) oname = name + overloadSuffix(sigs[i], sigs[0]) + n
                        const ir = buildFunctionIR(checker, sym, source, oname, from, { ...opts, shared, sig: sigs[i] })
                        const sigKey = (ir.sig.params || []).map((p) => typeSig(p.type)).join(',') + '=>' + typeSig(ir.sig.ret)
                        if (emittedSigs.has(sigKey)) continue // identical binding — the base overload already covers it
                        emittedSigs.add(sigKey)
                        ir.import.jsName = jsName
                        ir.import.isDefault = isDefault
                        seen.add(oname)
                        functions.push({ name: oname, ir })
                        bound = true
                    }
                    if (!bound) skipped.push({ name, reason: 'no-call-signature' })
                } catch (e) {
                    skipped.push({ name, reason: 'fn-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
                }
            } else if ((sym.flags & ts.SymbolFlags.Value) && !(sym.flags & (ts.SymbolFlags.Enum | ts.SymbolFlags.Module))) {
                // A plain exported const VALUE (no call signature, not a class/enum/namespace) — e.g.
                // `declare const FOUNDATION_THEME: FoundationTokenType`. Bind it as a typed `@module
                // external` value, but ONLY when its type models cleanly (flag-don't-fake: an
                // unmodellable value stays in the skipped bucket rather than becoming a bogus binding).
                // Gated on SymbolFlags.Value, NOT `sym.valueDeclaration` — a cross-file re-exported
                // DEFAULT const (`export default X` → `export { default as X } from '…'`) de-aliases
                // to a symbol whose valueDeclaration is often undefined while declarations[0] is
                // populated; the `decl` above already carries that fallback. (#105)
                try {
                    const ir = buildValueIR(checker, sym, source, name, from, { ...opts, shared })
                    if (ir.value && !irHasImperfection(ir.value.type)) {
                        ir.import.jsName = jsName
                        ir.import.isDefault = isDefault
                        seen.add(name)
                        functions.push({ name, ir })
                    } else {
                        skipped.push({ name, reason: 'value-not-modellable' })
                    }
                } catch (e) {
                    skipped.push({ name, reason: 'value-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
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
            // Value reachable as a namespace member -> bind through the namespace object
            // (`@scope("Accordion") … = "Root"`); the flat export may be type-only. (#25)
            const nsRef = scopeOf.get(sym)
            if (nsRef && !isDefault) {
                ir.import.scope = nsRef.ns
                ir.import.jsName = nsRef.member
            }
            componentBySym.set(sym, name)
            seen.add(name)
            // A component with zero OWN props is still real when its whole surface is
            // the HTML-attributes spread (e.g. day-picker's `NextMonthButton(props:
            // ButtonHTMLAttributes<…>)`) — `type props = {...HtmlAttrs.x}` alone.
            if (ir.props.length || ir.attrsBase || (ir.baseSpreads && ir.baseSpreads.length)) {
                components.push({ name, ir })
                // Compound candidate (#100): its own value-properties are checked AFTER the
                // export loop, so an also-exported flat sibling (`MenuItem`) is already
                // registered (componentBySym) and a `typeof MenuItem` static aliases to it
                // instead of duplicating.
                compounds.push({
                    parentName: name, parentIr: ir, type, decl, depth: 0,
                    scopePath: [...(ir.import.scope ? [].concat(ir.import.scope) : []), ir.import.jsName || name],
                })
            } else skipped.push({ name, reason: 'no-props' })
        } catch (e) {
            skipped.push({ name, reason: 'extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
        }
    }
    // Compound-component statics (#100) — `const Menu: FC<…> & { Item: FC<…> }`, the dominant
    // pre-Radix idiom (antd's Menu.Item / Select.Option, react-bootstrap, headlessui). Each
    // component-typed own value-property of a component export becomes a sibling module bound
    // THROUGH the parent object (`@scope("Menu") … = "Item"` — the #25 machinery; runtime-correct
    // because the static lives ON the parent value), plus a zero-cost `module Item = MenuItem`
    // alias inside the parent file enabling the documented `<Menu.Item />` idiom. A non-component
    // static lands in `skipped` — previously every static vanished with no trace. Nested compounds
    // (antd's Table.Summary.Row) recurse via the queue, depth-capped defensively.
    while (compounds.length) {
        const cc = compounds.shift()
        const aliases = []
        for (const p of callableOwnProps(cc.type, checker, cc.decl)) {
            const member = p.getName()
            const label = `${cc.parentName}.${member}`
            let pt
            try { pt = checker.getTypeOfSymbolAtLocation(p, cc.decl) } catch { skipped.push({ name: label, reason: 'static-type-error' }); continue }
            if (!isReactComponent(pt, checker)) { skipped.push({ name: label, reason: 'compound-static-not-a-component' }); continue }
            // Dedup ONLY on VALUE identity — a `typeof SelectOption` type-query provably names the
            // same runtime value as the flat export, so alias to its module. Structural/type-id
            // matching is unsound here: blend's `Skeleton.Circle/Rectangle/Rounded` share one
            // instantiated props TYPE yet are three different runtime components — collapsing
            // them would render the wrong component.
            let target = null
            const pd = p.valueDeclaration || (p.declarations && p.declarations[0])
            if (pd && pd.type && ts.isTypeQueryNode(pd.type)) {
                try {
                    let qs = checker.getSymbolAtLocation(pd.type.exprName)
                    if (qs && (qs.flags & ts.SymbolFlags.Alias)) qs = checker.getAliasedSymbol(qs)
                    target = (qs && componentBySym.get(qs)) || null
                } catch { /* unresolvable typeof: build a scope-bound sibling below (always runtime-correct) */ }
            }
            if (!target) {
                let modName = cc.parentName + pascal(member), n2 = 2
                while (seen.has(modName)) modName = cc.parentName + pascal(member) + n2++
                try {
                    const cir = buildComponentIR(checker, p, source, modName, from, { ...opts, shared })
                    cir.import.scope = cc.scopePath.length === 1 ? cc.scopePath[0] : cc.scopePath
                    cir.import.jsName = member
                    if (cir.props.length || cir.attrsBase || (cir.baseSpreads && cir.baseSpreads.length)) {
                        seen.add(modName)
                        components.push({ name: modName, ir: cir })
                        target = modName
                        if (cc.depth < 3) compounds.push({ parentName: modName, parentIr: cir, type: pt, decl: cc.decl, depth: cc.depth + 1, scopePath: [...cc.scopePath, member] })
                    } else skipped.push({ name: label, reason: 'no-props' })
                } catch (e) {
                    skipped.push({ name: label, reason: 'static-extract-error: ' + e.message.split('\n')[0].slice(0, 50) })
                }
            }
            // The alias must be a valid ReScript module name; a lowercase static still emits its
            // sibling module above (and is listed in the report), it just can't be aliased.
            if (target && /^[A-Z]/.test(member)) aliases.push({ member, target })
        }
        if (aliases.length) cc.parentIr.statics = aliases.sort((a, b) => a.member.localeCompare(b.member))
    }
    // Namespace alias modules: `Accordion.res` with `module Root = AccordionRoot` — the
    // package's documented idiom (`<Accordion.Root>`), zero-cost ReScript module aliases
    // over the (scope-bound) flat component files. Only namespaces with ≥1 extracted
    // component member; skipped when the name collides with an emitted module. (#25)
    const namespaces = []
    for (const ns of nsNames) {
        if (seen.has(ns)) { skipped.push({ name: ns, reason: 'ns-name-collision' }); continue }
        const members = []
        for (const [msym, ref] of scopeOf) {
            if (ref.ns === ns && componentBySym.has(msym)) members.push({ member: ref.member, target: componentBySym.get(msym) })
        }
        if (members.length) namespaces.push({ name: ns, members: members.sort((a, b) => a.member.localeCompare(b.member)) })
    }

    healGhostRecords(shared)
    healGhostsFromTwin(shared)
    // #120: re-link fields that truncated to `string` past the bound because their (named, bounded)
    // record type wasn't registered YET — it since materialized at a shallower site. Runs BEFORE
    // propagateTypeParams so the new typeRefs get their `<'b>` threaded. Walks every IR tree.
    {
        const bk = shared.byKey
        // entry fields: relink AND record the new dep on the entry (feeds planSharedModules). Fresh
        // `seen` per entry so each entry's deps are fully recomputed.
        for (const e of shared.entries) { const d = e.deps || (e.deps = new Set()); for (const t of entryChildTypes(e)) relinkRegistered(t, bk, new Set(), d) }
        // component/function/class trees only REFERENCE shared types (one-directional) → no owner deps
        for (const c of components) for (const p of c.ir.props || []) relinkRegistered(p.type, bk, new Set(), null)
        for (const f of functions) {
            for (const p of (f.ir.sig && f.ir.sig.params) || []) relinkRegistered(p.type, bk, new Set(), null)
            if (f.ir.sig && f.ir.sig.ret) relinkRegistered(f.ir.sig.ret, bk, new Set(), null)
            if (f.ir.value && f.ir.value.type) relinkRegistered(f.ir.value.type, bk, new Set(), null)
        }
        for (const c of classes) {
            for (const p of (c.ir.ctor && c.ir.ctor.params) || []) relinkRegistered(p.type, bk, new Set(), null)
            for (const m of c.ir.methods || []) { for (const p of m.params || []) relinkRegistered(p.type, bk, new Set(), null); if (m.ret) relinkRegistered(m.ret, bk, new Set(), null) }
            for (const g of c.ir.getters || []) if (g.type) relinkRegistered(g.type, bk, new Set(), null)
        }
    }
    propagateTypeParams(shared)
    // Component/function IR trees reference shared entries too — re-sync their refs to the
    // CONVERGED tparams. A refTo taken before propagation copies the entry's tparams of that
    // moment; a record that turns generic post-hoc otherwise renders under-applied in prop
    // position (`React.ref<Nullable.t<DistTypes.highchartsReactRefObject>>` while the record
    // converged to `highchartsReactRefObject<'b>` — compile break). (#110 fallout)
    for (const c of components) for (const p of c.ir.props || []) syncRefTparams(p.type, shared.byKey, new Set())
    for (const f of functions) {
        // FunctionIR nests under `sig`; a const-value IR (also in this list) under `value`.
        for (const p of (f.ir.sig && f.ir.sig.params) || []) syncRefTparams(p.type, shared.byKey, new Set())
        if (f.ir.sig && f.ir.sig.ret) syncRefTparams(f.ir.sig.ret, shared.byKey, new Set())
        if (f.ir.value && f.ir.value.type) syncRefTparams(f.ir.value.type, shared.byKey, new Set())
    }
    for (const c of classes) {
        for (const p of (c.ir.ctor && c.ir.ctor.params) || []) syncRefTparams(p.type, shared.byKey, new Set())
        for (const m of c.ir.methods || []) {
            for (const p of m.params || []) syncRefTparams(p.type, shared.byKey, new Set())
            if (m.ret) syncRefTparams(m.ret, shared.byKey, new Set())
        }
        for (const g of c.ir.getters || []) if (g.type) syncRefTparams(g.type, shared.byKey, new Set())
    }

    // #90 residual: give same-base distinct shapes an order-INDEPENDENT intrinsic name, then resync
    // every reference to the final name. Runs last, so the whole colliding set (post-dedup) is known.
    stabilizeNames(shared) // populates shared.renames; applied at emit's resolveRef chokepoint

    return { components, functions, classes, skipped, shared, namespaces }
}

/** Re-link a past-bound `{kind:'opaque', relinkId}` node to the record entry that has since been
 *  registered under that type.id — mutated IN PLACE into a `typeRef` (zero-expansion; the entry
 *  exists). Generic deep walk so every ref-bearing IR shape is covered. Fixes the registration-order
 *  truncation where a series reached `SeriesEventsOptionsObject` past-depth before it materialized
 *  elsewhere. (#120) */
function relinkRegistered(t, byKey, seen, ownerDeps) {
    if (!t || typeof t !== 'object' || seen.has(t)) return
    seen.add(t)
    if (t.kind === 'opaque' && t.relinkId != null) {
        const e = byKey.get('id:' + t.relinkId)
        if (e && e.kind === 'record') {
            const r = refTo(e)
            delete t.text; delete t.relinkId
            Object.assign(t, r)
            // Register the NEW cross-reference on the owning entry, so planSharedModules sees the
            // edge and homes/orders the target correctly (else a `Module.t`/type-rec ordering miss).
            if (ownerDeps && e.key) ownerDeps.add(e.key)
            return
        }
        delete t.relinkId // never registered → stays the honest opaque/string fallback
        return
    }
    for (const k in t) {
        const v = t[k]
        if (v && typeof v === 'object') {
            if (Array.isArray(v)) { for (const x of v) relinkRegistered(x, byKey, seen, ownerDeps) }
            else relinkRegistered(v, byKey, seen, ownerDeps)
        }
    }
}

/**
 * Post-extraction healing pass (#33, probe I-4). A shared record whose FIRST encounter
 * was DEEP (a store/config object nested ≥ MAX_DEPTH levels inside a prop) had every
 * field built past the depth budget -> all opaque -> an all-`string` ghost (e.g.
 * `setOpenConfig2` with `cancel: string`), frozen forever alongside a shallow-encountered
 * sibling that resolved fine (`setOpenConfig`). Re-resolve any mostly-fallback record at
 * depth 0 and keep the result only when strictly fewer fields are fallback.
 *
 * CRITICAL BOUND: `MAX_DEPTH` deliberately truncates UNBOUNDED library graphs (Highcharts
 * options nest dozens of levels). A depth-0 re-resolve would defeat that and re-expand the
 * whole graph (28k lines + dangling `Point.t`/`NavigatorOptions.t` module refs). So a heal
 * is accepted ONLY when its re-resolve introduces ZERO new registry entries — i.e. every
 * field resolves to a builtin/leaf or a ref to an ALREADY-emitted type. That exactly
 * captures the genuine ghost (`setOpenConfig2`: its enum/records were already registered by
 * a shallow-resolved twin, so re-resolving adds nothing) while rejecting any record that
 * would pull fresh library graph (which always registers new entries -> rolled back, ghost
 * kept). The snapshot/rollback also undoes a rejected rebuild's registration side-effects.
 */
function healGhostRecords(shared) {
    const fallbacks = (fields) => fields.filter((f) => irHasImperfection(f.type)).length
    for (const e of [...shared.entries]) { // copy: a heal appends entries we must not re-scan
        if (e.kind !== 'record' || !e._heal || !e.fields.length) continue
        const bad = fallbacks(e.fields)
        if (!bad || bad < e.fields.length * 0.8) continue
        const { type, ctx } = e._heal
        // snapshot for rollback
        const entriesLen = shared.entries.length
        const keysBefore = new Set(shared.byKey.keys())
        const sigsBefore = new Set(shared.bySig.keys())
        let rebuilt
        try { rebuilt = buildRecordFields(type, { ...ctx, visiting: new Set() }, 0) } catch { rebuilt = null }
        const newEntries = shared.entries.length - entriesLen
        // Accept only a self-contained improvement: strictly fewer fallbacks AND zero new
        // entries (no fresh library graph, so no possibility of a dangling module ref).
        const accept = rebuilt && fallbacks(rebuilt.fields) < bad && newEntries === 0
        if (!accept) {
            // roll back every registration the (rejected) rebuild performed
            shared.entries.length = entriesLen
            for (const k of [...shared.byKey.keys()]) if (!keysBefore.has(k)) shared.byKey.delete(k)
            for (const s of [...shared.bySig.keys()]) if (!sigsBefore.has(s)) shared.bySig.delete(s)
            continue
        }
        e.fields = rebuilt.fields
        e.spread = rebuilt.spread
        e.deps = new Set()
        for (const f of rebuilt.fields) collectRefKeys(f.type, e.deps)
        const tvars = new Set()
        for (const f of rebuilt.fields) collectTypeVars(f.type, tvars)
        e.tparams = tvars.size ? [...tvars] : undefined
    }
}

/**
 * Heal a fully-degraded ghost record by copying field types from a structurally-richer TWIN —
 * a record of the same name-family + home with the same field names but non-fallback types.
 *
 * A deeply-nested type reached past `MAX_DEPTH` truncates to an all-`string` record (MenuV2's
 * `text.color` / `subText.color`: `MenuV2VariantToken<…>` -> `{ default: string, action: string }`)
 * even though the SAME shape resolved fully at a shallower site (`backgroundColor`'s
 * `menuV2VariantToken = { default: stateToken, action: menuV2ActionConfig }`). They don't dedup
 * because csstype gives `CSSObject['color']` / `['backgroundColor']` distinct type ids — but they
 * are the same shape, and bumping `MAX_DEPTH` is not an option (it re-expands the unbounded
 * Highcharts graph into dangling class refs — verified). Copying the twin's already-materialized
 * field types is safe: no re-resolution, no new entries, no depth change. (#63 review)
 */
function healGhostsFromTwin(shared) {
    const isFallback = (t) => irHasImperfection(t)
    const baseFamily = (n) => n.replace(/\d+$/, '') // strip the uniqueName disambiguation suffix
    const records = shared.entries.filter((e) => e.kind === 'record' && e.fields && e.fields.length)
    for (const e of records) {
        if (!e.fields.every((f) => isFallback(f.type))) continue // only fully-degraded ghosts
        const names = e.fields.map((f) => f.name).slice().sort().join(',')
        const twin = records.find((s) => s !== e && s.home === e.home &&
            baseFamily(s.name) === baseFamily(e.name) &&
            s.fields.map((f) => f.name).slice().sort().join(',') === names &&
            s.fields.some((f) => !isFallback(f.type)))
        if (!twin) continue
        const byName = new Map(twin.fields.map((f) => [f.name, f]))
        e.fields = e.fields.map((f) => {
            const tf = byName.get(f.name)
            return tf && !isFallback(tf.type) ? { ...f, type: tf.type, optional: f.optional } : f
        })
        e.deps = new Set()
        for (const f of e.fields) collectRefKeys(f.type, e.deps)
        const tvars = new Set()
        for (const f of e.fields) collectTypeVars(f.type, tvars)
        e.tparams = tvars.size ? [...tvars] : undefined
    }
}

/** The type nodes a shared entry directly contains — record fields' types, or union
 *  members' types. (enums have no nested types.) */
function entryChildTypes(e) {
    if (e.kind === 'record') return e.fields.map((f) => f.type)
    if (e.kind === 'unboxed') return e.members.map((m) => m.type)
    // opaque-views modules reference records through their `from*` externals (and overload /
    // callable modules through their signature views and property accessors) — those refs must
    // re-sync tparams too, or a record that turns generic post-hoc renders bare
    // (`fromZAxisOptions: zAxisOptions => t` while the record is `zAxisOptions<'b>` — compile
    // break). (#110 fallout)
    if (e.kind === 'opaque') return [...(e.members || []).map((m) => m.type), ...(e.sigs || []).map((s) => s.fn), ...(e.props || []).map((m) => m.fn || m.get)].filter(Boolean)
    return []
}

/** Equal tparam lists? Each is an array of `'a`-style strings, or undefined. */
function sameTparams(a, b) {
    const x = a || [], y = b || []
    return x.length === y.length && x.every((v, i) => v === y[i])
}

/** Re-establish the `refTo` invariant — a typeRef carries exactly its target entry's
 *  type parameters — across one type tree, reading the target's CURRENT tparams from the
 *  registry. Refs to types outside the registry (no key, or external) are left untouched. */
function syncRefTparams(t, byKey, seen) {
    if (!t || typeof t !== 'object' || seen.has(t)) return
    seen.add(t)
    if (t.kind === 'typeRef' && t.key && byKey.has(t.key)) {
        const tp = byKey.get(t.key).tparams
        if (tp && tp.length) t.tparams = [...tp]
        else delete t.tparams
    }
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal', 'thisArg']) if (t[k]) syncRefTparams(t[k], byKey, seen)
    if (Array.isArray(t.params)) for (const p of t.params) syncRefTparams(p, byKey, seen)
    if (Array.isArray(t.fields)) for (const f of t.fields) syncRefTparams(f.type, byKey, seen)
    if (Array.isArray(t.members)) for (const m of t.members) syncRefTparams(m.type, byKey, seen)
}

/**
 * Fixpoint pass: propagate type parameters across the shared-type reference graph.
 *
 * Shared records/unions are built bottom-up, but a CYCLE (Highcharts annotations:
 * `annotationsOptions<'a>` -> `events` -> `annotation<'a>` -> `annotationsOptions<'a>`)
 * means a member can be referenced BEFORE it has acquired its type parameter: `refTo`
 * bakes a bare `annotation` ref (no `<'a>`), `collectTypeVars` then never sees the var,
 * and the referencing record (`annotationsEventsOptions`) stays NON-generic while
 * referencing a generic type. The output `option<annotation>` is under-applied —
 * "type constructor annotation expects 1 argument(s), but is here applied to 0" — and
 * does not compile.
 *
 * The bottom-up build gives a partial assignment; this closes it. Iterate to a fixpoint:
 * any entry that transitively reaches a parameterized entry becomes parameterized too
 * (its tparams = vars in its own fields ∪ tparams of every entry it references). Then a
 * final sync rewrites every reference to its target's converged tparams, so no emitted
 * type-constructor reference is left under-applied. Monotonic (param sets only grow), so
 * it converges; the guard is a belt-and-braces backstop.
 */
function propagateTypeParams(shared) {
    const byKey = shared.byKey
    let changed = true, guard = 0
    while (changed && guard++ < 1000) {
        changed = false
        for (const e of shared.entries) {
            if (e.kind !== 'record' && e.kind !== 'unboxed' && !(e.kind === 'opaque' && e._highchartsSeriesUnion)) continue
            const kids = entryChildTypes(e)
            for (const t of kids) syncRefTparams(t, byKey, new Set())
            const tvars = new Set()
            for (const t of kids) collectTypeVars(t, tvars)
            const next = tvars.size ? [...tvars] : undefined
            if (!sameTparams(e.tparams, next)) { e.tparams = next; changed = true }
        }
    }
    // Final sync: reference sites now carry the converged tparams of their target.
    for (const e of shared.entries) for (const t of entryChildTypes(e)) syncRefTparams(t, byKey, new Set())
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

/** Dependency-free sink module for web-platform classes (Request, Response, …) — the
 *  WebTypes analogue of `InstanceTypes`. ReScript 12's stdlib has no Fetch types, so an
 *  abstract `type request` is the honest zero-cost mapping: values pass through untouched
 *  and stay chainable, instead of a flagged `string` placeholder. (#24) */
const WEB_MODULE = 'WebTypes'

/** The dependency-free SINK modules. A synthetic type (opaque union / overload / @unboxed) with no
 *  TS source is homed by its first dependency — but it must NEVER land in a sink while it also has a
 *  NON-sink dep, or it manufactures a sink OUT-edge (`CommonTypes → HighchartsTypes`) that closes a
 *  spurious cross-module cycle and collapses the sink (and everything Tarjan then fuses) into one
 *  giant `…SharedTypes` module. Sinks must stay edge-free so each is always its own module. (#115 pkg) */
const SINK_HOMES = new Set(['CommonTypes', INSTANCE_MODULE, WEB_MODULE])

/** The #115 home preference: co-locate a synthetic entry with its first NON-sink dep (see
 *  SINK_HOMES above — a sink must never gain an out-edge). Falls back to the first dep with
 *  a home, then to `fallback` when no dep resolves.
 *  `nonSinkOnly` (a callable-module re-pick, #128): re-home ONLY to a genuine non-sink dep;
 *  when every dep is sink-homed, keep `fallback` rather than sinking a callable MODULE into a
 *  sink (CommonTypes is the leaf for primitive unions, not a home for `module <Name> = {…}`). */
function depHome(deps, shared, fallback, nonSinkOnly = false) {
    const ds = [...deps].map((k) => shared.byKey.get(k)).filter((d) => d && d.home)
    const pick = ds.find((d) => !SINK_HOMES.has(d.home)) || (nonSinkOnly ? null : ds[0])
    return pick ? pick.home : fallback
}

/** lib.dom classes worth an abstract sink type. Conservative allowlist: names common in
 *  server/client APIs that do NOT collide with frequent first-party type names (no
 *  `Event`, `Body`, `Text`, …). The lib.dom-declaration guard protects the rest. */
/** React's ref-alias family — shared by classify() (solo ref props) and memberOf()
 *  (ref arms inside @unboxed unions) so the two dispatches can't drift. (#39) */
const REF_NAMES = /^(Ref|RefObject|MutableRefObject|LegacyRef)$/

/** Trial-extract a VENDOR library record (#39): the library gate normally refuses
 *  records for dependency-declared types (anti-hijack, anti-graph-pull), but small
 *  consumer-CONSTRUCTED shapes like @floating-ui's `Rect`/`VirtualElement` lose their
 *  whole prop to a review flag that way — and an opaque sink can't serve a value the
 *  consumer must BUILD. So: attempt the record extraction sandboxed (snapshot/rollback,
 *  the #33 heal pattern) and accept ONLY a perfect result — every field of every newly
 *  registered entry imperfection-free, and a bounded entry count (no graph pull).
 *  Anything less rolls back fully and keeps the honest flag. */
const VENDOR_TRIAL_ENTRY_CAP = 8
// At/above this many string-literal arms in an opaque module, collapse them into ONE
// `fromTag: [#"…" | …]` polyvar constructor instead of one named constant each. Below it,
// keep readable named constants (`Boundary.clippingAncestors`). (#53)
const LITERAL_COLLAPSE_THRESHOLD = 4
function trialVendorRecord(type, ctx, propName, named) {
    const shared = ctx.shared
    if (!shared) return null
    const entriesLen = shared.entries.length
    const keysBefore = new Set(shared.byKey.keys())
    const sigsBefore = new Set(shared.bySig.keys())
    const namesBefore = new Set(shared.names)
    const typeVarsBefore = ctx.typeVars ? new Map(ctx.typeVars) : null
    let ref = null
    // Fresh depth budget: a vendor shape is often reached DEEP (anchor's fn-return inside
    // a positioner config), where MAX_DEPTH would starve its fields into opaque and fail
    // the trial. Safe here: acceptance demands perfect cleanliness + a hard entry cap, so
    // the budget reset cannot smuggle in a graph pull. (#39, same reasoning as #33's heal)
    try { ref = recordNode(type, ctx, propName, 0, named) } catch { ref = null }
    const fresh = shared.entries.slice(entriesLen)
    // NOTE: fresh.length === 0 with a valid ref is the structural-DEDUP hit — the
    // extracted record was identical to an already-vetted entry and collapsed into it.
    const clean = ref &&
        fresh.length <= VENDOR_TRIAL_ENTRY_CAP &&
        fresh.every((e) => e.kind !== 'record' || (e.fields.length > 0 && !e.fields.some((f) => irHasImperfection(f.type))))
    if (clean) return ref
    // FULL rollback — including minted names (else a failed trial makes a later legitimate
    // `Rect` become `Rect2`) and any type variables salvaged params minted. (#39 review)
    shared.entries.length = entriesLen
    for (const k of [...shared.byKey.keys()]) if (!keysBefore.has(k)) shared.byKey.delete(k)
    for (const s of [...shared.bySig.keys()]) if (!sigsBefore.has(s)) shared.bySig.delete(s)
    for (const n of [...shared.names]) if (!namesBefore.has(n)) shared.names.delete(n)
    if (typeVarsBefore && ctx.typeVars) { ctx.typeVars.clear(); for (const [k, v] of typeVarsBefore) ctx.typeVars.set(k, v) }
    return null
}

/** Mint a fresh component-scoped type variable (the #31 machinery): 'a, 'b, … per
 *  component, registered in ctx.typeVars so the shared @unboxed entry parameterizes
 *  itself via collectTypeVars. Used to SALVAGE unmodellable fn params (#41). */
function freshTypeVar(ctx) {
    if (!ctx.typeVars) return { kind: 'unknown' } // no component scope -> keep the flag
    const TV = ['a', 'b', 'c', 'd', 'e', 'f']
    const key = Symbol('salvaged-param')
    const i = ctx.typeVars.size
    ctx.typeVars.set(key, "'" + (TV[i] || `t${i}`))
    return { kind: 'typeVar', name: ctx.typeVars.get(key) }
}

function isHighchartsSeriesOptionsName(name) {
    return /^Series[A-Z].*Options$/.test(name || '') || /^series[A-Z].*Options$/.test(name || '')
}

function isHighchartsSeriesOptionsNode(node) {
    return node && node.kind === 'typeRef' && isHighchartsSeriesOptionsName(String(node.to || '').replace(/\.t$/, ''))
}

/** Highcharts `Series*Options.data` is intentionally user payload: point objects may
 *  carry arbitrary application fields, and the series/tooltip/point graph already has a
 *  payload type variable for that data. Keep the array shape but make its element generic
 *  instead of forcing `JSON.t`, so typed point records can pass through unchanged. */
function highchartsSeriesDataNode(ctx) {
    if (ctx.highchartsSeriesDataVar) return { kind: 'typeVar', name: ctx.highchartsSeriesDataVar }
    const TV = ['a', 'b', 'c', 'd', 'e', 'f']
    if (ctx.typeVars) {
        const existing = new Set(ctx.typeVars.values())
        if (existing.has("'b")) {
            ctx.highchartsSeriesDataVar = "'b"
            return { kind: 'typeVar', name: ctx.highchartsSeriesDataVar }
        }
        const key = Symbol('highcharts-series-data')
        const i = ctx.typeVars.size
        ctx.typeVars.set(key, "'" + (TV[i] || `t${i}`))
        ctx.highchartsSeriesDataVar = ctx.typeVars.get(key)
        return { kind: 'typeVar', name: ctx.highchartsSeriesDataVar }
    }
    ctx.highchartsSeriesDataVar = "'a"
    return { kind: 'typeVar', name: ctx.highchartsSeriesDataVar }
}

function isHighchartsSeriesDataField(recordType, fieldName, fieldType, checker) {
    if (fieldName !== 'data') return false
    const recordName = typeName(recordType) || ''
    if (!isHighchartsSeriesOptionsName(recordName)) return false
    if (asArray(fieldType, checker) || checker.isTupleType?.(fieldType)) return true
    if (fieldType.isUnion && fieldType.isUnion()) {
        return fieldType.types
            .filter((t) => !(t.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined | ts.TypeFlags.Void)))
            .some((t) => asArray(t, checker) || checker.isTupleType?.(t))
    }
    return false
}

/** Salvage a callback whose RETURN is clean but whose PARAM(s) couldn't be modelled:
 *  replace each imperfect param with a fresh type variable, so the prop stays a usable
 *  typed callback (`('a, string) => unit`) instead of collapsing the WHOLE thing to a
 *  `string` placeholder. Sound because params flow library->consumer (the consumer
 *  RECEIVES the value; a hole they must annotate is honest). A clean return is REQUIRED —
 *  a faked return feeds wrong values INTO the library (gated, same rule as #41's @unboxed
 *  Fn members). (#30, probe I-1a) */
function salvageCallbackParams(node, ctx) {
    if (!node || node.kind !== 'callback' || !Array.isArray(node.params)) return node
    if (irHasImperfection(node.ret)) return node          // bad return -> leave the prop flagged
    if (!node.params.some(irHasImperfection)) return node  // nothing to salvage
    return {
        ...node,
        params: node.params.map((p) => (irHasImperfection(p) ? { ...freshTypeVar(ctx), optional: p.optional } : p)),
        note: 'a parameter type could not be modelled — received as a type variable; annotate at the call site',
    }
}

/** Walk an IR type tree for imperfection kinds (opaque/review/unknown/any) — the
 *  extract-side mirror of emit's `imperfection()`, used to gate @unboxed Fn members
 *  (flag-don't-fake: a fake inside a shared variant would render UNFLAGGED). */
function irHasImperfection(t) {
    if (!t || typeof t !== 'object') return false
    if (t.kind === 'opaque' || t.kind === 'review' || t.kind === 'unknown' || t.kind === 'any') return true
    for (const k of ['of', 'ret', 'arg', 'mapKey', 'mapVal', 'thisArg']) if (t[k] && irHasImperfection(t[k])) return true
    if (Array.isArray(t.params)) for (const p of t.params) if (irHasImperfection(p)) return true
    return false
}

const WEB_PLATFORM_TYPES = {
    Request: 'request', Response: 'response', Headers: 'headers',
    URL: 'url', URLSearchParams: 'urlSearchParams',
    AbortSignal: 'abortSignal', AbortController: 'abortController',
    Blob: 'blob', ReadableStream: 'readableStream', WritableStream: 'writableStream',
    WebSocket: 'webSocket',
    // webapi-OFF fallbacks only — with rescript-webapi installed these three map to the
    // full Webapi.* bindings instead (see the File/FileList/FormData ladder in classify). (#41)
    File: 'file', FileList: 'fileList', FormData: 'formData',
    // pass-through value (obtained from `range.getClientRects()` etc.) — needed so
    // VirtualElement's `getClientRects` return union stays clean. (#39)
    DOMRectList: 'domRectList',
}

/** True when the type's symbol is DECLARED in lib.dom/lib.webworker — so a package's OWN
 *  class named `Response`/`Request` is never hijacked into the WebTypes sink. */
function isWebPlatformDecl(type) {
    const sym = type.aliasSymbol || (type.getSymbol && type.getSymbol())
    const d = sym && sym.declarations && sym.declarations[0]
    const f = (d && d.getSourceFile && d.getSourceFile().fileName) || ''
    return /\/lib\.(dom|webworker)/.test(f)
}

/** A declaration from an EXTERNAL dependency (React types, Radix, csstype, styled-components,
 *  lib.*) — NOT the package being bound. Used to pick the FIRST-PARTY signature of a merged
 *  intersection property so its own optionality/type wins (`UnitInput.value: number | undefined`
 *  own vs `@types/react`'s `value?: string|…`). (#65 B1) */
function isVendorDecl(decl) {
    const f = (decl && decl.getSourceFile && decl.getSourceFile().fileName) || ''
    return /node_modules\/(@types|react|react-dom|@radix-ui|@floating-ui|csstype|styled-components|@emotion|@stitches)\b/.test(f) ||
        /\/lib\.(dom|es|scripthost|webworker)/.test(f)
}

/** Lazily register `WebTypes.<name>` in the shared registry (module mode only) and return
 *  its classRef. Only types actually referenced get emitted. */
function webSink(ctx, tsName) {
    const key = 'web:' + tsName
    let entry = ctx.shared.byKey.get(key)
    if (!entry) {
        entry = { key, kind: 'nominal', name: uniqueName(WEB_PLATFORM_TYPES[tsName], ctx.shared), home: WEB_MODULE, deps: new Set() }
        ctx.shared.byKey.set(key, entry)
        ctx.shared.entries.push(entry)
    }
    return { kind: 'classRef', to: entry.name, home: WEB_MODULE }
}

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
/** Can `t` materialize past MAX_DEPTH within `budget` object-nesting levels WITHOUT unbounded
 *  registry growth? Leaves / already-registered links / containers / functions are bounded at any
 *  budget; a union is bounded iff every arm is; an object costs one budget level and is bounded iff
 *  every field is bounded at budget-1 (cycle-guarded via `seen`). Anything else → conservatively
 *  unbounded, so the caller truncates, keeping the unbounded Highcharts graph bounded. Gate for the
 *  named-bounded-record escape (recovers `XAxisLabelsOptions` and co.). (#115 item 1) */
/** The bare, untyped global `Function` (lib.es5) — `Object`-flagged, ZERO call signatures, symbol
 *  name `Function`, from a lib/@types declaration, carrying the `apply`/`call`/`bind` prototype. A
 *  TYPED function (`() => void`, a callback alias) has ≥1 call signature and never matches. It has no
 *  signature to model, but IS a callable runtime leaf → bound to the shared `JsFn` opaque module
 *  (`fromFnN`/`asFnN`) instead of a flagged `string`. The `isLibraryType` guard + prototype
 *  fingerprint keep a first-party `interface Function {}` from matching. (#120) */
function isBareFunction(type) {
    if (!type || !(type.flags & ts.TypeFlags.Object)) return false
    if (type.getCallSignatures?.().length) return false
    const sym = (type.getSymbol && type.getSymbol()) || type.symbol
    if (!sym || sym.getName?.() !== 'Function' || !isLibraryType(type)) return false
    const props = new Set((type.getProperties?.() || []).map((p) => p.getName()))
    return ['apply', 'call', 'bind'].every((n) => props.has(n))
}

function boundedPastDepth(t, ctx, checker, budget, seen) {
    if (!t) return false
    const f = t.flags
    if (f & (ts.TypeFlags.String | ts.TypeFlags.Number | ts.TypeFlags.Boolean | ts.TypeFlags.BigInt |
        ts.TypeFlags.StringLiteral | ts.TypeFlags.NumberLiteral | ts.TypeFlags.BooleanLiteral |
        ts.TypeFlags.BigIntLiteral | ts.TypeFlags.Unknown | ts.TypeFlags.Any | ts.TypeFlags.Index |
        ts.TypeFlags.Null | ts.TypeFlags.Undefined | ts.TypeFlags.Void | ts.TypeFlags.EnumLike |
        ts.TypeFlags.NonPrimitive)) return true // the bare `object` keyword → a `JSON.t` leaf (#149)
    if (isCssType(t)) return true
    if (t.id != null && ctx.shared && ctx.shared.byKey.has('id:' + t.id)) return true // registered → link
    if (checker.isArrayType?.(t) || checker.isTupleType?.(t)) return true
    if (t.getCallSignatures?.().length === 1 && !(t.getProperties?.().length)) return true
    if (isBareFunction(t)) return true // a bare `Function` → the fixed `JsFn` module: zero registry growth (#120)
    if (t.isUnion && t.isUnion()) return t.types.every((a) => boundedPastDepth(a, ctx, checker, budget, seen))
    if (f & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)) {
        if (checker.getIndexInfoOfType?.(t, ts.IndexKind.String) && !(t.getProperties?.().length)) return true
        if (budget <= 0 || t.id == null || seen.has(t.id)) return false
        const props = t.getProperties?.() || []
        if (!props.length || t.getCallSignatures?.().length) return false
        seen.add(t.id)
        const ok = props.every((p) => {
            const d = p.valueDeclaration || (p.declarations && p.declarations[0])
            if (!d) return false
            let ft; try { ft = checker.getNonNullableType(checker.getTypeOfSymbolAtLocation(p, d)) } catch { return false }
            return boundedPastDepth(ft, ctx, checker, budget - 1, seen)
        })
        seen.delete(t.id)
        return ok
    }
    return false
}
const PAST_BOUND_CAP = 3 // deepest object nesting materialized past MAX_DEPTH

function classify(type, ctx, propName = '', depth = 0) {
    const { checker } = ctx
    const flags = type.flags

    // Branded primitive intersections are dependency-free runtime leaves. Handle
    // them before the depth/object paths so they can never become a fake record
    // (or a deep `string` fallback) merely because the checker exposes the marker.
    const branded = brandedPrimitiveNode(type, ctx, propName)
    if (branded) return branded

    // depth / cycle guards — complex library types resolve to deep self-referential object graphs;
    // beyond a few levels we emit opaque + flag (truncates UNBOUNDED NEW expansion).
    if (depth > MAX_DEPTH) {
        // Exception: a DIRECT self-reference — the field's type IS the record whose fields we're
        // building right now (`ctx.selfId`) — is a cycle to a known type (zero new expansion), so
        // resolve it even past the depth bound. Truncating a recursive self-ref like
        // `subMenu?: SingleSelectV2ItemType[]` to a silent `string` is a defect (it degraded
        // single-select while the shallower multi-select stayed recursive). Scoped to the IMMEDIATE
        // self type only — a deep back-ref to an ANCESTOR record still truncates, so the unbounded
        // Highcharts graph (whose deep records dangle `NavigatorOptions.t` / `Point.t`) stays
        // bounded. (#63 validation)
        if (type.id != null && type.id === ctx.selfId && ctx.shared) {
            const e = ctx.shared.byKey.get('id:' + type.id)
            if (e && e.kind === 'record') return refTo(e)
        }
        // The self-ref exception, GENERALIZED (#98, #110): a reference to an already-REGISTERED
        // shared entry is a zero-expansion link — the entry exists (recordNode registers the name
        // BEFORE building fields, the same guarantee the below-bound visiting branch relies on),
        // so no new registry growth is possible. Covers both a COMPLETED shallow-site type
        // (Highcharts' `Point`, reached deep inside `TooltipOptions`) and an IN-PROGRESS ancestor
        // (`tooltip → options → tooltipOptions → formatter → tooltip: Tooltip`, #110 — the cycle
        // lands as `type rec`, exactly like below-bound back-refs). A type FIRST reached past the
        // bound was never registered, so the unbounded-graph bound still holds. RECORD entries
        // only (the selfId precedent): an opaque-module/views entry emits as a submodule whose
        // materialization is driven by below-bound references — linking one from past-depth
        // produced a `Module.t` reference to a file that never emitted (blend's
        // `ChartsPlotZigzagOptionsDataLabels.t`, benchmark compile break).
        // GENERIC records link too (#115): `chart<'b>.options` is `options<'b>`, an already-
        // registered generic record — the link lands in a `type rec chart<'b> = {… options?:
        // options<'b>} and options<'b>` group (the emitter already emits generic `type rec` groups,
        // e.g. `zAxisOptions<'b>`). The `syncRefTparams` post-pass (#110) re-syncs the ref's tparams
        // to the entry's converged set, so the `<'b>` threads correctly — the earlier non-generic
        // restriction predated that pass. Recovers `chart.options` / `chart.addSeries` return from a
        // loose `string`. In-progress ancestors still link ONLY from a past-depth FUNCTION signature
        // (ctx.pastDepthFn — the #110 shape); letting ordinary record FIELDS link in-progress
        // ancestors merged huge slabs into one `type rec` group with an unorderable record↔module
        // cycle. RECORD entries only (the selfId precedent): an opaque-module/views entry emits as a
        // submodule, and a past-depth `Module.t` link references a file that never emitted.
        if (type.id != null && ctx.shared) {
            const e = ctx.shared.byKey.get('id:' + type.id)
            if (e && e.kind === 'record') return refTo(e)
        }
        // A FUNCTION reached past the bound classifies through its signature: the function node
        // itself cannot expand the registry — only its params/return can, and each of those either
        // links to an already-materialized record (above), resolves as a leaf (below), or truncates
        // flagged. Recovers deep `formatter?: TooltipFormatterCallbackFunction` as a real `@this`
        // callback instead of an opaque string. Guarded against SELF-recursive function types
        // (react-rating's `HF`, whose param references `HF`): past the bound the normal
        // ctx.visiting check never runs, so without this guard the re-entry loops forever — a
        // function id already on the visiting path (or anything past the hard cap) truncates to
        // the flagged opaque instead. (#98)
        if (type.getCallSignatures && depth <= MAX_DEPTH * 3 &&
            !(type.id != null && ctx.visiting && ctx.visiting.has(type.id))) {
            const dSigs = type.getCallSignatures()
            if (dSigs.length === 1 && !(type.getProperties && type.getProperties().length)) {
                if (type.id != null) (ctx.visiting || (ctx.visiting = new Set())).add(type.id)
                const prevPDF = ctx.pastDepthFn
                ctx.pastDepthFn = true // in-progress ancestors may link from this signature (#110)
                try { return functionNode(dSigs[0], ctx, propName, depth) }
                finally { ctx.pastDepthFn = prevPDF; if (type.id != null) ctx.visiting.delete(type.id) }
            }
        }
        // A bare `Function` past the bound is a callable runtime leaf → the shared `JsFn` module,
        // same as below the bound. MUST precede the named-bounded-record escape (which now sees
        // `Function` as bounded, #120) — else a past-depth `Function` would be sent to `recordNode`
        // and build a junk record from `apply`/`call`/`bind`. (#120)
        if (ctx.shared && isBareFunction(type)) {
            ctx.shared.usesJsFn = true
            return { kind: 'raw', res: 'JsFn.t', note: 'was `Function` — build with JsFn.fromFn0/1/2/3, read with JsFn.asFn0/1/2/3' }
        }
        // Zero-cost leaves resolve even past the bound — a primitive CANNOT expand the graph, so
        // truncating `enabled?: boolean` to an opaque `string` was pure loss. Without this, every
        // record first reached past MAX_DEPTH (Highcharts' `TooltipOptions`) emitted ALL its fields
        // as `string`, primitives included. A literal folds to its base primitive here: past the
        // bound the alternative was an opaque `string` anyway, so `number` for `1000` is strictly
        // more faithful. (#98)
        if (flags & (ts.TypeFlags.Unknown | ts.TypeFlags.NonPrimitive)) return { kind: 'raw', res: 'JSON.t' } // `unknown`/bare `object` (#149)
        if (flags & (ts.TypeFlags.String | ts.TypeFlags.StringLiteral)) return { kind: 'string' }
        if (flags & (ts.TypeFlags.Number | ts.TypeFlags.NumberLiteral)) return { kind: 'number' }
        if (flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return { kind: 'boolean' }
        if (flags & (ts.TypeFlags.BigInt | ts.TypeFlags.BigIntLiteral)) return { kind: 'bigint' }
        if (flags & ts.TypeFlags.Index) return { kind: 'string' }
        if (isCssType(type)) return { kind: 'string' }
        // CONTAINERS keep their certain shape past the bound — the wrapper is a runtime fact
        // (an array / a plain object), only the ELEMENT may be unmodellable. An element that
        // links/resolves keeps its real type; an imperfect one becomes the honest opaque payload
        // `JSON.t` (the same mapping `unknown` gets), NOT a fake `string`. Unblocks Highcharts'
        // `series*Options.data: (number | PointOptionsObject | […])[]` (→ `array<JSON.t>`) and
        // `custom?: Dictionary<any>` (→ `Dict.t<JSON.t>`) — both previously collapsed to a `string`
        // that can never carry the value, forcing an %identity in every consumer. (#111 downstream)
        if (checker.isArrayType?.(type) || checker.isTupleType?.(type)) {
            const els = checker.getTypeArguments(type) || []
            const nodes = els.map((el) => classify(el, ctx, propName, depth + 1))
            // a tuple keeps a typed element only when every element agrees (`[x, y]` → array<float>)
            const uniq = new Set(nodes.map((n) => JSON.stringify(n)))
            const of = nodes.length && uniq.size === 1 && !irHasImperfection(nodes[0])
                ? nodes[0] : { kind: 'raw', res: 'JSON.t' }
            return { kind: 'array', of }
        }
        {
            // String index (`{ [k: string]: V }`) -> `Dict.t<V>`. A NUMERIC index (`{ [n: number]: V }`,
            // #109.6) is the same at runtime — JS object keys are always strings — so it maps to
            // `Dict.t<V>` too, instead of collapsing to an opaque `JSON.t`.
            const si = checker.getIndexInfoOfType?.(type, ts.IndexKind.String) || checker.getIndexInfoOfType?.(type, ts.IndexKind.Number)
            if (si && si.type && !(type.getProperties && type.getProperties().length)) {
                const of = classify(si.type, ctx, propName, depth + 1)
                return { kind: 'dict', of: irHasImperfection(of) ? { kind: 'raw', res: 'JSON.t' } : of }
            }
        }
        // A past-bound UNION whose every arm is bounded is SPLIT, not truncated wholesale: a union
        // type's `getProperties()` is empty, so without this the guard returned opaque before
        // `unionNode` saw the arms — `PlotXrangeDataLabelsOptions | […][]` (dataLabels) collapsed to
        // `string` instead of `@unboxed One(a) | Many(array<a>)`. Routing to `unionNode` lets the
        // object arm materialize via the bounded-record / memberOf escapes. (#115 item 1)
        if ((flags & ts.TypeFlags.Union) && ctx.shared && (ctx.pastBoundBudget ?? PAST_BOUND_CAP) > 0 &&
            type.types.every((a) => boundedPastDepth(checker.getNonNullableType(a), ctx, checker, PAST_BOUND_CAP, new Set()))) {
            return unionNode(type, ctx, propName, depth)
        }
        // A NAMED, provably-BOUNDED record materializes past the bound instead of truncating to
        // `string` — recovers deep option records first reached past MAX_DEPTH (Highcharts'
        // `XAxisLabelsOptions`; `yAxisLabelsOptions` already resolved shallowly). NAMED only: an
        // anonymous `{…}`/intersection would proliferate order-churny `…Config2/3` names (#90 lesson).
        // The budget-capped, cycle-guarded `boundedPastDepth` gate keeps the unbounded graph bounded;
        // `pastBoundBudget` blocks chaining so each escape adds a bounded subtree, not the whole graph.
        if (ctx.shared && type.id != null && type.getProperties?.().length &&
            !type.getCallSignatures().length && !checker.getIndexInfoOfType?.(type, ts.IndexKind.String)) {
            const sym = type.getSymbol?.() || type.aliasSymbol
            const named = sym && sym.getName && sym.getName() && sym.getName() !== '__type'
            const budget = ctx.pastBoundBudget ?? PAST_BOUND_CAP
            if (named && budget > 0 && boundedPastDepth(type, ctx, checker, budget, new Set())) {
                const prev = ctx.pastBoundBudget ?? PAST_BOUND_CAP
                ctx.pastBoundBudget = prev - 1
                try { return recordNode(type, ctx, propName, MAX_DEPTH, typeName(type)) }
                finally { ctx.pastBoundBudget = prev }
            }
        }
        // A named object truncated here past the bound MIGHT get registered later by a shallower
        // site (Highcharts' `seriesEventsOptionsObject`: 119 series link it, but ~118 reached it
        // past-depth BEFORE it first materialized → `string`). Stamp its type.id so the
        // `relinkRegistered` post-pass can re-resolve it to the now-registered record — a
        // zero-expansion link, order-independent. (#120)
        if (type.id != null && type.getProperties?.().length && !type.getCallSignatures().length) {
            return { kind: 'opaque', text: checker.typeToString(type), relinkId: type.id }
        }
        return { kind: 'opaque', text: checker.typeToString(type) }
    }
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
    // The bare `object` KEYWORD (`ts.TypeFlags.NonPrimitive` — "any non-primitive", no shape)
    // is the same honest opaque value, so it maps to `JSON.t` too (was a flagged `string`). (#149)
    if (flags & (ts.TypeFlags.Unknown | ts.TypeFlags.NonPrimitive)) return { kind: 'raw', res: 'JSON.t' }
    // Prop-position `any` -> an implicit component generic, the same treatment an
    // EXPLICIT generic already gets (`SliderRoot<Value>` -> 'a). Keyed by the alias that
    // carried it (`AccordionValue = (any | null)[]`) so `value`/`defaultValue`/
    // `onValueChange` over one alias unify on ONE variable; a bare `any` gets a fresh var
    // per occurrence. Exactly as sound as the upstream `any`, strictly better than a
    // string placeholder that silently does nothing. Inside SHARED record fields it stays
    // a flagged defect (a shared type can't be component-generic). (#31, probe I-2)
    if (flags & ts.TypeFlags.Any) {
        // ERROR-any (#107): the checker's error type (intrinsicName 'error' — or its sibling
        // 'unresolved', used by some unresolvable-reference paths) means the TYPE REFERENCE
        // ITSELF DOES NOT RESOLVE — a broken import in the package's .d.ts (blend's `ThemeType`
        // through the shadowed `../tokens` path), NOT an author-written `any`. The
        // implicit-generic salvage below would turn it into a silent `'a` (ThemeProvider's
        // `~foundationTokens: 'a=?`, defects=0) — a contract violation twice over: `'a` is
        // reserved for genuine round-trip generics, and nothing may degrade unflagged. Emit a
        // marked placeholder instead; the report's declText names the failing reference.
        if (type.intrinsicName === 'error' || type.intrinsicName === 'unresolved') return { kind: 'any', unresolved: true }
        // A record-field `any` normally stays a flagged defect (#31) — a shared record
        // can't carry a per-component var, and a generic record referenced as a callback
        // param inside a shared `className`/`style` @unboxed doesn't thread its `<'a>`
        // (compile break). BUT for an ARRAY-ELEMENT record at a produce position (`items:
        // {value: any}[]`, round-tripping with `itemToStringValue`) the var threads cleanly
        // through `array<item<'a>>` -> the union -> the component (proven; refTo copies
        // tparams, collectTypeVars/collectVarNames surface them). Narrowly scoped to exactly
        // that case so state records consumed by className/style stay as-is. (#50)
        const fieldVarOk = ctx.inRecordField && ctx.inArrayElem && ctx.produced !== false
        if (ctx.typeVars && (!ctx.inRecordField || fieldVarOk)) {
            const TV = ['a', 'b', 'c', 'd', 'e', 'f']
            const key = ctx.lastAnyAlias || Symbol('bare-any')
            if (!ctx.typeVars.has(key)) {
                const i = ctx.typeVars.size
                ctx.typeVars.set(key, "'" + (TV[i] || `t${i}`))
            }
            return { kind: 'typeVar', name: ctx.typeVars.get(key) }
        }
        return { kind: 'any' }
    }

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
    // A fresh string/number LITERAL widens to its runtime primitive — but ONLY for a const-value
    // binding (`ctx.constValue`: `DEFAULT_AVATAR_ALT = "Avatar"` → string), and NEVER for an enum
    // member. TS sets `StringLiteral`/`NumberLiteral` ALSO on `Size.Sm`/`Mode.A`, so without the
    // `EnumLike` guard a prop/const typed as a specific enum member would silently drop to
    // `string`/`float` instead of keeping its enum. Scoping to const also preserves the
    // `⚪ loose — was "x"` discriminant/brand flag in prop/record contexts (a bare `"line"` isn't
    // enum-like, so it stays flagged, not silently widened). (#108)
    if (ctx.constValue && (flags & ts.TypeFlags.StringLiteral) && !(flags & ts.TypeFlags.EnumLike)) return { kind: 'string' }
    if (ctx.constValue && (flags & ts.TypeFlags.NumberLiteral) && !(flags & ts.TypeFlags.EnumLike)) return { kind: 'number' }
    if (flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) return { kind: 'boolean' }
    // `bigint` is a first-class ReScript 12 type (`Stdlib_BigInt`, `123n` literals). A bigint
    // LITERAL (`123n`) folds into the `bigint` type — ReScript has no `@as` for bigint literals.
    if (flags & (ts.TypeFlags.BigInt | ts.TypeFlags.BigIntLiteral)) return { kind: 'bigint' }
    // `keyof T` (an index type, incl. over a generic param) — a key is a string at runtime. Mapping it
    // to `string` keeps an array faithful: `(keyof T)[]` → `array<string>` (without this it classified
    // opaque, and the whole prop collapsed to a flat `string`). (#79)
    if (flags & ts.TypeFlags.Index) return { kind: 'string' }

    // CSS property values (csstype) are correctly `string`, not a loose fallback.
    if (isCssType(type)) return { kind: 'string' }

    const name = typeName(type)
    // React's "all DOM attributes of an element" wrappers — `ComponentProps<'div'>` (resolves to
    // `DetailedHTMLProps<HTMLAttributes<…>, …>`) and `ComponentPropsWith(out)Ref` — are exactly the
    // DOM-attribute bag `JsxDOM.domProps` already models. Map them so a prop typed
    // `React.ComponentProps<'div'>` is `JsxDOM.domProps`, not a flagged `string`. (#79)
    // (`HTMLProps` is deliberately NOT included — base-ui uses it for render-prop params already modelled
    // as a record; mapping it here would churn ~180 files beyond this fix's scope.)
    if (name && /^(DetailedHTMLProps|ComponentProps|ComponentPropsWithRef|ComponentPropsWithoutRef)$/.test(name)) {
        return { kind: 'raw', res: 'JsxDOM.domProps' }
    }
    // Remember the most recent ALIAS on the way down, so an `any` leaf deep inside it
    // (`AccordionValue = (any | null)[]` -> array -> union -> any) can key its implicit
    // type variable by the alias that carried it. (#31)
    if (type.aliasSymbol) ctx.lastAnyAlias = type.aliasSymbol

    // A reference to an exported CLASS instance -> its abstract type in the `InstanceTypes`
    // sink (M2). The class currently being built renders as bare `t` (its module's local
    // alias); any other class as `InstanceTypes.<name>`. Gated on ctx.classTypes, so the
    // component/function paths are unaffected.
    if (ctx.classTypes && type.symbol && ctx.classTypes.has(type.symbol)) {
        const cn = ctx.classTypes.get(type.symbol)
        const sink = (ctx.classSink && ctx.classSink.get(cn)) || lower(cn)
        return { kind: 'classRef', to: sink, home: INSTANCE_MODULE, self: cn === ctx.currentClass }
    }

    // `typeof import("highcharts")` / `typeof SomeNamespace` — a MODULE OBJECT in value position
    // (highcharts-react's `highcharts?: typeof Highcharts` prop). Its hundreds of members are
    // useless to model structurally, but the value must be PASSABLE: an abstract nominal type in
    // the InstanceTypes sink lets the consumer thread the module object through untouched (they
    // hold it via their own import binding). Was: opaque → loose `string`, which can never carry
    // the module object, forcing an %identity cast downstream. (#98)
    if (ctx.shared && type.symbol && (type.symbol.flags & ts.SymbolFlags.ValueModule)) {
        const raw = type.symbol.getName().replace(/^"|"$/g, '')
        const last = raw.split(/[\\/]/).pop().replace(/\.d\.(m|c)?ts$|\.(m|c)?ts$/, '') || 'module'
        const key = 'module:' + raw
        let entry = ctx.shared.byKey.get(key)
        if (!entry) {
            entry = { key, kind: 'nominal', name: uniqueName(lower(pascal(last)) + 'Module', ctx.shared), home: INSTANCE_MODULE, deps: new Set() }
            ctx.shared.byKey.set(key, entry)
            ctx.shared.entries.push(entry)
        }
        return { kind: 'classRef', to: entry.name, home: INSTANCE_MODULE }
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
    if (name && REF_NAMES.test(name)) {
        // Read the ref's element type arg: `React.Ref<HTMLInputElement>` ->
        // `React.ref<Nullable.t<Dom.htmlInputElement>>` (specificity), handling a
        // `HTMLElement | null` arg by stripping null. Falls back to the generic ref when
        // the arg isn't a concrete element. (#34, probe I-8)
        const arg = ((checker.getTypeArguments && checker.getTypeArguments(type)) || type.aliasTypeArguments || [])[0]
        const argParts = arg && arg.isUnion?.() ? arg.types : [arg]
        const elemPart = (argParts || []).find((t) => { const n = t && typeName(t); return n && /Element$/.test(n) && /^(HTML|SVG)/.test(n) })
        const en = elemPart && typeName(elemPart)
        if (en && DOM_ELEMENT_BY_LOWER.has(en.toLowerCase())) {
            // In component-PROP position (depth 0) the consumer must CREATE the ref, and ReScript
            // JSX can only produce the generic `React.ref<Nullable.t<Dom.element>>`
            // (`ReactDOM.Ref.domRef`) — an element-specific ref prop is unconstructable without an
            // %identity widening, in every single consumer (#98). Reads of the node don't need the
            // specific element type, so the generic domRef is the USABLE faithful form there.
            // Nested positions (record fields, callback params — the read side) keep specificity.
            if (depth === 0 && !ctx.inRecordField) return { kind: 'domRef' }
            return { kind: 'raw', res: `React.ref<Nullable.t<${domElementType(en)}>>` }
        }
        // An IMPERATIVE-HANDLE ref — `Ref<HighchartsReactRefObject>`, a forwardRef +
        // useImperativeHandle surface. The generic domRef would type the ref's payload as a DOM
        // element, which the handle is not: classify the handle type and keep it —
        // `React.ref<Nullable.t<highchartsReactRefObject>>` (the consumer creates it with
        // `React.useRef(Nullable.null)` and reads the typed handle back). Falls back to the
        // generic domRef when the handle can't be modelled cleanly. (#98 ~ref follow-up)
        const handle = (argParts || []).find((t) => t && (t.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)))
        if (handle && !typeName(handle)?.match(/Element$/)) {
            const node = classify(handle, ctx, propName, depth + 1)
            if (!irHasImperfection(node)) return { kind: 'reactRef', of: node }
        }
        return { kind: 'domRef' }
    }
    // Specific DOM elements -> Dom.htmlDivElement etc. (built-in, no dep);
    // generic Element/Node -> Dom.element/Dom.node.
    if (name && /Element$/.test(name) && /^(HTML|SVG|Dom)/.test(name))
        return { kind: 'raw', res: domElementType(name) }
    if (name === 'Element') return { kind: 'domElement' }
    if (name === 'Node') return { kind: 'raw', res: 'Dom.node' }
    // lib-declaration guarded (isLibraryType) so a package's OWN type named ShadowRoot/
    // LocalesArgument is never silently hijacked into the stdlib mapping. (#39 review)
    if (name === 'ShadowRoot' && isLibraryType(type)) return { kind: 'raw', res: 'Dom.shadowRoot' } // base-ui `container`

    // `Intl.LocalesArgument` (string | Intl.Locale | readonly array) -> `string` with a
    // ⓘ note — a BCP-47 tag ("en-US") is the 99% case; `Intl.Locale` objects aren't
    // modelled. Beats an unexplained review flag on every Meter/NumberField. (#39)
    if (name === 'LocalesArgument' && isLibraryType(type)) return { kind: 'string', note: 'Intl.LocalesArgument — pass a BCP-47 tag ("en-US"); Intl.Locale objects not modelled' }

    // File / FileList / FormData — most-specific-type ladder (#41):
    //   webapi installed -> the FULL ecosystem binding (Webapi.File.t — methods and all);
    //   webapi absent, module mode -> OUR abstract WebTypes sink type (holdable/passable,
    //     honest — previously a flagged opaque that degraded into an UNFLAGGED `string`
    //     inside shared @unboxed unions, e.g. formAction's `Fn(string => 'a)` fake);
    //   single-file mode -> today's flagged opaque (can't emit a second file).
    if (name === 'File') return ctx.webapi ? { kind: 'raw', res: 'Webapi.File.t' } : (ctx.shared ? webSink(ctx, 'File') : { kind: 'opaque', text: 'File' })
    if (name === 'FileList') return ctx.webapi ? { kind: 'raw', res: 'Webapi.FileList.t' } : (ctx.shared ? webSink(ctx, 'FileList') : { kind: 'opaque', text: 'FileList' })
    if (name === 'FormData') return ctx.webapi ? { kind: 'raw', res: 'Webapi.FormData.t' } : (ctx.shared ? webSink(ctx, 'FormData') : { kind: 'opaque', text: 'FormData' })

    // The global `Error` class (lib.es*) -> ReScript stdlib `Error.t`, so an `(e: Error) => void`
    // callback types its param faithfully instead of degrading to a bare/unflagged `string` (in a
    // shared record the param can't salvage to a component type variable). Guarded on a lib.es
    // declaration so a package's OWN `Error` interface is unaffected. (#63 validation)
    if (name === 'Error') {
        const esym = type.aliasSymbol || (type.getSymbol && type.getSymbol())
        const ef = (esym && esym.declarations && esym.declarations[0] && esym.declarations[0].getSourceFile().fileName) || ''
        if (/\/lib\.es/.test(ef)) return { kind: 'raw', res: 'JsError.t' }
    }

    // Web-platform classes (Request, Response, Headers, URL, …) -> abstract types in the
    // dependency-free `WebTypes` sink (module mode only — it's a second output file).
    // lib.dom-declaration guarded, so a package's own `Response` class is unaffected.
    // Single-file mode keeps the flagged fallback below. (#24)
    if (name && ctx.shared && Object.prototype.hasOwnProperty.call(WEB_PLATFORM_TYPES, name) && isWebPlatformDecl(type)) {
        return webSink(ctx, name)
    }

    // A solo DOM event type (`event: FocusEvent`, or distributed per-member event fields)
    // -> `Dom.event`, the built-in supertype. Same rationale as the all-event-union
    // collapse in unionNode — without this, a lib.dom event object hits the library gate
    // and the field goes opaque, poisoning its record (probe I-1/I-6). (#30)
    if (name && /Event$/.test(name) && isWebPlatformDecl(type)) return { kind: 'raw', res: 'Dom.event' }

    // A React synthetic event TYPE in ANY position (param / return / field), not only an `on*`
    // handler prop — e.g. `createStubAnchorClickEvent(): React.MouseEvent<…>` -> `ReactEvent.Mouse.t`.
    // The REACT_EVENTS map was previously consulted only in the handler paths (sigToMembers /
    // functionNode), so a bare event type elsewhere went opaque -> `string`. Gated to React's
    // @types/react declarations: a DOM `MouseEvent` is lib.dom and already became `Dom.event` above,
    // so `!isWebPlatformDecl` leaves it untouched (never hijacks the native event). (#83)
    if (name && Object.prototype.hasOwnProperty.call(REACT_EVENTS, name) && isLibraryType(type) && !isWebPlatformDecl(type))
        return { kind: 'event', res: REACT_EVENTS[name] }

    // `Promise<T>` -> `promise<t>` (ReScript built-in). Handled here so async APIs
    // (`json(): Promise<unknown>`, `arrayBuffer(): Promise<ArrayBuffer>`) type as real
    // promises instead of falling to the library-object gate; an unresolvable `T` still
    // flags the whole prop via the imperfection walker. (#24)
    if (name === 'Promise') {
        const arg = ((checker.getTypeArguments && checker.getTypeArguments(type)) || type.aliasTypeArguments || [])[0]
        if (arg && (arg.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined))) return { kind: 'promise', of: { kind: 'unit' } }
        return { kind: 'promise', of: arg ? classify(arg, ctx, propName, depth + 1) : { kind: 'unknown', text: 'Promise' } }
    }

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

    // An intersection of ARRAY types — `SelectDrawerItem[] & Array<SelectDrawerItem & {nestedItems}>`
    // (TS distributes a `& { items: X[] }` override over a base `items: Y[]`). `isArrayType` is
    // FALSE for the intersection, so without this it fell to recordNode and built a bogus record
    // from the array's lib.es prototype methods (all inherited -> `{...JsxDOM.domProps}`, array
    // wrapper lost — NestedSelectDrawer's `items`). Treat it as an array whose element is the
    // intersected element type (TS's number-index type of the array intersection). (#63 review)
    if ((flags & ts.TypeFlags.Intersection) && (type.types || []).length &&
        type.types.every((p) => checker.isArrayType?.(p))) {
        const elem = checker.getIndexTypeOfType(type, ts.IndexKind.Number)
        if (elem) {
            const prevAE = ctx.inArrayElem; ctx.inArrayElem = true
            const of = classify(elem, ctx, propName, depth + 1)
            ctx.inArrayElem = prevAE
            return { kind: 'array', of }
        }
    }

    // enum (real TS enum used as a type)
    if (flags & ts.TypeFlags.EnumLike) {
        return enumNode(type, ctx, propName)
    }

    // Fixed-arity tuple `[number, number]` -> ReScript tuple `(float, float)`. Only a plain
    // fixed tuple of ≥2 elements: ReScript tuples can't express a variadic/rest tuple
    // (`[number, ...string[]]`) or an optional element (`[number, number?]`) — those stay the
    // flagged fallback. A 1-tuple (`[T]` / `[T?]`) has no ReScript tuple form either, but it IS
    // faithfully an `array<T>` (a 0-or-1 sequence — `getItemSlots(): [ReactNode?]` →
    // `array<React.element>`), so map it there instead of collapsing the whole thing to `string`.
    // Elements go in `params` so every type-tree walker traverses them for free. (#65 B5, #83)
    if (checker.isTupleType?.(type)) {
        const tref = type.target || type
        const variadic = (tref.elementFlags || []).some((f) => f & (ts.ElementFlags.Rest | ts.ElementFlags.Variadic | ts.ElementFlags.Optional))
        const elems = checker.getTypeArguments(type) || []
        const classifyElems = () => {
            const prevAE = ctx.inArrayElem; ctx.inArrayElem = true
            const nodes = elems.map((e) => classify(e, ctx, propName, depth + 1))
            ctx.inArrayElem = prevAE
            return nodes
        }
        if (ctx.constValue && tref.readonly && elems.length) {
            const nodes = classifyElems()
            const first = nodes[0]
            if (first && !irHasImperfection(first) && nodes.every((n) => n && !irHasImperfection(n) && typeSig(n) === typeSig(first))) {
                return { kind: 'array', of: first }
            }
        }
        if (elems.length === 1) {
            const prevAE = ctx.inArrayElem; ctx.inArrayElem = true
            const of = classify(elems[0], ctx, propName, depth + 1)
            ctx.inArrayElem = prevAE
            return { kind: 'array', of }
        }
        if (!variadic && elems.length >= 2) {
            const prevAE = ctx.inArrayElem; ctx.inArrayElem = true
            const params = elems.map((e) => classify(e, ctx, propName, depth + 1))
            ctx.inArrayElem = prevAE
            return { kind: 'tuple', params }
        }
    }

    // #109.2: a PURE `interface X extends Array<T> {}` (classnames' `ArgumentArray`, Highcharts'
    // `AxisTickPositionsArray`) IS an array, not a record. `isArrayType` is FALSE for the interface
    // itself, so it fell to `recordNode` which built a bogus record from the Array prototype methods
    // (`{ ...JsxDOM.domProps }`, shape lost). Follow the base to the Array element type. Gated on the
    // interface adding NO OWN members: a HYBRID (`TimeTicksInfoObject extends Array<number> { higherRanks;
    // totalRange }`) can't be both an array and a record in ReScript, so it keeps the record of its own
    // fields (dropping array-indexing) rather than dropping the fields.
    if ((flags & ts.TypeFlags.Object) && type.isClassOrInterface?.() && !checker.isArrayType?.(type)) {
        // Match a genuine `Array<T>` base (isArrayType) OR a `ReadonlyArray<T>` one — `isArrayType` is
        // FALSE for ReadonlyArray, so catch it by symbol name + the library guard (else a first-party
        // `ReadonlyArray` couldn't reach here anyway). Both flatten to `array<T>`. (#144)
        const arrBase = (checker.getBaseTypes?.(type) || []).find((b) =>
            checker.isArrayType?.(b) || (b.getSymbol?.()?.getName?.() === 'ReadonlyArray' && isLibraryType(b)))
        // "No own members" is measured against the resolved property SET, not the first declaration's
        // syntax — so DECLARATION MERGING (`interface M extends Array<T> {}` + `interface M { extra }`)
        // is handled: `extra` is in `getProperties()` (which merges all declarations) but not in the
        // Array base, so the delta is non-empty and M keeps its record (no silent field drop). (#109.2 rev)
        const baseProps = arrBase && new Set((arrBase.getProperties?.() || []).map((p) => p.getName()))
        const ownProps = arrBase && (type.getProperties?.() || []).filter((p) => !baseProps.has(p.getName()))
        const elem = arrBase && ownProps.length === 0 && (checker.getTypeArguments?.(arrBase) || [])[0]
        if (elem) return { kind: 'array', of: classify(elem, ctx, propName, depth + 1) }
    }

    // arrays
    if (checker.isArrayType?.(type)) {
        const elem = checker.getTypeArguments(type)[0]
        // A single array of a MIXED union — `(DateRangePreset | CustomPresetConfig |
        // CustomPresetDefinition)[]` (DateRangePicker's `PresetsConfig` after the lib collapsed its
        // `A[] | B[] | … | (A|B|C)[]` to just the general arm). Its element is multiple object/record
        // shapes that can't be `@unboxed`-discriminated, so bind it as the same opaque-module-views as
        // the union-of-arrays form — `opaqueUnion` directly on the distinct element members. Done HERE
        // (not via `unionNode`'s isStructured-gated path) because the record arms are `type X = {…}`
        // aliases of object literals (`__type` symbol), which that gate rejects → `string`. Named after
        // the array's alias so `(A|B|C)[]` and `A[]|…|(A|B|C)[]` yield the SAME binding (no churn). (#65 ↩)
        if (elem && elem.isUnion && elem.isUnion()) {
            const members = unionMembers(checker, elem)
            const objArms = members.filter((m) => asArray(m, checker) || checker.isTupleType?.(m) ||
                ((m.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)) && m.getProperties && m.getProperties().length))
            if (objArms.length >= 2) {
                const opaque = opaqueUnion(ctx, elem, members, propName, depth, type.aliasSymbol ? { nameHint: typeName(type) } : {})
                if (opaque) return { kind: 'array', of: opaque }
            }
        }
        // A bounded tagged-tuple union element (SVG path data) is safe to classify past MAX_DEPTH
        // (it can't expand unboundedly) — reset depth so it reaches the opaque-module path. (#72)
        const ed = isBoundedTaggedTupleUnion(elem, checker) ? 0 : depth + 1
        const prevAE = ctx.inArrayElem; ctx.inArrayElem = true // element-record field-any may go generic (#50)
        const of = classify(elem, ctx, propName, ed)
        ctx.inArrayElem = prevAE
        return { kind: 'array', of }
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
    // `{ [k: string]: V }` — a string-index map with no named props -> `Dict.t<V>`. A NUMERIC index
    // (`{ [n: number]: V }`, #109.6) is the same at runtime (JS object keys are always strings), so it
    // maps to `Dict.t<V>` too instead of collapsing to an opaque `JSON.t`.
    const strIndex = checker.getIndexInfoOfType?.(type, ts.IndexKind.String) || checker.getIndexInfoOfType?.(type, ts.IndexKind.Number)
    if (strIndex && type.getProperties().length === 0) {
        return { kind: 'dict', of: classify(strIndex.type, ctx, propName, depth + 1) }
    }

    // functions / callbacks
    const callSigs = type.getCallSignatures()
    if (callSigs.length) {
        // First-party signature selection, shared by the callable-with-properties and overload
        // paths. NOT every multi-call-signature type is a real overload:
        //   (a) a MERGED function property reports an inherited signature too — `onClick?:
        //       (e?: MouseEvent) => void` (own) merged with `@types/react`'s `MouseEventHandler`
        //       (Button.onClick). The FIRST-PARTY signature is the library's intent.
        //   (b) an OPTIONAL parameter expands ONE declaration into several sigs (`(e?: X) => void`
        //       -> `() => void` + `(e: X) => void`).
        // In both, use the most-complete relevant signature so the param maps to `option<…>`,
        // not a misleading opaque overload module. A GENUINE overload (≥2 separate first-party
        // declarations) still becomes the views module so no overload is dropped. (#65 B4)
        const ownSigs = callSigs.filter((s) => s.declaration && !isVendorDecl(s.declaration))
        const effective = ownSigs.length ? ownSigs : callSigs
        const decls = new Set(effective.map((s) => s.declaration).filter(Boolean))
        const collapsed = (effective.length === 1 || decls.size === 1)
            ? [effective.slice().sort((a, b) => b.getParameters().length - a.getParameters().length)[0]]
            : effective
        // Callable-with-properties (#103) — i18next's `t`, framer-motion's `motion`, axios
        // instances: the value is a function AND an object; a bare arrow type silently drops
        // the object side. Model it as an opaque module — zero-cost `as*` call view(s) plus
        // runtime-real `@get`/`@send` accessors per carried property.
        const carried = callableOwnProps(type, ctx.checker, ctx.decl)
        if (carried.length) {
            const cm = overloadModule(ctx, type, collapsed, propName, depth, carried)
            if (cm) return cm
            return { kind: 'review', note: `callable with ${carried.length} propert${carried.length === 1 ? 'y' : 'ies'} (${carried.map((p) => p.getName()).join(', ')}) — couldn't be modelled as an opaque module` }
        }
        // Overloaded function — ≥2 first-party call signatures (a TS intersection of call sigs
        // `A & B`, or a multi-call-signature interface). No native ReScript overload type, so
        // model it as an opaque module with one zero-cost `%identity` accessor VIEW per
        // signature (so NEITHER overload is dropped). Falls back to 🔍 review otherwise.
        if (callSigs.length > 1) {
            if (collapsed.length === 1) return functionNode(collapsed[0], ctx, propName, depth)
            const ov = overloadModule(ctx, type, callSigs, propName, depth)
            return ov || { kind: 'review', note: `overloaded function (${callSigs.length} call signatures) — no single ReScript type` }
        }
        return functionNode(callSigs[0], ctx, propName, depth)
    }

    // unions
    if (flags & ts.TypeFlags.Union) {
        // SELF-RECURSION guard (#72): a union that transitively references itself (clsx's
        // `ClassValue = string | number | ClassValue[]`) must not unroll into a per-depth monster.
        // Track active union ids on a stack; on re-entry into the same union, terminate the cycle
        // as the opaque value `JSON.t` (so e.g. the self `ClassValue[]` arm becomes
        // `array<JSON.t>` and the union stays a single finite `@unboxed`). Plain REUSE of a union
        // in two positions is separate classify calls (stack popped between them) and unaffected.
        if (type.id != null) {
            ctx.unionStack = ctx.unionStack || new Set()
            if (ctx.unionStack.has(type.id)) return { kind: 'raw', res: 'JSON.t' }
            ctx.unionStack.add(type.id)
            try { return unionNode(type, ctx, propName, depth) }
            finally { ctx.unionStack.delete(type.id) }
        }
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

    // VENDOR-record exception (#39): a dependency-declared object type the gate above
    // refused (e.g. @floating-ui's `Rect`/`VirtualElement` — consumer-CONSTRUCTED, so an
    // opaque sink can't serve it) gets ONE sandboxed extraction attempt; accepted only
    // if every field of every pulled entry is imperfection-free (else full rollback,
    // honest flag kept). Platform surfaces (lib.*, @types, csstype) never qualify.
    if (isObjectish && type.getProperties().length > 0 && isLibraryType(libCore) && isVendorLibType(libCore) && !isWebPlatformDecl(type)) {
        const sym = type.getSymbol() || type.symbol
        const symName = sym && sym.getName()
        const cap = (n) => (n && /^[A-Z]/.test(n) ? n : null)
        const named = cap(typeName(libCore)) || cap(symName && symName !== '__type' ? symName : null)
        const trial = trialVendorRecord(type, ctx, propName, named)
        if (trial) return trial
    }

    // An EMPTY object type (`interface ComboboxEmptyState {}` — base-ui's stateless
    // components): zero fields to model, but a real object arrives at runtime ->
    // `JSON.t`, the same honest opaque-value mapping `unknown` gets. Without this,
    // `{}` fell to opaque and rendered as an UNFLAGGED `string` param inside shared
    // @unboxed variants (`Fn(string => string)` — the #41 fake). (#41)
    if (isObjectish && type.getProperties().length === 0 && !type.getCallSignatures().length) {
        return { kind: 'raw', res: 'JSON.t' }
    }

    // A bare untyped global `Function` (Highcharts `proj4`, `pointDescriptionFormatter?: Function`,
    // records' `complete?/step?: Function`) has no signature to type but IS a callable runtime leaf.
    // Bind it to the shared hand-authored `JsFn` opaque module — honest, non-imperfect, zero-cost,
    // consumer-usable — instead of a flagged `string`. Module mode only (like the other %identity
    // strategies; --stdout has no shared file to write). (#120)
    if (ctx.shared && isBareFunction(type)) {
        ctx.shared.usesJsFn = true
        return { kind: 'raw', res: 'JsFn.t', note: 'was `Function` — build with JsFn.fromFn0/1/2/3, read with JsFn.asFn0/1/2/3' }
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
            // `num` marks a NUMERIC enum member (`vertical = 0`) so emit prints `@as(0)` (the int
            // runtime value), not `@as("0")` — a string tag would mismatch the library at runtime. (#63)
            members.push({ as: String(value), ctor: pascal(basis), num: typeof value === 'number' })
        }
    }
    dedupeCtors(members) // case-only collisions ('a' vs 'A' -> A, A2) (#33)
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

/** True when a syntactic type node is `<primitive> | null` (in any order, `| undefined`
 *  allowed too) — exactly ONE primitive keyword (number/string/boolean) plus an explicit
 *  `null`, no other members. Used to recover the explicit-null arm that strictNullChecks-off
 *  resolution swallowed. (#34, I-5) */
function syntacticNullability(typeNode) {
    if (!typeNode || !ts.isUnionTypeNode(typeNode)) return null
    let hasNull = false, hasUndef = false, nonNull = 0
    for (const m of typeNode.types) {
        const isNull = m.kind === ts.SyntaxKind.NullKeyword ||
            (ts.isLiteralTypeNode(m) && m.literal.kind === ts.SyntaxKind.NullKeyword)
        if (isNull) hasNull = true
        else if (m.kind === ts.SyntaxKind.UndefinedKeyword) hasUndef = true
        else nonNull++
    }
    // `single`: exactly one non-null/undefined member, so `T | null` wraps cleanly as
    // `Nullable.t<T>` (a multi-arm `A | B | null` is a real union, handled elsewhere).
    return { hasNull, hasUndef, single: nonNull === 1 }
}

/** A prop typed by indexed access into an OPTIONAL source prop — `value: StatCardV2Props["value"]`
 *  where `StatCardV2Props.value?` is optional — resolves to `T | undefined`, so this field can be
 *  omitted too. strictNullChecks is off (undefined is stripped from both the syntactic and resolved
 *  types), so recover it from the referenced property's optional flag. (#63 C5) */
function indexedAccessOptional(typeNode, checker) {
    if (!typeNode || !ts.isIndexedAccessTypeNode(typeNode)) return false
    const idx = typeNode.indexType
    if (!ts.isLiteralTypeNode(idx) || !ts.isStringLiteral(idx.literal)) return false
    const objType = checker.getTypeFromTypeNode(typeNode.objectType)
    const prop = objType && objType.getProperty(idx.literal.text)
    if (!prop || !(prop.getFlags() & ts.SymbolFlags.Optional)) return false
    // Only propagate optionality from a FIRST-PARTY source. csstype / styled-components CSS-value
    // types (`CSSObject`, `Properties`, …) mark EVERY property optional by convention, so
    // `CSSObject['fontSize']` looks optional even when the consuming field is declared REQUIRED
    // (ResponsiveText.fontSize). Only a first-party props type's optionality is meaningful
    // (StatCardV2Props['value']). (#64)
    const d = prop.declarations && prop.declarations[0]
    const f = (d && d.getSourceFile && d.getSourceFile().fileName) || ''
    if (/node_modules\/(csstype|styled-components|@emotion|@types)\b/.test(f)) return false
    return true
}

/** Wrap a base IR type in `Nullable.t<…>` for a syntactic `T | null` (#34/#63 C5) — for ANY
 *  single `T` (primitive, array, record), not just primitives. Skips placeholder/already-
 *  nullable bases (wrapping a flagged `string` in Nullable is noise). */
function applyNullable(baseType, nb) {
    if (!nb || !nb.hasNull) return baseType
    // Wrap for `T | null` AND for a multi-type `(A | B) | null` (e.g. `number | string | null` ->
    // `Nullable.t<[#String|#Number]>`) — the latter previously dropped `| null` (Drawer snap-points).
    // Skip placeholders (wrapping a flagged `string` is noise), an already-nullable, and
    // `React.element` (abstract — its nullability is conventional, not a `Nullable.t<React.element>`).
    if (baseType.kind === 'nullable' || /^(opaque|review|unknown|any|reactElement)$/.test(baseType.kind)) return baseType
    // Skip an OPAQUE-MODULE / views ref (`Anchor.t`, `Container.t`): a multi-object union's null arm
    // is the module's own concern (a `none`/`from*` view), not an outer `Nullable.t<Module.t>` —
    // keeps the opaque-module idiom intact and B2 scoped to value unions (`stringOrNumber`) + records.
    if (baseType.kind === 'typeRef' && /\.t$/.test(baseType.to || '')) return baseType
    return { kind: 'nullable', of: baseType }
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
    const members = dedupeCtors(literals.map((v) => ({ ctor: pascal(String(v)), as: String(v) }))) // (#33)
    members.push({ ctor: 'Custom', type: { kind: 'string' } }) // the `| string` escape hatch
    // `<base>OrString` (matches the `boolOrString` / `stringOrNumber` convention) — the `OrString`
    // signals the open `Custom(string)` arm and leaves the bare name free for the closed enum.
    // No named alias -> path-anchored base, not a bare prop name + churny counter (#96).
    const sname = (baseName ? lower(pascal(baseName)) : stableAnonBase(ctx, null, propName)) + 'OrString'
    if (ctx.shared) {
        // Key by the literal SET (NOT the collapsed `string` type.id, which every `| string`
        // prop shares) so distinct literal sets get distinct types and identical ones dedupe.
        const key = 'lu:' + sname + ':' + literals.join('|')
        if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
        const entry = { key, kind: 'unboxed', name: uniqueName(sname, ctx.shared), base: sname, home: 'CommonTypes', members, deps: new Set() }
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
    const entry = { key, kind, name: uniqueName(base, ctx.shared), base, home: homeOf(type, ctx), deps: new Set(), ...data }
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
function opaqueUnion(ctx, type, memberTypes, propName, depth, opts = {}) {
    if (!ctx.shared) return null // module mode only
    const key = 't:' + type.id
    // carry the entry's `note` (how to construct the opaque value) onto each ref so
    // emit can surface it inline on the prop — even on a memoized cache-hit.
    const ref = (e) => ({ kind: 'typeRef', to: e.name + '.t', home: e.home, key: e.key, ...(e.note ? { note: e.note } : {}) })
    // RECEIVE-position guard (#39 review): a views module is CONSTRUCT-only (`from*`, no
    // `as*` accessors). For a value the library PRODUCES (`ctx.produced === false`, e.g. a
    // callback param) that's an uninspectable black box — strictly worse than the honest
    // 'a salvage / review flag. Literal/none arms are new in #39, so they must never reach
    // a receive position — neither freshly (gate below) nor via the `t:`-cache
    // (entry._construct gate here).
    const received = ctx.produced === false
    const hasLiteralArm = memberTypes.some((mt) => mt.isStringLiteral && mt.isStringLiteral())
    if (received && (hasLiteralArm || opts.addNone)) return null
    if (ctx.shared.byKey.has(key)) {
        const e = ctx.shared.byKey.get(key)
        if (e._construct && received) return null
        return ref(e)
    }
    const { checker } = ctx
    const members = []
    let sawBool = false
    // Collect string-literal arms in one slot (keeps their original position). A SMALL set
    // stays individual ready-made constants (`let clippingAncestors`); a LARGE run (React's
    // `ElementType`/`keyof JSX.IntrinsicElements` expands to ~170 tag literals) collapses to
    // ONE polyvar constructor `external fromTag: [#"a" | #"div" | …] => t` instead of
    // ~340 lines — same exactness (the polyvar admits exactly that set), leak-free. (#53)
    const literalRun = []
    let litSlot = -1
    for (const mt of memberTypes) {
        if (mt.isStringLiteral && mt.isStringLiteral()) {
            if (litSlot < 0) { litSlot = members.length; members.push(null) } // reserve position
            literalRun.push(String(mt.value))
            continue
        }
        // TS expands `boolean` to `true | false` — collapse to ONE fromBool arm. (#39)
        if (mt.flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) {
            if (!sawBool) { sawBool = true; members.push({ type: { kind: 'boolean' }, name: 'Bool' }) }
            continue
        }
        // Anchor a discriminated arm to its own tag so distinct arms at the same prop path get
        // stable, tag-named records (`…TextConfig`) not order-numbered ones (`…Config2`). (#90)
        const disc = discriminantSeg(mt, ctx)
        const node = disc
            ? withPath(ctx, disc, () => classify(mt, ctx, propName, depth + 1))
            : classify(mt, ctx, propName, depth + 1)
        // DEEP imperfection check (#39): a member that is itself clean-KINDED can still
        // carry a fake inside (a callback whose return classified opaque renders as an
        // UNFLAGGED `=> string`). Reject the whole module — flag-don't-fake.
        if (!node || irHasImperfection(node)) return null
        // Constructor-name hint so emit produces clean `from*` names regardless of
        // how the member renders: `Element` -> fromElement, `Element[]` ->
        // fromElements (plural of the element's name), `File`/`File[]` ->
        // fromFile/fromFiles. A FUNCTION arm is named `Fn` (the TS-internal `__type`
        // symbol must not leak as `fromType`). Falls back in emit otherwise.
        // Constructor-name hint. NEVER leak the TS-internal `__type` symbol (anonymous
        // records/intersections like @floating-ui's `ClientRectObject = Prettify<…>`):
        // for an array of an anon element, derive from the element's RENDERED record name
        // (`array<clientRectObject>` -> fromClientRectObjects); a bare anon record from the
        // node's typeRef; a function arm -> `Fn`. (#39 review)
        const elem = asArray(mt, checker)
        const raw = typeName(mt)
        const en = elem && typeName(elem)
        const refName = (n) => (n && n.kind === 'typeRef' ? n.to.replace(/\.t$/, '') : null)
        // A non-array builtin container arm (`Map<string, OnClick>`) has the bare container name
        // (`Map`) for EVERY arm, so distinguish it by its value/element type — `MapOnClick` /
        // `MapOnHover` — else `from*` views collide. (#68)
        const contArg = (t) => {
            const args = (checker.getTypeArguments && (t.objectFlags & ts.ObjectFlags.Reference)) ? checker.getTypeArguments(t) : []
            const last = args[args.length - 1]
            const n = last && typeName(last)
            return (n && n !== '__type') ? pascal(n) : ''
        }
        // A TUPLE arm (SVG path `[cmd, …number]`, #72) is anonymous — name the `from*` view by its
        // ARITY (`Tuple3` -> fromTuple3) so distinct-arity arms don't collide on one ident.
        const name = (node && node.kind === 'tuple')
            ? 'Tuple' + node.params.length
            : elem
            ? (en && en !== '__type' ? en + 's' : (refName(node && node.of) ? refName(node.of) + 's' : undefined))
            : (raw && raw !== '__type' && isBuiltinContainer(mt, checker)) ? (raw + contArg(mt))
            : (raw && raw !== '__type') ? raw
            : (mt.getCallSignatures && mt.getCallSignatures().length) ? 'Fn'
            // A raw arm with NO TS type name — the bare `object` keyword → `JSON.t` (#149). Named from
            // the rendered type (`fromJson`) so it doesn't fall to a bare `fromraw`. Placed LAST so a
            // named raw arm (`HTMLElement` → `Dom.element`, `File` → `Webapi.File.t`) keeps its TS name.
            : refName(node) || (node && node.kind === 'raw' ? pascal(node.res.replace(/\.t$/, '')) : undefined)
        members.push({ type: node, name })
    }
    // Fold the literal run into its reserved slot: collapse a large set to one `tagSet`
    // polyvar arm; keep a small set as individual named constants. (#53)
    if (litSlot >= 0) {
        const uniq = [...new Set(literalRun)]
        const folded = uniq.length >= LITERAL_COLLAPSE_THRESHOLD
            ? [{ tagSet: uniq, name: 'Tag' }]
            : uniq.map((v) => ({ literal: v, name: v }))
        members.splice(litSlot, 1, ...folded)
    }
    // `T | null/void` in a consumer-PRODUCED position (a callback's return, #39):
    // `none` constant (unit cast — `()` compiles to `undefined`, exactly what `void`
    // returns; the library treats null/undefined alike here).
    if (opts.addNone) members.push({ none: true, name: 'none' })
    if (members.length < 2) return null
    // Constructor-ident COLLISION check (#39 review): two literals that camel to the same
    // ident (`'trap-focus'` vs `'trapFocus'`), or two same-named arms, would silently drop
    // a TS variant (emit's `seen` dedup). All-cases-or-flag: reject the module instead.
    // (A `tagSet` arm carries no collision risk — its polyvar values are the raw strings,
    // so `#"trap-focus"` and `#"trapFocus"` stay distinct; only ident-bearing arms count.)
    const identOf = (m) => m.tagSet ? 'fromTag' : m.literal !== undefined ? lower(pascal(m.literal)) : m.none ? 'none' : ('from' + (m.name ? pascal(m.name) : (m.type && m.type.kind) || 'value'))
    const idents = members.map(identOf)
    if (new Set(idents).size !== idents.length) return null
    // MODULE name: named alias/hint wins; an anonymous union is path-anchored, not bare-prop + counter (#96)
    const name = uniqueName(pascal(opts.nameHint || typeName(type) || stableAnonBase(ctx, type, propName)), ctx.shared)
    const deps = new Set()
    for (const m of members) { if (m.type) collectRefKeys(m.type, deps) }
    // Sit with the records it references (first dep's home); else the prop's own
    // domain module (so anonymous prop-unions land in <Component>Types, not Common).
    let home = homeOf(type, ctx)
    if (deps.size) home = depHome(deps, ctx.shared, home) // prefer a non-sink dep's home so a sink never gains an out-edge (#115 pkg)
    // Note telling the caller how to build this opaque value (the `from*` ctors),
    // since the prop only shows `<Module>.t`. Mirrors the Dom-node note convention.
    const ctorName = (m) => m.tagSet ? `${name}.fromTag` : m.literal ? `${name}.${lower(pascal(m.literal))}` : m.none ? `${name}.none` : `${name}.from${pascal(m.name)}`
    const note = members.every((m) => m.name)
        ? `was \`${checker.typeToString(type).replace(/ \| (null|undefined)\b/g, '')}\` — opaque; build with ${members.map(ctorName).join(' / ')}`
        : undefined
    const entry = { key, kind: 'opaque', name, home, members, deps, note, _construct: hasLiteralArm || !!opts.addNone }
    if (members.some((m) => isHighchartsSeriesOptionsNode(m.type))) entry._highchartsSeriesUnion = true
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
    if (t.thisArg && nodeImperfect(t.thisArg)) return true
    if (t.arg && nodeImperfect(t.arg)) return true
    if (Array.isArray(t.params)) return t.params.some(nodeImperfect)
    return false
}

/**
 * Own VALUE properties carried on a callable type — the object side of a
 * callable-with-properties interface/intersection (i18next's `t.locale`, framer-motion's
 * `motion.div`). Vendor/lib-declared members (`FC.displayName`, `Function.bind`) are not the
 * library's own surface and don't qualify; neither does a class-static `prototype`. PHANTOM
 * BRAND markers don't either: a `$`-prefixed name (i18next's `TFunction.$TFunctionBrand`) or a
 * property whose type resolves to `never` (a `never` property can't exist at runtime) is a
 * compile-time-only nominal tag, and counting it would needlessly reroute a plain callable
 * through the opaque-module path. (#103)
 * @param {ts.TypeChecker} checker
 * @param {ts.Node} decl  location for symbol->type resolution
 * @returns {ts.Symbol[]}
 */
function callableOwnProps(type, checker, decl) {
    return (type.getProperties() || []).filter((p) => {
        const n = p.getName()
        if (n === 'prototype' || /^[#_@$]/.test(n)) return false
        const d = p.declarations && p.declarations[0]
        if (!d || isVendorDecl(d)) return false
        try { if (checker.getTypeOfSymbolAtLocation(p, decl).flags & ts.TypeFlags.Never) return false } catch { /* unresolvable: keep — downstream classify flags it */ }
        return true
    })
}

/**
 * An overloaded function (≥2 call signatures) OR a callable-with-properties value (#103) has
 * no native ReScript type. Model it as an opaque-type module with one zero-cost `%identity`
 * ACCESSOR per signature — `external asReason: t => (option<…> => unit) = "%identity"` — so
 * EVERY overload stays callable with no runtime cost (the value passes straight through,
 * unchanged); a lone signature is exposed as `asFn`. Carried properties (`props`) additionally
 * emit runtime-real accessors: `@get external locale: t => string` for data,
 * `@send external setLocale: (t, string) => unit` for methods — no `%identity` involved.
 * The fidelity fallback for "can't @unboxed". Module mode only. Returns the prop's
 * `<Module>.t` typeRef, or null if it can't be modelled cleanly (the caller then flags it 🔍).
 * @param {ts.Symbol[]|null} props  carried value properties (callable-with-properties mode)
 * @returns {{kind:'typeRef', to:string, home:string, key:string} | null}
 */
function overloadModule(ctx, type, callSigs, propName, depth, props = null) {
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
    if (sigs.length < 2 && !(props && props.length)) return null
    if (sigs.length === 1) sigs[0].accessor = 'asFn' // one way to call it — the descriptive per-overload name adds nothing
    const name = uniqueName(pascal(typeName(type) || stableAnonBase(ctx, type, propName)), ctx.shared) // a MODULE name; anonymous -> path-anchored (#96)
    const deps = new Set()
    for (const s of sigs) collectRefKeys(s.fn, deps)
    // Home pick runs TWICE for a callable: this best-effort pass sees only sig-derived deps (props
    // aren't classified yet — nested entries built inside them read `entry.home` for their own
    // naming/home picks, so it must be plausible now), then the pick re-runs after carried-prop
    // classification with the complete dep set (#128). Re-homing post-registration is safe because
    // render homes are LATE-BOUND: makeResolveRef resolves a keyed ref through the registry entry,
    // so refs minted during prop classification (recursion cache, records referencing this module)
    // never strand on a stale mint-time home. For a CALLABLE, both picks are `nonSinkOnly` — a
    // `module <Name> = {…}` never sinks into a primitive sink, even when the SIGNATURE's only dep is
    // a sink (`(x: string|number) => …`); it keeps its own module. Overloads keep the legacy pick.
    const isCallable = !!(props && props.length)
    let home = homeOf(type, ctx)
    if (deps.size) home = depHome(deps, ctx.shared, home, isCallable) // prefer a non-sink dep's home so a sink never gains an out-edge (#115 pkg)
    const entry = { key, kind: 'opaque', variant: isCallable ? 'callable' : 'overload', name, home, sigs, deps, note: '' }
    // Register BEFORE classifying carried properties: a method returning the callable itself
    // (axios' `create(config): AxiosInstance`) must resolve to `<name>.t` via the cache, not
    // recurse forever. Sig nodes are already built, so plain overloads are unaffected.
    ctx.shared.byKey.set(key, entry)
    ctx.shared.entries.push(entry)
    const members = []
    const dropped = []
    if (props && props.length) {
        const prevP = ctx.produced
        for (const p of props) {
            const jsName = p.getName()
            const pt = ctx.checker.getTypeOfSymbolAtLocation(p, ctx.decl)
            const psigs = pt.getCallSignatures()
            if (psigs.length) {
                const fn = functionNode(psigs[0], ctx, jsName, depth + 1)
                if (nodeImperfect(fn)) { dropped.push(jsName); continue }
                members.push({ jsName, fn })
            } else {
                // read OFF the received value — consumer-received, like class getters (#50 review)
                ctx.produced = false
                const node = withPath(ctx, jsName, () => classify(pt, ctx, jsName, depth + 1))
                ctx.produced = prevP
                if (nodeImperfect(node)) { dropped.push(jsName); continue }
                members.push({ jsName, get: node })
            }
        }
        ctx.produced = prevP
        for (const m of members) collectRefKeys(m.fn || m.get, deps)
        entry.props = members
        // #128: prop-derived deps are in — re-run the home pick so a callable whose only deps
        // come from its props co-locates with them (axios-style `defaults: Config`). The SELF
        // dep (a method returning the callable, `create(): Client`) is excluded: it resolves to
        // this entry's own pre-pick home and would out-vote the real prop deps. Safe
        // post-registration because render homes are late-bound (see the pick above).
        // `nonSinkOnly`: a callable whose props are ALL sink-homed (e.g. only `size: string|number`
        // → CommonTypes) keeps its OWN module rather than sinking a `module <Name> = {…}` into a
        // primitive sink — CommonTypes stays the leaf of primitive unions.
        if (deps.size) entry.home = depHome([...deps].filter((k) => k !== key), ctx.shared, entry.home, true)
    }
    const viewList = sigs.map((s) => `${name}.${s.accessor}`).join(' / ')
    entry.note = props && props.length
        ? `was callable-with-properties \`${typeName(type) || 'function'}\` — opaque; call via ${viewList}${members.length ? `; props: ${members.map((m) => m.jsName).join(', ')}` : ''}${dropped.length ? `; ⚠️ propert${dropped.length === 1 ? 'y' : 'ies'} NOT bound (couldn't be typed): ${dropped.join(', ')}` : ''}`
        : `was overloaded \`${typeName(type) || 'function'}\` (${callSigs.length} call signatures) — opaque; view with ${viewList}`
    return ref(entry)
}

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
    // strip null/undefined/void (null/undefined handled by optional). NOTE: the generator
    // runs with strictNullChecks OFF, so `null` is NOT a distinct union member here —
    // `T | null` already collapsed to `T`. The explicit-null case (#34, I-5) is recovered
    // syntactically at the component-prop level (see `syntacticNullable`). In a callback's
    // RETURN position (`ctx.inFnReturn`) a nullish/void arm is real coverage the consumer
    // must be able to produce — remembered here, surfaced as a `none` constant when the
    // return becomes a views module. (#39)
    // consume the syntactic-null hint (set by functionNode for THIS top return union only)
    const synNull = !!ctx.retSynNull
    if (ctx.retSynNull) ctx.retSynNull = false
    const hadNullish = synNull || type.types.some((t) => t.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined | ts.TypeFlags.Void))
    let parts = type.types.filter(
        (t) => !(t.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined | ts.TypeFlags.Void))
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
        if (t.flags & ts.TypeFlags.BigInt) return 'bigint'
        if (t.flags & ts.TypeFlags.Intersection) {
            const p = (t.types || []).map(primOf).find(Boolean)
            if (p) return p
        }
        return null
    }
    const prims = parts.map(primOf)
    if (prims.every(Boolean) && new Set(prims).size === 1) {
        return { kind: prims[0] } // 'string' | 'number' | 'boolean' | 'bigint' — all valid IR kinds
    }

    // Union of FIXED tuples over ONE primitive — `[boolean] | [boolean, boolean] | [boolean,
    // boolean, boolean]` (highcharts-react's `updateArgs`). Every arm is a runtime array of the
    // same element, differing only in LENGTH — which ReScript can't express anyway — so
    // `array<bool>` is the faithful shape. Was: fell through to a loose `string`, which can never
    // carry the array. Same-primitive only: a mixed tuple union stays the flagged fallback. (#98)
    const tupleElem = (t) => {
        if (!checker.isTupleType?.(t)) return null
        const es = checker.getTypeArguments(t) || []
        if (!es.length) return null
        const ps = es.map(primOf)
        return ps.every(Boolean) && new Set(ps).size === 1 ? ps[0] : null
    }
    const tElems = parts.map(tupleElem)
    if (tElems.every(Boolean) && new Set(tElems).size === 1) {
        return { kind: 'array', of: { kind: tElems[0] } }
    }

    // Sync-or-async VALUE: `T | Promise<T>` (hono's `fetch` returns
    // `Response | Promise<Response>`). Emit `promise<t>` with an ⓘ note — `await`
    // handles a bare T at runtime, so the promise view is the usable binding; an
    // @unboxed can't discriminate two object types and 'a would be unsound in
    // return position. (#24)
    if (parts.length === 2) {
        const pi = parts.findIndex((t) => typeName(t) === 'Promise')
        if (pi !== -1) {
            const other = parts[1 - pi]
            const arg = ((checker.getTypeArguments && checker.getTypeArguments(parts[pi])) || parts[pi].aliasTypeArguments || [])[0]
            if (arg && other && arg.id === other.id) {
                const inner = classify(other, ctx, propName, depth + 1)
                return { kind: 'promise', of: inner, note: `upstream is \`${checker.typeToString(other)} | Promise<…>\` — may also return the bare value synchronously; \`await\` handles both` }
            }
        }
    }

    // An all-DOM-event union (`InputEvent | FocusEvent | KeyboardEvent | … | Event` —
    // base-ui's distributed `ReasonToEvent<Reason>` conditionals): collapse to the safe
    // supertype `Dom.event`. Every member is `typeof "object"` so the `@unboxed`
    // discriminability check below can never succeed, and ONE such field used to poison
    // its whole record/callback into a string placeholder (probe I-1b/I-6). (#30)
    if (parts.length >= 2 && parts.every((t) => {
        const n = typeName(t) || ''
        return /Event$/.test(n) && isWebPlatformDecl(t)
    })) return { kind: 'raw', res: 'Dom.event' }

    // A union of instantiations of the SAME generic record — `BaseUIChangeEventDetails<R>`
    // over a 10-literal `R` distributes into 10 record types differing only in field
    // instantiation. Collapse to ONE record over the union's APPARENT members: the checker
    // unions each field across arms (`reason: "a" | "b" | …` -> enum variant, `event:
    // InputEvent | … | Event` -> Dom.event via the branch above). Without this the union
    // fell to an opaque placeholder, taking the whole callback with it (probe I-1). (#30)
    // An arm's identity symbol: direct for Object arms; for Intersection arms
    // (`interface & {}` — how `BaseUIChangeEventDetails<R, CustomProperties = {}>`
    // instantiates) descend to the first constituent that carries one.
    const armSym = (t) => {
        const direct = (t.getSymbol && t.getSymbol()) || t.symbol
        if (direct) return direct
        if (t.flags & ts.TypeFlags.Intersection) {
            for (const m of t.types || []) {
                const s = (m.getSymbol && m.getSymbol()) || m.symbol
                if (s) return s
            }
        }
        return null
    }
    // Guard: a CALLABLE arm (`CSSProperties & ((state) => CSSProperties)`) shares its
    // object constituent's symbol but is runtime-discriminable as a function — that
    // shape belongs to the @unboxed Style|Fn machinery below, not a record collapse.
    // Guard 2: skip when any arm's type ARGUMENTS carry a type parameter
    // (`ColumnDefinition<T> | …` in a generic component) — the collapsed record would
    // need the variable threaded through its reference (`columnDefinition<'a>`), which
    // this path doesn't do; those unions keep the previous (flagged) behavior.
    // (Regression caught by the benchmark gate on blend's DataTable.)
    const armHasTypeParam = (t, d = 0) => {
        if (!t || d > 3) return false
        if (t.flags & ts.TypeFlags.TypeParameter) return true
        if (t.flags & ts.TypeFlags.Intersection) return (t.types || []).some((m) => armHasTypeParam(m, d + 1))
        const args = [...(t.aliasTypeArguments || []), ...((checker.getTypeArguments && (t.objectFlags & ts.ObjectFlags.Reference) && checker.getTypeArguments(t)) || [])]
        return args.some((a) => armHasTypeParam(a, d + 1))
    }
    // Guard 3: skip when the arms are instantiations of a BUILTIN generic container, not a
    // user record. Every `Array<A> | Array<B>` (DateRangePicker's `PresetsConfig`), and equally
    // `Map<A> | Map<B>`, `Set<…>`, `Promise<…>`, `WeakMap<…>`, shares ONE global lib.es symbol
    // across its instantiations, so `armSym` matches across arms and the union would WRONGLY
    // collapse to one record built from the container's prototype methods (all inherited ->
    // `{...JsxDOM.domProps}`, the real shape lost). `#67` closed only arrays (`!isArrayType`);
    // `isBuiltinContainer` closes the whole container class (Map/Set/Promise/WeakMap/…) in one
    // check. NOT the broader `!isLibraryType` — that also excludes `@types`/csstype records that
    // legitimately collapse (regressed hono's `headerRecord` and react-markdown's `HastTypes.readonly`
    // to `string` in the bench). A first-party record like `@base-ui`'s `BaseUIChangeEventDetails<R>`
    // is no container, so the collapse this branch was built for still fires. (#68, was #65/#67)
    if (parts.length >= 2 && type.getProperties().length > 0 && parts.every((t) =>
        !isBuiltinContainer(t, checker) &&
        armSym(t) && armSym(t) === armSym(parts[0]) &&
        (t.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)) &&
        !(t.getCallSignatures && t.getCallSignatures().length) &&
        !armHasTypeParam(t))) {
        const aliasName = type.aliasSymbol && type.aliasSymbol.getName()
        const symName = armSym(parts[0]).getName()
        const named = (aliasName && /^[A-Z]/.test(aliasName)) ? aliasName : (/^[A-Z]/.test(symName || '') ? symName : null)
        return recordNode(type, ctx, propName, depth, named)
    }

    // A union of ANONYMOUS object literals that all share an IDENTICAL key set — e.g. useSkeletonBase's
    // return `{shouldRender,fallback:ReactNode,tokens:null,…} | {…,fallback:null,tokens:SkeletonTokensType,…}`.
    // Each anonymous `{…}` has its OWN `__type` symbol (so the same-generic-record collapse above, which
    // needs a SHARED symbol, misses them), and `isStructured` rejects `__type` objects → the union fell
    // to opaque → `string`. With identical keys they ARE one record whose fields are unioned across arms;
    // collapse via recordNode (the checker unions each field → `fallback: ReactNode|null`,
    // `tokens: null|Tokens` → option fields). Narrow gate (all anon objects + identical keys) keeps a
    // mixed `number | Partial<{…}>` out — arm 1 isn't an object. (#83)
    const isAnonObj = (t) => {
        if (checker.isArrayType?.(t)) return false
        if (t.getCallSignatures && t.getCallSignatures().length) return false
        if (!(t.flags & ts.TypeFlags.Object)) return false
        const s = t.getSymbol && t.getSymbol()
        return !!(s && s.getName() === '__type' && t.getProperties().length)
    }
    if (parts.length >= 2 && parts.every(isAnonObj)) {
        const keysOf = (t) => t.getProperties().map((p) => p.getName()).sort().join(',')
        const k0 = keysOf(parts[0])
        if (parts.every((t) => keysOf(t) === k0)) return recordNode(type, ctx, propName, depth)
    }

    // String-literal union -> `@as` variant. Also covers the `"a" | "b" | (string & {})`
    // open-ended-literal idiom (e.g. `HTMLInputTypeAttribute`): the `string & {}` autocomplete
    // escape is dropped so the binding is a clean shared variant of the known literals
    // (deduped by type.id into one `*Types.res` module, referenced everywhere).
    const isLit = (t) => t.isStringLiteral && t.isStringLiteral()
    const isStrBrand = (t) => (t.flags & ts.TypeFlags.Intersection) && (t.types || []).some((x) => x.flags & ts.TypeFlags.String)
    const litParts = parts.filter(isLit)
    if (litParts.length >= 2 && parts.every((t) => isLit(t) || isStrBrand(t))) {
        const members = dedupeCtors(litParts.map((t) => ({ as: t.value, ctor: pascal(t.value) }))) // (#33)
        // ANONYMOUS union -> path-anchored base (`dataTableColumnsTagColor`), never a bare prop
        // name whose collision counter renumbers on unrelated changes (#96); named alias keeps
        // its own name (#62).
        if (ctx.shared) return registerNamed(ctx, type, 'enum', typeName(type) ? lower(typeName(type)) : stableAnonBase(ctx, type, propName), { members })
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
    // A NARROWED children type — `children: string | number` merged with an inherited
    // `children?: ReactNode` — resolves to `ReactNode & (string | number)`, which TS distributes
    // to `string | number | (ReactElement & string) | (ReactPortal & number) | …`. Every
    // `<reactType> & <primitive>` part is an uninhabitable DISTRIBUTION ARTIFACT (a string isn't a
    // React element); the real inhabitable type is just `string | number`. When there's NO genuine
    // plain React part (a bare `ReactElement`/`ReactNode`, an array of it, or a render fn) but such
    // reactish-intersection artifacts ARE present, keep only the plain (non-intersection) parts so
    // the union resolves to its real narrowed type (`stringOrNumber`) instead of the lossy
    // `React.element`. (#64)
    const isReactishInter = (t) => (t.flags & ts.TypeFlags.Intersection) &&
        (t.types || []).some((x) => /React(Element|Node|Portal|Fragment)/.test(typeName(x) || ''))
    const hasPlainReactish = parts.some((t) => isReactish(t) && !(t.flags & ts.TypeFlags.Intersection))
    if (!hasPlainReactish && parts.some(isReactishInter)) {
        const kept = parts.filter((t) => !(t.flags & ts.TypeFlags.Intersection))
        if (kept.length) {
            parts = kept
            if (parts.length === 1) return classify(parts[0], ctx, propName, depth + 1)
        }
    }
    if (parts.some(isReactish)) {
        // `ReactElement | ((props, state) => ReactElement)` (base-ui's `render` prop).
        // The prop binds as `React.element` (the ergonomic common case — an @unboxed
        // `Element | Fn` does NOT compile: React.element is abstract, and untagged
        // variants need each payload's runtime shape statically known). The FUNCTION
        // form is recovered via a zero-cost `<prop>Fn` %identity wrapper emitted in the
        // component module, typed from the signature's EXACT extracted types — imperfect
        // params salvage to fresh type variables, but an imperfect RETURN drops the
        // helper (a faked return would feed wrong values into the library). (#46)
        const fnPart = parts.find((t) => t.getCallSignatures && t.getCallSignatures().length)
        if (fnPart) {
            const fn = functionNode(fnPart.getCallSignatures()[0], ctx, propName, depth)
            if (!irHasImperfection(fn.ret) && Array.isArray(fn.params) && fn.params.length) {
                fn.params = fn.params.map((p) => (irHasImperfection(p) ? { ...freshTypeVar(ctx), optional: p.optional } : p))
                return { kind: 'reactElement', renderFn: fn, note: `function form: wrap with \`${propName}Fn\` (zero-cost)` }
            }
            return { kind: 'reactElement', note: 'function form of this render prop is not bound — pass a React element' }
        }
        return { kind: 'reactElement' }
    }

    // A union of DOM node/element/fragment types (e.g. a portal `container?: Element |
    // DocumentFragment`) -> `Dom.element` (the ergonomic portal-target type). A note is
    // attached so the consumer knows a fragment / shadow-root target isn't covered.
    const isDomNodeType = (t) => {
        const n = typeName(t)
        // lib.dom-declared only: a vendor type merely NAMED *Element (@floating-ui's
        // VirtualElement — a plain object, not a DOM node) must not be swallowed into
        // Dom.element. (#39, same name-hijack guard family as #40's ShadowRoot fix.)
        return !!(n && (/Element$/.test(n) || n === 'Node' || n === 'DocumentFragment' || n === 'ShadowRoot')) && isWebPlatformDecl(t)
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

    // Union of BUILTIN CONTAINERS — `Map<string, OnClick> | Map<string, OnHover>`, `Set<A> | Set<B>`,
    // `Promise<A> | Promise<B>`. Each arm types cleanly on its own (a single `Map<K,V>` → `Map.t<K,V>`),
    // but all arms are `object` at runtime, so the @unboxed variant below can't discriminate them and
    // would drop the whole union to `string`. Bind it as an opaque module with one construct-only
    // `from*` view per arm — the SAME faithful treatment the array-union above gets. Arms are named by
    // their value/element type (`fromMapOnClick`/`fromMapOnHover`) since the bare container name repeats.
    // (#68 — the union-of-arrays companion for the other lib.es containers)
    if (parts.length >= 2 && parts.every((t) => isBuiltinContainer(t, checker))) {
        const opaque = opaqueUnion(ctx, type, parts, propName, depth)
        if (opaque) return opaque
    }

    // Genuine multi-runtime-type union (string|number, string|string[],
    // boolean|"indeterminate", …). Emit a ReScript UNTAGGED (@unboxed) variant —
    // type-safe AND zero-cost (the raw value reaches JS, no %identity, no wrapper).
    // Sound only when members are runtime-discriminable: at most ONE broad type per
    // JS `typeof` bucket (string/number/boolean/array), but several distinct string/
    // number LITERALS may coexist as bare `@as("…")` constructors (distinct constant
    // values) — e.g. `boolean | "indeterminate"` -> Bool(bool) | @as("indeterminate") Indeterminate.
    // TS expands `boolean` into `true | false`, so collapse those into one `bool`.
    let hasBool = false, hasString = false, hasNumber = false, hasBigInt = false
    const strLits = [], numLits = [], others = []
    let buildable = true
    for (const p of parts) {
        if (p.flags & (ts.TypeFlags.Boolean | ts.TypeFlags.BooleanLiteral)) hasBool = true
        else if (p.flags & ts.TypeFlags.StringLiteral) strLits.push(p)
        else if (p.flags & ts.TypeFlags.NumberLiteral) numLits.push(p)
        else if (p.flags & ts.TypeFlags.String) hasString = true
        else if (p.flags & ts.TypeFlags.Number) hasNumber = true
        // `bigint` is its own JS `typeof` bucket; broad `bigint` AND bigint literals (`1n`) fold
        // into one `Big(bigint)` arm (no `@as` for bigint literals).
        else if (p.flags & (ts.TypeFlags.BigInt | ts.TypeFlags.BigIntLiteral)) hasBigInt = true
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
        if (hasBigInt && claim('bigint')) members.push({ ctor: uniqueCtor('Big'), type: { kind: 'bigint' } })
        for (const m of others) { if (!claim(m.rt)) { buildable = false; break } members.push({ ctor: uniqueCtor(m.ctor), type: m.type }) }

        if (buildable && members.length >= 2) {
            // Name by STRUCTURE so identical unions share one type — EXCEPT function-bearing
            // ones (a signature has no short structural token), which are named after the
            // prop (`formAction`, `virtualItemHeight`). A member using a type variable (a
            // sync-or-async `=> 'a` return) makes the variant generic (`formAction<'a>`).
            const hasFn = members.some((m) => m.type && m.type.kind === 'callback')
            const deps = new Set()
            for (const m of members) collectRefKeys(m.type, deps)
            // Function-bearing variants can't be named structurally (a signature has no short
            // token) — anchor by path, not the bare prop name + churny counter (#96).
            let sname = hasFn ? stableAnonBase(ctx, type, propName) : unboxedName(members)
            // A fn-bearing union over ONE record/enum (base-ui's per-component
            // `style`/`className` over its state record) is named after that dep
            // (`accordionRootState` + `style` -> `accordionRootStyle`) — otherwise 178
            // same-prop unions would degrade to style2..style178. (#22)
            if (hasFn && ctx.shared && deps.size === 1) {
                const d = ctx.shared.byKey.get([...deps][0])
                if (d && d.name) sname = lower(pascal(d.name.replace(/State$/, '')) + pascal(propName))
            }
            const tvars = new Set()
            for (const m of members) collectTypeVars(m.type, tvars)
            const tparams = tvars.size ? [...tvars] : undefined
            if (ctx.shared) {
                // Primitive-only variants have no TS source -> home `CommonTypes`. A variant
                // referencing a record/enum (object payload, or a fn over `menuItemType`)
                // lives WITH that type's module so `CommonTypes` stays a dependency-free sink
                // and never gets SCC-merged. Deduped via the structural `u:` key — the name
                // alone is NOT the key: two components sharing a prop name but differing in
                // payload (per-component state records) must get two distinct types. (#22)
                const key = 'u:' + sname + ':' + members.map((m) => (m.as !== undefined ? '@' + m.as : typeSig(m.type))).join('|')
                if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
                let home = 'CommonTypes'
                if (deps.size) home = depHome(deps, ctx.shared, home) // prefer a non-sink dep's home so a sink never gains an out-edge (#115 pkg)
                const entry = { key, kind: 'unboxed', name: uniqueName(sname, ctx.shared), base: sname, home, members, deps, tparams }
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
    // A TAGGED tuple — a fixed tuple whose FIRST element is a string-literal (or literal-union), i.e.
    // a discriminant-headed `[cmd, …payload]` (SVG path segments, #72). Only these become opaque-module
    // views; an UNtagged tuple union (hono's `(handler, route)`) is left to its existing behavior.
    const isTaggedTuple = (t) => {
        if (!checker.isTupleType?.(t)) return false
        const ps = checker.getTypeArguments(t) || []
        if (!ps.length) return false
        const head = ps[0]
        const lits = (head.isUnion && head.isUnion()) ? head.types : [head]
        return lits.length > 0 && lits.every((h) => h.flags & ts.TypeFlags.StringLiteral)
    }
    const isStructured = (t) => {
        if (t.getCallSignatures && t.getCallSignatures().length) return true // function
        if (isTaggedTuple(t)) return true // tagged tuple (SVG path `[cmd, …number]` arms, #72)
        if (asArray(t, checker)) return true // array
        if (t.flags & ts.TypeFlags.NonPrimitive) return true // the bare `object` keyword → a `JSON.t` arm (#149)
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
            if (isTaggedTuple(t)) return true // tagged tuple arm (#72)
            if (asArray(t, checker)) return true
            if (t.flags & ts.TypeFlags.NonPrimitive) return true // bare `object` keyword → `JSON.t` arm (#149)
            // An INTERSECTION object (`TextInputV2Dropdown = SingleSelectV2Props & { position }`) usually
            // has no `getSymbol()` of its own (only an aliasSymbol), so it was dropped here — leaving an
            // `Obj | Obj[]` union with just 1 structured part → `string`. Count it by its properties so
            // `Obj | Obj[]` reaches `opaqueUnion`. (#79)
            if (t.flags & ts.TypeFlags.Intersection) return (t.getProperties && t.getProperties().length) > 0
            const s = t.getSymbol && t.getSymbol()
            return (t.flags & ts.TypeFlags.Object) && s && t.getProperties().length
        })
        if (structuredParts.length >= 2) {
            const opaque = opaqueUnion(ctx, type, unionMembers(checker, type), propName, depth, retViewOpts(ctx, propName, hadNullish))
            if (opaque) return opaque
        }
        // Consumer-PRODUCED return union (`(closeType) => boolean | HTMLElement | null | void`,
        // #39): even ONE structured arm qualifies for a views module here, because the
        // consumer only needs to CONSTRUCT the value — `FinalFocusTarget.fromBool(true)` /
        // `.fromHTMLElement(el)` / `.none`. Construct-only is complete coverage in this
        // direction; in receive positions the honest flag stays.
        if (ctx.inFnReturn && ctx.produced !== false) {
            const v = opaqueUnion(ctx, type, parts, propName, depth, retViewOpts(ctx, propName, hadNullish))
            if (v) return v
        }
        return { kind: 'review', text: checker.typeToString(type) }
    }
    if (ctx.inFnReturn && ctx.produced !== false) {
        const v = opaqueUnion(ctx, type, parts, propName, depth, retViewOpts(ctx, propName, hadNullish))
        if (v) return v
    }
    return { kind: 'opaque', text: checker.typeToString(type) }
}

/** opaqueUnion options for a callback-RETURN position: a `none` constant when the TS
 *  return allows null/void, and a `<Prop>Target` module name. (#39) */
function retViewOpts(ctx, propName, hadNullish) {
    if (!ctx.inFnReturn || ctx.produced === false) return {}
    return { addNone: !!hadNullish, nameHint: pascal(propName) + 'Target' }
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
 * A PROVABLY-BOUNDED leaf shape (#72): an array element that is a union whose every arm is a TAGGED
 * tuple (`[string-literal head, …string|number]`) and/or `Array<literal|primitive>` — the SVG
 * path-data shape (`Array<SVGPathCommand> | [SVGPathCommand, number] | …`). It bottoms out at
 * literals/numbers in ≤2 levels (no records, no object/union refs), so it CANNOT expand unboundedly —
 * safe to classify even past `MAX_DEPTH` (the depth bound exists only to truncate UNBOUNDED record
 * graphs). Lets the deep Highcharts `d` reach the opaque-module-views path instead of `array<JSON.t>`.
 * Requires ≥1 tagged tuple (the discriminant) so plain primitive-array unions don't match.
 */
function isBoundedTaggedTupleUnion(elem, checker) {
    if (!elem || !(elem.isUnion && elem.isUnion())) return false
    const PRIM = ts.TypeFlags.String | ts.TypeFlags.StringLiteral | ts.TypeFlags.Number |
        ts.TypeFlags.NumberLiteral | ts.TypeFlags.EnumLike
    let sawTagged = false
    for (const a of elem.types) {
        if (checker.isTupleType?.(a)) {
            const ps = checker.getTypeArguments(a) || []
            if (!ps.length) return false
            const head = ps[0]
            const lits = (head.isUnion && head.isUnion()) ? head.types : [head]
            if (!(lits.length && lits.every((h) => h.flags & ts.TypeFlags.StringLiteral))) return false
            for (let i = 1; i < ps.length; i++) if (!(ps[i].flags & PRIM)) return false
            sawTagged = true
        } else {
            const ae = asArray(a, checker)
            if (!ae) return false
            const lits = (ae.isUnion && ae.isUnion()) ? ae.types : [ae]
            if (!lits.every((h) => h.flags & PRIM)) return false
        }
    }
    return sawTagged
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
    if (t.flags & (ts.TypeFlags.BigInt | ts.TypeFlags.BigIntLiteral)) return { ctor: 'Big', rt: 'bigint', type: { kind: 'bigint' } }
    const elem = asArray(t, c)
    if (elem) {
        // inArrayElem: an element record's field-`any` may become a generic (`item<'a>`) —
        // it threads cleanly through `array<…>` (proven by `items`). Set BEFORE memberOf,
        // which is what actually builds the element record. (#50)
        const prevAE = ctx.inArrayElem; ctx.inArrayElem = true
        const inner = memberOf(elem, ctx, propName, depth)
        // bounded tagged-tuple union element (SVG path data) — safe past MAX_DEPTH (#72)
        const ed = isBoundedTaggedTupleUnion(elem, c) ? 0 : depth + 1
        let elemType = inner ? inner.type : classify(elem, ctx, propName, ed)
        ctx.inArrayElem = prevAE
        // HONEST-OPAQUE element (#72): an array whose element can't be modelled (opaque/review/
        // unknown) must NOT silently fake the element as `string` (old `Arr(array<string>)`), and
        // must NOT drop the whole arm (the #71 regression → bare `string`). Keep the array and type
        // the element as `JSON.t` — the sanctioned opaque-value mapping — so `string | X[]` stays
        // `Str(string) | Arr(array<JSON.t>)`. (A self-recursive union bottoms out at the unionNode
        // recursion guard → JSON.t, so it stays finite here too.)
        if (irHasImperfection(elemType)) elemType = { kind: 'raw', res: 'JSON.t' }
        const ctor = inner ? inner.ctor + 'Arr' : 'Arr'
        return { ctor, rt: 'array', type: { kind: 'array', of: elemType } }
    }
    // A single function member -> runtime `typeof "function"` (distinct from string/number/
    // boolean/object/array). Only ONE allowed (`claim('function')` enforces it). Enables
    // `string | (fn)` (formAction) and `number | (fn)` (virtualItemHeight) as @unboxed.
    // FLAG-DON'T-FAKE GATE on the RETURN: a fn member whose return classified
    // opaque/review/unknown returns null so the WHOLE prop keeps its honest ⚠️ REVIEW
    // flag — inside a shared @unboxed the fake would render as an UNFLAGGED
    // `=> string` (e.g. finalFocus's `=> boolean | void | HTMLElement | null`) that
    // actively feeds wrong values INTO the library. (Caught by code review on #39's
    // PR.) PARAM imperfections are SALVAGED instead of gated (#41): each unmodellable
    // param becomes a fresh type variable — `Fn('x => …)` — the type system's own
    // "you receive something unnameable" signal (params flow library -> consumer, so
    // a hole the consumer must annotate beats both a fake `string` and losing the
    // whole otherwise-good callback).
    if (t.getCallSignatures && t.getCallSignatures().length) {
        const fn = functionNode(t.getCallSignatures()[0], ctx, propName, depth)
        if (irHasImperfection(fn.ret)) return null
        if (Array.isArray(fn.params) && fn.params.some(irHasImperfection)) {
            fn.params = fn.params.map((p) => (irHasImperfection(p) ? freshTypeVar(ctx) : p))
        }
        return { ctor: 'Fn', rt: 'function', type: fn }
    }
    // NB: a bare untyped `Function` arm (`easing?: string | Function`) is deliberately NOT given an
    // `@unboxed` member — its `JsFn.t` payload is an ABSTRACT type, so ReScript can't statically know
    // its runtime tag to discriminate the untagged variant (same limit as `React.element`, #46). Such
    // a union falls back to the honest loose `string` rather than an uncompilable `@unboxed`. (#120)
    // NOTE: an INTERSECTION arm with a call signature (`CSSProperties & ((state) =>
    // CSSProperties)`, base-ui's resolved style shape) is caught by the branch above —
    // the checker surfaces constituents' call signatures on the intersection, and at
    // runtime the value IS a function, so `Fn` is the honest mapping. (#22)

    // A `CSSProperties` member -> runtime `typeof "object"` (one allowed via
    // claim('object')). Enables base-ui's `style: CSSProperties | ((state) =>
    // CSSProperties)` as `@unboxed Style(JsxDOM.style) | Fn(state => JsxDOM.style)`
    // — exact and zero-cost. (#22)
    if (typeName(t) === 'CSSProperties') return { ctor: 'Style', rt: 'object', type: { kind: 'style' } }

    // A Ref-family member (`RefObject<HTMLElement>`) -> runtime `typeof "object"`,
    // rendered as the standard ref type — same name list classify() uses for solo ref
    // props (shared REF_NAMES). Enables `boolean | RefObject<…> | (fn)` (base-ui's
    // initialFocus/finalFocus) as `@unboxed Bool | Ref | Fn`. (#39)
    if (REF_NAMES.test(typeName(t) || '')) {
        return { ctor: 'Ref', rt: 'object', type: { kind: 'domRef' } }
    }

    // A `Record<string, V>` / `{ [k: string]: V }` member -> runtime object (a dict),
    // distinct from an array arm (`Array.isArray`) and the single allowed object arm via
    // `claim('object')`. Enables `Record<string, ReactNode> | Array<…>` (Select's `items`)
    // as `@unboxed Dict(Dict.t<…>) | Items(array<…>)`. Purely STRUCTURAL (string index, no
    // named props), so — unlike the named-object arm below — it does NOT exclude library
    // types: `Record` itself is declared in lib.es5. (#50)
    const isObjectish = t.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)
    if (isObjectish && t.getProperties().length === 0) {
        const si = c.getIndexInfoOfType && c.getIndexInfoOfType(t, ts.IndexKind.String)
        if (si && si.type) return { ctor: 'Dict', rt: 'object', type: { kind: 'dict', of: classify(si.type, ctx, propName, depth + 1) } }
    }

    // A single ANONYMOUS inline-object member (e.g. `string | { key, color }`) -> runtime
    // `typeof "object"` (distinct from string/number/boolean/array). Only ONE is allowed
    // (two objects can't be discriminated); `claim('object')` in unionNode enforces that.
    // Restricted to anonymous literals (`__type`): expanding a NAMED cross-domain object
    // here would pull large interconnected graphs (e.g. Highcharts) into one SCC.
    const sym = t.getSymbol && t.getSymbol()
    if (isObjectish && (sym && sym.getName()) === '__type' && t.getProperties().length > 0 && !isLibraryType(t)) {
        const node = classify(t, ctx, propName, depth + 1)
        if (node && node.kind === 'typeRef' && !node._enum && !node._unboxed) {
            return { ctor: pascal(node.to), rt: 'object', type: node }
        }
    }
    // A single NAMED object arm is normally NOT expanded (a cross-domain named object pulls large
    // interconnected graphs into one SCC). BUT a PROVABLY-BOUNDED record (all-leaf / shallow,
    // cycle-guarded) is safe: it materializes as a bounded subtree, so `boolean | ShadowOptionsObject`
    // becomes `@unboxed Bool | Shadow` and `CSSObject | TooltipStyleOptions` an object views union,
    // instead of the whole field collapsing to a `string` REVIEW. The bounded gate is exactly what
    // the exclusion above was protecting against. (#115 item 1)
    if (isObjectish && sym && sym.getName() && sym.getName() !== '__type' &&
        t.getProperties().length > 0 && t.getCallSignatures().length === 0 &&
        boundedPastDepth(t, ctx, c, PAST_BOUND_CAP, new Set())) {
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
            case 'bigint': return 'BigInt'
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
    // POLARITY (#39 review): `ctx.produced` tracks who constructs the value being
    // classified (true/undefined = the CONSUMER produces it — prop values, returns of
    // consumer-provided callbacks; false = the LIBRARY produces it — callback params).
    // It FLIPS at each fn boundary: for a fn of polarity P, params are !P and the return
    // is P. Construct-only views (literal/none arms) are only sound where produced holds.
    // inFnReturn must also not leak from an enclosing return into nested params.
    const P = ctx.produced !== false
    const prevRet = ctx.inFnReturn, prevProduced = ctx.produced
    ctx.inFnReturn = false
    ctx.produced = !P
    // A `this`-typed callback — `(this: Point, tooltip: Tooltip) => …` (Highcharts formatters):
    // JS invokes the consumer's function with `this` bound to the DATA CARRIER. Dropping it
    // produced a callback that type-checks but can't reach the value it's about (the tooltip
    // formatter's Point). ReScript expresses this exactly — `@this ((point, tooltip) => …)`,
    // where the first param binds `this` — so classify it like a param (library-produced). (#98)
    const thisArg = sig.thisParameter
        ? classify(checker.getTypeOfSymbolAtLocation(sig.thisParameter, ctx.decl), ctx, propName, depth + 1)
        : null
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
        let node = (n && Object.prototype.hasOwnProperty.call(REACT_EVENTS, n))
            ? { kind: 'event', res: REACT_EVENTS[n] }
            : classify(pt, ctx, propName, depth + 1)
        // A callback PARAM typed `T | null` (e.g. `(item: string | null) => void`) is a value the
        // library PASSES to the consumer, so the consumer must handle null -> `Nullable.t<T>`.
        // strictNullChecks-off strips it from the resolved type; recover from the syntactic node,
        // mirroring the return path's `| null` recovery and top-level props. (#63 validation)
        if (!optional && node.kind !== 'event' && pdecl && ts.isParameter(pdecl) && pdecl.type) {
            node = applyNullable(node, syntacticNullability(pdecl.type))
        }
        return optional ? { ...node, optional: true } : node
    })
    ctx.inFnReturn = prevRet
    ctx.produced = prevProduced
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
        if (retVoid) {
            ret = { kind: 'unit' }
        } else {
            // Mark the RETURN position: a return of polarity P keeps the fn's polarity —
            // for a consumer-provided callback (P=true) the return is CONSUMER-produced,
            // so a non-discriminable union may become a construct-only views module
            // (`FinalFocusTarget.fromBool/…/none`) instead of a review flag. (#39)
            // An explicit `| null` in the return is REAL coverage the consumer must be
            // able to produce, but strictNullChecks-off absorbs it from the resolved
            // type — recover it from the SYNTACTIC return node (the I-5 technique).
            const retNode = sig.declaration && sig.declaration.type
            const synNull = !!(retNode && ts.isUnionTypeNode(retNode) && retNode.types.some((m) =>
                m.kind === ts.SyntaxKind.NullKeyword || (ts.isLiteralTypeNode(m) && m.literal.kind === ts.SyntaxKind.NullKeyword)))
            const prev = ctx.inFnReturn, prevNull = ctx.retSynNull, prevProd = ctx.produced
            ctx.inFnReturn = true
            ctx.retSynNull = synNull
            ctx.produced = P
            ret = classify(retType, ctx, propName, depth + 1)
            // A SINGLE-typed nullable return (`(file) => Errors | null`) collapses to `Errors`
            // under strictNullChecks-off and isn't a union, so the union path's `| null` recovery
            // never fires — wrap it in `Nullable.t` here (the consumer must be able to produce
            // null). A union return keeps its own (views/none) handling. (#63 validation)
            if (synNull && !(retType.isUnion && retType.isUnion())) ret = applyNullable(ret, { hasNull: true, single: true })
            ctx.inFnReturn = prev
            ctx.retSynNull = prevNull
            ctx.produced = prevProd
        }
    }
    return thisArg ? { kind: 'callback', params, ret, thisArg } : { kind: 'callback', params, ret }
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
        case 'tuple': return 'T[' + (t.params || []).map(typeSig).join(',') + ']'
        case 'nullable': return 'N[' + typeSig(t.of) + ']'
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
    // An anonymous `{…}` is named after its PROPERTY PATH (the field chain that reaches it,
    // maintained by `withPath`), not just its immediate field name. Distinct shapes that share
    // a leaf name (`completed`/`sm`/`value` recur across a token tree) are then disambiguated by
    // WHERE they sit (`stepperCircleCompletedConfig` vs `stepperIconCompletedConfig`) instead of
    // by a global encounter-order counter (`stepperCompletedConfig2`/`3`) that renumbered an
    // unchanged shape whenever an unrelated sibling was added/removed upstream. (#90)
    const pathPascal = (ctx.path && ctx.path.length ? ctx.path : [propName]).map(pascal).join('')
    const base = typeName ? lower(typeName) : lower(pathPascal) + 'Config'

    if (ctx.shared) {
        // Module mode: register the entry EARLY (with its final name) so self/mutual
        // references during field building resolve to its typeRef, then fill fields.
        const key = 'id:' + type.id
        if (ctx.shared.byKey.has(key)) return refTo(ctx.shared.byKey.get(key))
        const home = homeOf(type, ctx)
        // An ANONYMOUS `{…}` gets a DESCRIPTIVE, component-scoped name: `<home><Prop>Config`
        // (e.g. `avatarSizeConfig`) instead of a bare `<prop>Config`. Prop names like `sm`/`value`/
        // `gap` recur across dozens of unrelated components, so a bare base collided into ONE global
        // numbered series (`smConfig19`, suffix ≤40) whose number shifted whenever ANY upstream
        // component was added/removed — opaque AND unstable across versions. Prefixing with the home
        // module makes the name say where it belongs and scopes the disambiguation counter to a
        // single component+prop, so unrelated upstream changes no longer renumber it. A NAMED library
        // type keeps its own name (per the user's "follow the library" rule, #62). (#63 naming)
        // The path segments (`pathPascal`, #90) make the per-home base distinct by location, so the
        // disambiguation counter is now a last-resort tiebreak for genuine same-home/same-path clashes.
        const sharedBase = typeName ? lower(typeName) : lower(home.replace(/Types$/, '')) + pathPascal + 'Config'
        const entry = { key, kind: 'record', name: uniqueName(sharedBase, ctx.shared), base: sharedBase, home, deps: new Set(), spread: undefined, fields: [] }
        // Heal handle (#33): keep the ts.Type + a ctx snapshot so a post-extraction pass
        // can RE-resolve fields with a fresh `visiting` set if this record was first built
        // in a degraded (mid-cycle) context and cached as an all-`string` ghost.
        entry._heal = { type, ctx, depth }
        ctx.shared.byKey.set(key, entry)
        ctx.shared.entries.push(entry)
        if (type.id != null) ctx.visiting?.add(type.id)
        const prevSelfId = ctx.selfId; ctx.selfId = type.id // direct-self-ref resolves past depth
        // A NAMED type is a fresh anchor root SEEDED WITH ITS OWN NAME — its fields are named
        // relative to IT, not to the (use-site-dependent) chain that reached it, so the same
        // library type gets one stable name wherever it's consumed. Seeding with the type name
        // (not an empty root) keeps DISTINCT named owners apart: blend declares an inline
        // `inputContainer: {…}` of a different shape inside ~8 separate `*TokensType` records, all
        // homed to `Inputs` — an empty root collapsed them to one `inputsInputContainerConfig` +
        // counter; the owner seed gives `inputsTextInputTokensInputContainerConfig` etc., stable &
        // hash-free. Anonymous shapes keep accumulating the path. (#90)
        const prevPath = ctx.path; if (typeName) ctx.path = [typeName]
        const built = buildRecordFields(type, ctx, depth)
        ctx.path = prevPath
        ctx.selfId = prevSelfId
        if (type.id != null) ctx.visiting?.delete(type.id)
        entry.spread = built.spread
        entry.fields = built.fields
        entry.indexValue = built.indexValue // #119: `@set_index` setter value type (index-sig records)
        for (const f of built.fields) collectRefKeys(f.type, entry.deps)
        if (built.indexValue) collectRefKeys(built.indexValue, entry.deps)
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
        //
        // SCOPED PER HOME MODULE. An anonymous `{…}` has no declaration file, so its home is
        // whichever component happened to build it first; merging identical inline shapes
        // ACROSS components (e.g. Avatar's `sizeConfig` ≡ DataTable's) pinned the canonical to
        // that arbitrary home and drew a processing-order cross-edge — fusing dozens of
        // unrelated component modules into ONE giant SCC (`HighchartsSharedTypes` held 2409/2578
        // types for @juspay/blend). Keying by `home|sig` keeps the within-module collapse (Hono's
        // 1728 share one home; component files stay compact) while a shared shape now gets its
        // own copy per component — types stay where the library declares them. (#61 follow-up)
        const sig = entry.home + '|' + recordSig(entry)
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
    const prevSelfId = ctx.selfId; ctx.selfId = type.id
    const prevPath = ctx.path; if (typeName) ctx.path = [typeName] // named type = anchor root seeded with its own name (#90)
    const built = buildRecordFields(type, ctx, depth)
    ctx.path = prevPath
    ctx.selfId = prevSelfId
    if (type.id != null) ctx.visiting?.delete(type.id)
    const tvars = new Set()
    for (const f of built.fields) collectTypeVars(f.type, tvars)
    const tparams = tvars.size ? [...tvars] : undefined
    ctx.records.push({ name: rname, spread: built.spread, fields: built.fields, tparams, indexValue: built.indexValue })
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
    // A FIRST-PARTY field whose name collides with a DOM attr (`id`, `size`, `shape`, …) can't
    // co-exist with the all-or-nothing `...JsxDOM.domProps` spread (ReScript rejects an explicit
    // field that overlaps a spread), and JsxDOM.domProps — unlike the component path's narrowable
    // HtmlAttrs variants — can't omit it. Previously such own fields were SILENTLY DROPPED
    // (AvatarData lost required `id`/`size`/`shape`). The named first-party fields matter more
    // than the generic inherited-attr bag, so on collision we keep ALL own fields and drop the
    // spread (the inherited HTML attrs go with it). (#63 C3)
    const ownCollides = hasHtml && props.some((p) => !isInherited(p) && DOM_PROPS_FIELDS.has(p.getName()))
    // A HYBRID container-extender — `interface X extends Array<T> { …own }` (or ReadonlyArray/Map/Set)
    // — keeps a record for its OWN fields (#109.2 only flattens PURE array-extenders). But its
    // prototype methods (`length`/`push`/…) are lib-inherited, so `hasHtml` misfires and would emit a
    // nonsensical `...JsxDOM.domProps` — it's not a DOM element. The prototype members are already
    // dropped as fields (isInherited), so we just suppress the spurious spread. Same guard Map/Set get
    // before recordNode (#68); Array-extending hybrids just didn't have it. (#144)
    const containerBase = type.isClassOrInterface?.() &&
        (checker.getBaseTypes?.(type) || []).some((b) => isBuiltinContainer(b, checker))
    const spread = (hasHtml && !ownCollides && !containerBase) ? 'JsxDOM.domProps' : undefined

    // Record fields must not mint implicit component type variables for `any` — a SHARED
    // record can't be component-generic, so `any` stays a flagged defect there. (#31)
    const prevInRecord = ctx.inRecordField
    ctx.inRecordField = true
    const fields = props
        // Keep every FIRST-PARTY field (with its real type); drop genuinely inherited (@types/
        // lib.dom) HTML attrs — they're covered by the domProps spread, or intentionally gone
        // with it on collision. (#63 C3)
        .filter((p) => !isInherited(p))
        // NB: `key`/`ref` are React-reserved only on a COMPONENT's top-level props (filtered in
        // buildComponentIR). A nested DATA record (`{ key: string; color: string }[]`) uses `key`
        // as real payload, so it must NOT be stripped here (#63 C1).
        .map((p) => {
            const optional = (p.getFlags() & ts.SymbolFlags.Optional) !== 0
            const t = checker.getTypeOfSymbolAtLocation(p, ctx.decl)
            // Recover syntactic nullability — `data: DirectoryData[] | null` must stay
            // `Nullable.t<array<…>>`, not collapse to a required non-nullable array; a `| undefined`
            // makes the field optional. strictNullChecks is off, so it's gone from the resolved
            // type and read from the SYNTACTIC node — same as component props. Via the single
            // FIRST-PARTY property signature: a merged intersection field has both an own and an
            // external (`@types`/`@radix`/…) signature; the own one is authoritative. (#63 C5 / #65 B1)
            const propSigs = (p.declarations || []).filter((dd) => ts.isPropertySignature(dd) && dd.type)
            const ownSigs = propSigs.filter((dd) => !isVendorDecl(dd))
            const ownDecl = ownSigs.length === 1 ? ownSigs[0] : (propSigs.length === 1 ? propSigs[0] : null)
            const nb = ownDecl && ownDecl.type && syntacticNullability(ownDecl.type)
            const fieldType = isHighchartsSeriesDataField(type, p.getName(), t, checker)
                ? { kind: 'array', of: highchartsSeriesDataNode(ctx) }
                : withPath(ctx, p.getName(), () => classify(t, ctx, p.getName(), depth + 1))
            return {
                name: p.getName(),
                optional: optional || !!(nb && nb.hasUndef) || indexedAccessOptional(ownDecl && ownDecl.type, checker),
                // push the field name so a nested anonymous `{…}` is path-anchored (#90)
                type: applyNullable(fieldType, nb),
            }
        })
    // A record carrying a string INDEX SIGNATURE alongside named props (`CSSObject`:
    // `[key: string]: bool|number|string` + `backgroundColor?`/…) — the named fields stay a typed
    // record, and the index sig is preserved as a `@set_index` setter (`cssObjectHighchartsSet`)
    // so an un-named key (`zIndex`) is reachable at a FLAT runtime position. Pure index objects
    // (no named props) already map to `Dict.t` upstream, so only add this when named fields exist.
    // (#119)
    let indexValue
    const strIdx = fields.length ? checker.getIndexInfoOfType?.(type, ts.IndexKind.String) : null
    if (strIdx && strIdx.type) {
        const v = classify(strIdx.type, ctx, 'value', depth + 1)
        indexValue = irHasImperfection(v) ? { kind: 'raw', res: 'JSON.t' } : v
    }
    ctx.inRecordField = prevInRecord
    return { spread, fields, indexValue }
}
