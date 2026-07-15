// #120: a bare, untyped global `Function` field has no call signature to model. Rather than a
// useless `string` placeholder, bind it to the shared `JsFn` opaque module (fromFnN/asFnN, %identity)
// — honest, zero-cost, and the consumer can pass/read a real function of the matching arity.
type JsxElement = { __brand: 'element' }

interface StepOptions {
  // bare Functions inside a record — each becomes `JsFn.t` (not a flagged string)
  complete?: Function
  step?: Function
  duration?: number
}

export declare const Chart: (props: {
  // top-level bare Function props
  proj4?: Function
  pointDescriptionFormatter?: Function
  animationStep?: StepOptions
}) => JsxElement
