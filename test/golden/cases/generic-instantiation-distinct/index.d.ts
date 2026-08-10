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
}

// A lone literal in a PARAMETER position tightens too — hono's real `c.header('Content-Type', …)`
// overload. Was `~name: string`, which invited any header name alongside a `BaseMime` value.
export declare const setHeader: (props: { onlyContentType?: 'Content-Type' }) => JsxElement

// GUARD: a NON-identifier literal must be quoted as a polyvar tag (`#"context-menu"`, not
// `#context-menu`, which does not parse). base-ui's menu `type` discriminants are exactly this.
export declare const Kinds: (props: {
    plain?: 'menubar'
    dashed?: 'context-menu'
    numeric?: '2xl'
}) => JsxElement
