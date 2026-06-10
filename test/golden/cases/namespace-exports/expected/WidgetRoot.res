@module("demo") @scope("Widget") @react.component
external make: (
  @as("open") ~open_: bool=?,
) => React.element = "Root"
