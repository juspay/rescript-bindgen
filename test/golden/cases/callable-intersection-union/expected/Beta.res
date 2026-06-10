@module("demo") @react.component
external make: (
  ~className: CallableIntersectionUnionTypes.betaClassName=?,
  ~style: CallableIntersectionUnionTypes.betaStyle=?,
) => React.element = "Beta"
