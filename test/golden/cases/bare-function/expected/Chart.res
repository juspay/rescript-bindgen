@module("demo") @react.component
external make: (
  ~proj4: JsFn.t=?,  // ⓘ was `Function` — build with JsFn.fromFn0/1/2/3, read with JsFn.asFn0/1/2/3
  ~pointDescriptionFormatter: JsFn.t=?,  // ⓘ was `Function` — build with JsFn.fromFn0/1/2/3, read with JsFn.asFn0/1/2/3
  ~animationStep: BareFunctionTypes.stepOptions=?,
) => React.element = "Chart"
