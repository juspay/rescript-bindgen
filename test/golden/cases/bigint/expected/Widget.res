@module("demo") @react.component
external make: (
  ~items: array<BigintTypes.virtualItemShape>,
  ~nb: CommonTypes.numberOrBigInt=?,
  ~control: CommonTypes.stringOrNumber=?,
) => React.element = "Widget"
