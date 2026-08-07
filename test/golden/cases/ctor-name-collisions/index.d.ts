// #171 — CONSTRUCTOR NAMES COLLIDE PER MODULE, NOT PER TYPE.
//
// ReScript scopes variant constructors to the module, so two enums in one `*Types.res` can both
// define `Value`. Where the expected type is known, type-directed disambiguation resolves it; where
// it ISN'T, ReScript silently binds the LAST definition in the file. Verified against the compiler:
//
//     type operator = | @as("!=") Value | @as(">") Gt
//     type gapUnit  = | @as("value") Value | @as("percent") Percent
//     let annotated: operator = Value   ->  "!="      (correct)
//     let unannotated         = Value   ->  "value"   (WRONG — no error, no warning)
//
// So one name with two DIFFERENT `@as` values is a wire-value bug, not an ergonomics wrinkle. In
// blend it hit 7 names in Highcharts alone (`Point` = "point"/"Point", which Highcharts treats as
// case-sensitive) and broke the portal dashboard migration (juspay/blend-rescript#133).
//
// Split by consequence:
//  · CLASS A — conflicting values. RENAMED: every collider takes the tail of its owning type's name
//    (`ValueOperator`, `ValueGapUnit`), including the first, since leaving one bare would make
//    "who keeps the short name" depend on emission order — the churn #90 exists to prevent.
//  · CLASS B — same value everywhere (`Solid` = "solid" in two enums). LEFT ALONE and reported:
//    it resolves to the right value whichever definition wins, and renaming would churn consumers
//    for no correctness gain. It must not pass SILENTLY though — see the report's collisions section.
type JsxElement = { __brand: 'element' }

// CLASS A — `Value` means a different string in each enum.
type Operator = '!=' | '>'
type GapUnit = 'value' | 'percent'

// CLASS A, case-only — `Solid` is "Solid" in one and "solid" in the other. Highcharts hits exactly
// this (`Point` = "point"/"Point") and treats the two as different values.
type LineCase = 'Solid' | 'Dashed'
type FillCase = 'solid' | 'hatched'

// CLASS A, numeric vs string — `@as(0)` emits `0` and `@as("0")` emits `"0"`; stringifying the value
// collapsed them into one "safe" group and left the hazard in place. (#184 review)
// The member NAME drives a numeric enum's constructor, and the VALUE drives a string literal's — so
// naming the numeric member `V0` makes both sides land on `V0`: `@as(0)` vs `@as("0")`.
declare enum Level { V0 = 0, V1 = 1 }
type Digit = '0' | '1'

// CLASS A, ACROSS KINDS — an `@unboxed` variant declares constructors in the same module namespace as
// an enum. `boolean | 'mixed'` emits `Bool(bool) | @as("mixed") Mixed`; the enum below emits
// `@as("Mixed") Mixed`. Collecting only enum entries (the first cut) reported NO collision here, while
// an unannotated `Mixed` compiled to whichever came last. (#184 review)
// The union carries a RECORD arm so the `@unboxed` homes with that record's module — the same module
// as the enum below. A primitives-only union would sink to `CommonTypes` and never share a namespace.
interface Marker { id: string }
type Tri = Marker | 'mixed'
type Casing = 'Mixed' | 'Upper'

// ALLOCATOR — the computed replacement can already BE taken. `Value` collides (above), and its
// owner-tail suffix would produce `ValueOperator` — which this enum already defines. The allocator
// reserves every existing constructor first and falls back deterministically, so nothing is
// overwritten. (#184 review)
type Squatter = 'value operator' | 'other'

// CLASS A, PAYLOAD REPRESENTATION — a payload constructor is NOT "no value". `Marker` exists twice
// here: as the `@unboxed` arm above (identity — the record passes through unchanged) and as a `@tag`
// branch below (which INJECTS the discriminant). Same name, same arity, silently different runtime
// shape — compiled and confirmed: an unannotated use emitted `{x: 1}` where the tagged form needs
// `{kind: "marker", x: 1}`. Treating payload arms as "no value" classified this as safe. (#184 review)
type Widget = { kind: 'marker'; size: number } | { kind: 'plain'; label: string }

// CLASS B — `Dotted` is "dotted" in BOTH, with no third definition dragging in another value, so it
// keeps its name and is only reported. This is what the previous version of the fixture failed to
// prove: an uppercase sibling made every `Solid` definition Class A, so no "left as-is" row existed.
type StrokeStyle = 'dotted' | 'wavy'
type BorderStyle = 'dotted' | 'groove'

export declare const Chart: (props: {
    operator?: Operator
    gapUnit?: GapUnit
    lineCase?: LineCase
    fillCase?: FillCase
    level?: Level
    digit?: Digit
    squatter?: Squatter
    tri?: Tri
    widget?: Widget
    casing?: Casing
    stroke?: StrokeStyle
    border?: BorderStyle
}) => JsxElement
