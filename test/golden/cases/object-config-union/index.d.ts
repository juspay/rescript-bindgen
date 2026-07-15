// #149 (#120 Part B): a `object | Config` union — the bare `object` KEYWORD (TS `NonPrimitive`, "any
// non-primitive", no shape) alongside a named record. Highcharts `onPoint?: object | PlotXOnPointOptions`.
// The two arms are both `typeof "object"`, so `@unboxed` can't discriminate — but an OPAQUE MODULE
// with per-arm `%identity` from*/as* views can. The `object` arm binds via `JSON.t` (its honest
// opaque-value mapping, same as `unknown`/`{}`); a SOLO `object` field is `JSON.t`, not `string`.
type JsxElement = { __brand: 'element' }

interface OnPointOptions {
  id?: string
  x?: number
  y?: number
}

export declare const Series: (props: {
  onPoint?: object | OnPointOptions
  solo?: object
}) => JsxElement
