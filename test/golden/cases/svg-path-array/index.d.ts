// `string | SVGPathArray` (Highcharts `SVGAttributes.d`). The real `SVGPathArray` element is a UNION
// of MIXED shapes: a plain command-array `Array<Cmd>` PLUS `[Cmd, …number]` tuples of several arities —
// all JS arrays at runtime, so an `@unboxed` can't discriminate them, and `(Cmd, array<float>)` is
// runtime-wrong (a ReScript tuple is NESTED `["M",[10,20]]`, path data is FLAT `["M",10,20]`).
//
// Model it as an OPAQUE MODULE with zero-cost `%identity` views — one per arm, exact shape preserved
// (#72). This is the established multi-shape-union pattern (PresetsConfig) extended to TUPLE arms,
// named by arity (tuples are anonymous). Construct-only — correct, since `d` is supplied, never read.
// A numeric tuple (`box: [number, number]`) needs a string-literal-free head, so it is NOT a path
// segment — it stays the plain `(float, float)` tuple.
type JsxElement = { __brand: 'element' }

type Cmd = 'M' | 'L' | 'C' | 'Z'
type Seg = Array<Cmd> | [Cmd, number] | [Cmd, number, number]

export declare const Path: (props: {
  // -> @unboxed Str(string) | Arr(array<Seg.t>); module Seg { fromCmds / fromTuple2 / fromTuple3 }
  d?: string | Seg[]
  box?: [number, number] // control: numeric tuple -> (float, float), NOT a path segment
}) => JsxElement
