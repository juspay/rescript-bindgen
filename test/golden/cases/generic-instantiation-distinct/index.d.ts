// #177 — TWO INSTANTIATIONS OF ONE GENERIC ARE TWO TYPES.
//
// hono's `TypedResponse<T, U, F>` is instantiated four different ways, one per response kind, and the
// `F` slot is the whole point — it is how hono tracks at the type level what you produced:
//
//     c.body(data)     -> Response & TypedResponse<T,         U, 'body'>
//     c.text(txt)      -> Response & TypedResponse<string,    U, 'text'>
//     c.json(obj)      -> Response & TypedResponse<T,         U, 'json'>
//     c.redirect(url)  -> Response & TypedResponse<undefined, U, 'redirect'>
//
// All four collapsed onto ONE record that claimed `_data: unit` ("there is no data") with no flag —
// true for `redirect` alone, false and silent for the other three. The record was a HYBRID: `_data`
// came from `redirect` while the `_format` comment read `"body"`.
//
// TWO INDEPENDENT CAUSES, both needed for the fix — part 1 alone leaves `text`/`json` fused:
//
//  1. `healGhostsFromTwin` (REMOVED). It repaired a depth-truncated all-`string` record by
//     transplanting field types from a "twin" it matched on same home + same base-name family + same
//     field NAMES. Distinct instantiations of one generic satisfy all three BY CONSTRUCTION, so it
//     transplanted `redirect`'s `_data: unit` into `body`'s record. Its own case (blend's
//     `menuV2VariantToken`) resolves fully on its own now; it fired 0 times across every fixture and
//     9 of 10 benchmark packages, and its one remaining firing WAS this bug.
//
//  2. A lone string literal now maps to a single-tag POLYVAR (`[#"body"]`) instead of a flagged
//     `string`. This is what separates `body`/`text`/`json` from each other: as flagged opaques all
//     three hashed to the same `opaque` token in `typeSig` (the literal survived only as comment
//     TEXT), so they deduped onto one entry and `text`/`json` inherited a record labelled `"body"`.
//     Distinct polyvars are distinct types, so the dedup now separates them for the right reason.
//
// Why a polyvar is exact rather than a guess: the tag's runtime value IS the bare string — compiled
// and read back, `{_format: #"body"}` emits `{_format: "body"}`. Zero-cost, and unlike `string` it
// admits nothing else.
type JsxElement = { __brand: 'element' }

// The DOM `Response` intersection is MATERIAL: with a first-party interface here the two
// instantiations already stayed distinct, so a fixture built on a local type would not reproduce this.
type TypedResponse<T, F extends string> = {
    _data: T
    _format: F
}

interface BodyRespond {
    <T>(data: T): Response & TypedResponse<T, 'body'>
    <T>(data: T, init?: string): Response & TypedResponse<T, 'body'>
}

export declare class Api {
    // `_data` is a genuine unresolvable generic -> stays a FLAGGED placeholder. That is the honest
    // answer ("flag, don't fake"), and the flag count going UP here is the fix working: it was being
    // hidden behind a confidently-wrong `unit`.
    body: BodyRespond
    // Same `F` slot, a DIFFERENT literal -> must be its own record, with its own note.
    text(t: string): Response & TypedResponse<string, 'text'>
    // `undefined` -> `unit` is CORRECT here (#175) — this is the one arm that really carries no data,
    // and it must not be allowed to speak for the others.
    redirect(location: string): Response & TypedResponse<undefined, 'redirect'>
}

// THE TEETH FOR THE REMOVAL ITSELF, and they have to be separate from the hono shape above: once
// `_format` became a polyvar those records are no longer FULLY degraded, so the old pass would not fire
// on them at all — the polyvar change masks it. Verified by restoring the pass: the hono arm alone
// produced no golden failure, which means it proved nothing about the deletion.
//
// This arm keeps every field degraded, so the pass fires. With it restored the two records fuse into ONE
// `pair` and BOTH 🛑 BROKEN flags disappear:
//
//     type pair = { a: string, b: string }              <- no flags; `gen` AND `concrete` both return it
//
// which is the whole failure in miniature — an unresolvable generic instantiation silently served by a
// CONCRETE one's field types. Correct output keeps them apart, `gen`'s flagged:
//
//     type pairV1spt2 = { a: string /* 🛑 */, b: string /* 🛑 */ }
//     type pairV1o117 = { a: string, b: string }
interface Pair<T> { a: T; b: T }

