// Primitives, the int/float name heuristic, `unknown` -> JSON.t, Date, arrays,
// and Record -> Dict.t. Self-contained (a branded element type, no imports).
type JsxElement = { __brand: 'element' }

export declare const Primitives: (props: {
  label?: string                   // -> string
  count?: number                   // -> int  (name heuristic: count/width/index/…)
  ratio?: number                   // -> float (not a count-like name)
  disabled?: boolean               // -> bool
  payload?: unknown                // -> JSON.t (opaque value, not a defect)
  createdAt?: Date                 // -> Date.t
  tags?: string[]                  // -> array<string>
  meta?: Record<string, unknown>   // -> Dict.t<JSON.t>
  labels?: Record<string, string>  // -> Dict.t<string>
}) => JsxElement
