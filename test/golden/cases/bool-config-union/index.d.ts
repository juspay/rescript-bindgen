// #120: `boolean | Config` where `Config` transitively contains a bare `Function` used to collapse
// to `string` — the Function made `Config` fail the past-depth bounded check, so the whole union
// truncated. With a bare `Function` bound to `JsFn.t` (a bounded, non-imperfect leaf), `Config`
// materializes and the union re-forms as a discriminable `@unboxed Bool(bool) | Options(...)`.
type JsxElement = { __brand: 'element' }

// mirrors Highcharts' AnimationOptionsObject (shallow; the Function fields are the crux)
interface AnimationOptionsObject {
  complete?: Function
  defer?: number
  duration?: number
  easing?: string | Function   // string | bare-Function → @unboxed Str(string) | Fn(JsFn.t)
  step?: Function
}

export declare const Series: (props: {
  animation?: boolean | AnimationOptionsObject
}) => JsxElement