export declare class Svc {
    // Also the witness for the METHOD-GENERIC mapping: an UNCONSTRAINED method type parameter becomes a
    // real ReScript type variable, so the record parameterizes and the round trip is connected —
    // `gen: (t, ~x: 'a) => pair<'a>`. `buildFunctionIR` already did this for a standalone
    // `function map<T>(…)` and `buildComponentIR` for generic props; a class METHOD was the gap, so its
    // `T` had no entry in `ctx.typeVars` and classify's unmapped branch flagged it. What you pass in and
    // what you read back could not be connected — exactly the round trip `'a` exists for.
    gen<T>(x: T): Pair<T>
    // A CONSTRAINED parameter must NOT become `'a`: that accepts anything, so `~s: 'a` would let a
    // consumer pass `42` where TS demands a string — accepting code the library rejects. It stays
    // flagged instead. Resolving it through the declared bound is sound in principle and was tried;
    // it is deferred because hono's `U extends ContentfulStatusCode` resolves to a ~60-member numeric
    // union named `v100OrV102Or…OrV511OrV1`, which lands in every signature mentioning a status.
    constrained<S extends string>(s: S): Pair<S>
    concrete(): Pair<string>
    // RETURN-ONLY, and it must NOT become `'a` — contract rule #4 / TYPE_MAPPING "Return-only
    // generics". `R` never appears in a parameter, so it does not round-trip: `=> 'a` would let the
    // caller claim any type while the runtime value is whatever the body holds. `demoteReturnOnly`
    // already enforced this for standalone `function`s, so omitting it in the method path gave the SAME
    // TS shape opposite answers depending on whether it was a function or a method, with the unsound
    // direction winning for methods (real instance: hono's `HonoRequest.json<T>(): Promise<T>`).
    // Nothing pinned this before — the arms above all round-trip — so it was free to regress.
    returnOnly<R>(): R
    // Round-trip WITH a constraint present on a second param: `A` round-trips (-> a type var), `B` is
    // return-only AND constrained (-> demoted to its bound, not `'a`).
    mixed<A, B extends string>(a: A): Pair<A>
}

// A lone literal in a RECORD/PROP position tightens. (A collapsed OVERLOAD's direct parameter does
// NOT — see `Headers` below.)
export declare const setHeader: (props: { onlyContentType?: 'Content-Type' }) => JsxElement

// OVERLOAD COLLAPSE MUST NOT NARROW A PARAMETER. This is hono's `SetHeaders` shape (context.d.ts:
// 178-181): three overloads, and we keep only the FIRST. Binding `~name: [#"Content-Type"]` would make
// `set("X-Message", "Hello!")` — hono's own first doc example — inexpressible, with no flag saying so.
// That is the MIRROR of the bug this PR fixes: #177 accepted code the library rejects; this would
// REJECT code the library accepts, and both silently. So `name` must stay a FLAGGED `string` here.
// The single-overload `only` below must still narrow, or the guard would be over-broad.
export declare class Headers {
    set(name: 'Content-Type', value?: string): void
    set(name: string, value?: string): void
    only(name: 'Content-Type'): void
    // WIDENING A PARAM MUST WIDEN THE RETURN. Re-flagging the param makes overload 2 callable again,
    // but the return still carried overload 1's literal — so `pick(~name="X-Foo")` type-checked while
    // the runtime value was `"set-other"`, and a `switch` on it was exhaustive in one arm that can
    // never match. The narrow param at least kept the return honest by making overload 2 unreachable,
    // so that unsoundness was CREATED by the re-flag. Both ends widen, or neither.
    pick(name: 'Content-Type'): 'set-content-type'
    pick(name: string): 'set-other'
}

// RETURN-ONLY BEHIND A GENERIC RECORD. `demoteReturnOnly` DETECTED `T` here (`collectTypeVars` reads
// `typeRef.tparams`) but `substTypeVars` rewrites typeVar NODES only and cannot reach a var carried in a
// tparams array of name STRINGS — so the rule silently passed and emitted `=> box<'a>` with an unflagged
// `v: 'a`, letting the caller choose the type of a value the LIBRARY controls. Compiled proof: `asInt`
// and `asBool` both type-checked against one external, and `asInt(r).v + 1` became integer arithmetic on
// arbitrary JSON. `Svc.returnOnly<R>(): R` (bare) could not catch this — the var has to sit behind a
// registered generic record — and `parse<T>(): Result<T>` / `get<T>(): ApiResponse<T>` is a very common
// shape. Must be FLAGGED, not faked.
interface BoxOf<T> { v: T }

export declare class Req {
    jsonBoxed<T>(): BoxOf<T>
}

