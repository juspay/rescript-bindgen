// Fixed-arity TS tuples -> ReScript tuples: `[number, number]` -> `(float, float)`,
// `[string, number]` -> `(string, float)`. ReScript tuples are fixed-arity with no optional slots,
// so a variadic/rest tuple and an optional-element tuple stay the flagged `string` fallback. A
// 1-element tuple has no ReScript tuple form either, but IS faithfully an `array<T>` (a 0-or-1
// sequence), so `[number]` -> `array<float>` (#83). Tuple elements have no prop name, so
// `number` -> `float`. (#65 B5)
type JsxElement = { __brand: 'element' }

export declare const Widget: (props: {
  offset?: [number, number] // -> (float, float)
  pair?: [string, number] // -> (string, float)
  variadic?: [number, ...string[]] // rest -> string (not expressible)
  optionalEl?: [number, number?] // optional element -> string (not expressible)
  single?: [number] // 1-tuple -> array<float> (no 1-tuples in ReScript; a 0-or-1 sequence is an array)
}) => JsxElement
