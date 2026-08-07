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

// CLASS A — `Value` means different strings in the two enums, and `Mode` differs only by case.
type Operator = '!=' | '>'
type GapUnit = 'value' | 'percent'
type LineCase = 'Solid' | 'Dashed'

// CLASS B — `Solid` is "solid" in both, so it stays `Solid` and is only reported.
type StrokeStyle = 'solid' | 'dotted'
type BorderStyle = 'solid' | 'double'

export declare const Chart: (props: {
    operator?: Operator
    gapUnit?: GapUnit
    lineCase?: LineCase
    stroke?: StrokeStyle
    border?: BorderStyle
}) => JsxElement
