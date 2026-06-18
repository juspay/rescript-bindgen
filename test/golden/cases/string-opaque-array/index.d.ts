// `string | <opaque-element>[]` where the array element is genuinely unmodelable (NOT a tagged
// tuple). The array arm must NEVER be dropped to a bare `string` (the regression an interim build
// caused), and must NOT fake the element as `string` (what 1.2.1 did). Instead keep the array and
// type the element honestly as `JSON.t` — the sanctioned opaque-value mapping:
// `@unboxed Str(string) | Arr(array<JSON.t>)`. (#72 rule 3 — the catch-all preserve side.)
type JsxElement = { __brand: 'element' }

// An element TS can't model to a real ReScript type (an index-signature-only object keyed by symbol).
type Opaque = { [k: symbol]: number }

export declare const Widget: (props: {
  // -> ~tokens: CommonTypes.stringOrValueArray=? (= @unboxed Str(string) | Arr(array<JSON.t>))
  tokens?: string | Opaque[]
}) => JsxElement
