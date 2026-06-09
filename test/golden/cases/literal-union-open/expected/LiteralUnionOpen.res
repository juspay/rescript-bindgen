@module("demo") @react.component
external make: (
  ~position: CommonTypes.toastPositionOrString,
  ~anchor: LiteralUnionOpenTypes.toastPosition,
) => React.element = "LiteralUnionOpen"
