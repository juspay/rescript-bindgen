// #181 — THE SAME UNION MUST BIND THE SAME WAY WHEREVER IT APPEARS.
//
// A union of ANONYMOUS object arms used to bind three different ways depending on position:
//
//     prop?:  Anon          ->  string      ⚪ loose      (useless)
//     arr?:   Anon[]        ->  array<Anon.t>            (proper module)
//     holder: {one: Anon}   ->  string      ⚪ loose      (useless)
//
// and the module it refused was ALREADY BUILT, in the same emitted file:
//
//     type holder = { one: string /* ⚪ was `Anon` */, many: array<Anon.t> }
//
// Cause: the array branch has its own arm check, added in #65 explicitly to route AROUND
// `unionNode`'s `isStructured` gate, which excluded arms whose symbol is `__type` — i.e. exactly the
// inline `{…}` shapes a library writes for "pass either of these" props. Named arms, identical key
// sets (record collapse, #30) and a clean string discriminant (@tag variant, #167) were all already
// handled; anonymous differing-key-set arms fell through the gap to `string`.
//
// WHY THE FIX IS NARROW: that gate feeds TWO decisions — build a module (≥2 structured arms), else
// FLAG FOR REVIEW. Widening it wholesale sent single-object unions like base-ui's `Padding`
// (`number | {top?, …}` — one object arm, no module possible) from ⚪ loose to 🔍 review: the same
// emitted `string`, a worse bucket, 8 components off the usable list. Only the MODULE ATTEMPT widens;
// the review criterion keeps its named-arm meaning.
type JsxElement = { __brand: 'element' }

type Anon = { a: string } | { b: number }
interface Holder { one: Anon; many: Anon[] }

// ONE object arm only, so no module is possible. base-ui's `Padding` is this shape —
// `number | Prettify<Partial<SideObject>>` — and the first attempt sent it from ⚪ loose to 🔍 review,
// taking 8 components off the usable list for no change in the emitted type. Here `number | {top}` is
// runtime-discriminable, so it lands on the BETTER `@unboxed` mapping rather than either flag; what
// this case pins is that a single-object union is not dragged into the review path by the widening.
type SingleObj = number | { top: number }

// POLARITY. A views module whose arms are all records carries `as*` readers (#122), so it is safe in
// a RECEIVE position (a callback param — the library produces the value and the consumer reads it).
// One string-literal arm makes the module CONSTRUCT-ONLY (a literal has no reader), and a receive
// position must then keep the honest type-variable salvage instead of handing back an unopenable box.
type ConstructOnly = { a: string } | { b: number } | 'auto'

export declare const Picker: (props: {
    prop?: Anon
    arr?: Anon[]
    holder?: Holder
    singleObj?: SingleObj
    onReadable?: (v: Anon) => void
    onConstructOnly?: (v: ConstructOnly) => void
    propConstructOnly?: ConstructOnly
}) => JsxElement
