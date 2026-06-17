// Fixed-arity TS tuples -> ReScript tuples: `[number, number]` -> `(float, float)`,
// `[string, number]` -> `(string, float)`. ReScript tuples are fixed-arity with no optional slots
// and no 1-tuples, so a variadic/rest tuple, an optional-element tuple, and a 1-element tuple stay
// the flagged `string` fallback. Tuple elements have no prop name, so `number` -> `float`. (#65 B5)
type JsxElement = { __brand: 'element' }

export declare const Widget: (props: {
  offset?: [number, number] // -> (float, float)
  pair?: [string, number] // -> (string, float)
  variadic?: [number, ...string[]] // rest -> string (not expressible)
  optionalEl?: [number, number?] // optional element -> string (not expressible)
  single?: [number] // 1-tuple -> string (no 1-tuples in ReScript)
}) => JsxElement
