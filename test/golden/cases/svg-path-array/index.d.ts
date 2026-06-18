// `string | SVGPathArray` (Highcharts `SVGAttributes.d`). The array element is a UNION of variadic
// `[command-letter, …numbers]` tuples — the SVG path-data shape. It used to classify opaque (a union
// of different-arity tuples) and so collapsed (1.2.1 faked it `array<string>`; an interim build
// dropped the arm → bare `string`).
//
// Model it faithfully (#72): the finite string-literal command heads become a NAMED polyvariant
// (`type cmd = [#M | #L | #C | #Z]` — each tag serializes to the exact letter), the variadic numeric
// tail collapses to `array<float>`, and the element is the segment tuple `(cmd, array<float>)`. The
// `string | …[]` union is then `@unboxed Str(string) | Arr(array<(cmd, array<float>)>)`. Detection
// requires a STRING-LITERAL head, so a numeric tuple (`[number, number]`) is NOT matched and keeps
// its plain `(float, float)` mapping.
type JsxElement = { __brand: 'element' }

type Cmd = 'M' | 'L' | 'C' | 'Z'
type Seg = [Cmd] | [Cmd, number] | [Cmd, number, number]

export declare const Path: (props: {
  d?: string | Seg[] // -> @unboxed Str(string) | Arr(array<(cmd, array<float>)>)
  box?: [number, number] // control: numeric tuple -> (float, float), NOT a path segment
}) => JsxElement