// TWO LITERALS THAT A POLYVAR CANNOT EXPRESS. Both compiled and read back from the emitted `.mjs`
// before being excluded — neither is theoretical, and neither was covered by any golden or baseline.
//
//  · ALL-DIGIT (`'2'`) — a wire-format bug, the worst kind. ReScript compiles an all-digit tag to a JS
//    NUMBER: `{v: #"2"}` emits `{v: 2}`, `{z: #"0"}` emits `{z: 0}`. A TS *string* literal would put a
//    number on the wire, silently. (`'-1'` and `'1.5'` stay strings — the sign/dot makes the tag
//    non-numeric — so they DO narrow, which is why both appear here.) Falls back to flagged `string`.
//
//  · RESERVED WORD (`'type'`) — a parse error that takes the WHOLE FILE down: `[#type]` gives
//    "`type` is a reserved keyword", strictly worse than the `string` it replaces. Fixed by QUOTING
//    rather than excluding (`[#"type"]` compiles and emits `"type"`), so unlike the digit case this one
//    still gets an exact type. `'open'`/`'in'`/`'to'`/`'as'` are ordinary `.d.ts` values.
//
//  · ESCAPE-BEARING (`'say "hi"'`, `'C:\\Users'`, `'a\tb'`) — a QUOTED tag is taken literally and does
//    NOT unescape, so `#"a\"b"` yields the 4-char `a\"b` and `#"C:\\\\Users"` yields two backslashes.
//    Wrong strings on the wire, unflagged. A `"` is unrepresentable in a tag at all. Excluded.
//
//  · BARE `'_'` — `[#_]` parses in the TYPE position but `#_` is invalid in the VALUE position, so the
//    type is uninhabitable: nothing can construct it. `'_blank'` is fine and must still narrow.
export declare const Edge: (props: {
    digit?: '2'
    zero?: '0'
    negative?: '-1'
    decimal?: '1.5'
    // Leading zeros do NOT coerce to a number, so these must still narrow — `/^\d+$/` over-excluded them.
    leadingZero?: '007'
    exponent?: '1e3'
    hex?: '0x1'
    keyword?: 'type'
    keyword2?: 'open'
    // `await` is a ReScript keyword MISSING from `RESCRIPT_RESERVED`, so gating on that set shipped with
    // a hole. Emit now quotes every tag unconditionally, which removes the whole class rather than
    // chasing the list.
    keyword3?: 'await'
    quoted?: 'say "hi"'
    backslash?: 'C:\\Users'
    tabbed?: 'a\tb'
    underscore?: '_'
    underscorePrefixed?: '_blank'
    empty?: ''
    spaced?: 'a b'
    unicode?: 'café'
}) => JsxElement

// GUARD: a NON-identifier literal must be quoted as a polyvar tag (`#"context-menu"`, not
// `#context-menu`, which does not parse). base-ui's menu `type` discriminants are exactly this.
export declare const Kinds: (props: {
    plain?: 'menubar'
    dashed?: 'context-menu'
    numeric?: '2xl'
}) => JsxElement

// POSITION SYMMETRY FOR IDENTICAL-KEY-SET ARMS. Making single-literal discriminants distinct polyvars
// stopped two such arms deduping into one record, which exposed that the ARRAY-ELEMENT branch (#65/#169
// — it has its own arm check and bypasses the union classifier) had no record-collapse fallback. The
// symptom was the asymmetry #181 exists to prevent: as a record FIELD the union collapsed correctly,
// as an ARRAY ELEMENT it degraded to opaque `%identity` views.
//
// Both positions must now give the collapsed record, whose discriminant is a real `@as` variant — one
// directly-constructible type instead of a `t` reachable only through unchecked doors:
//
//     type inlineArmTag = | @as("a") A | @as("b") B
//     type inlineArmConfig = { tag: inlineArmTag, v: string }
//
// The collapse is only taken when NO arm has a field another lacks, so `Pair`-style differing sets and
// the NAMED-arm case below still get the views module (which is right for named types — it keeps each
// library name, per #62, where a collapse would fuse them).
export declare const InlineArm: (props: {
    field?: { tag: 'a'; v: string } | { tag: 'b'; v: string }
    elems?: ({ tag: 'a'; v: string } | { tag: 'b'; v: string })[]
}) => JsxElement

// NAMED arms with identical key sets keep their own records + a views module, in BOTH positions. On main
// these two silently FUSED — it emitted `fromNamedArmA: namedArmA` and `fromNamedArmB: namedArmA`, both
// doors casting from the SAME record, so `NamedArmB` did not exist in the output at all. That is the #177
// conflation in miniature, and it is fixed here rather than being a regression.
interface NamedArmA { kind: 'na'; v: string }
interface NamedArmB { kind: 'nb'; v: string }

export declare const NamedArm: (props: {
    field?: NamedArmA | NamedArmB
    elems?: (NamedArmA | NamedArmB)[]
}) => JsxElement
