@module("demo") @react.component
external make: (
  ~title: string=?,
  @as("open") ~open_: bool=?,
) => React.element = "Plain"
