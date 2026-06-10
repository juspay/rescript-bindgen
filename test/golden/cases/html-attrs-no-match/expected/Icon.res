@module("demo") @react.component
external make: (
  ~name: string=?,
  ~fill: string=?,
  ~stroke: string=?,
) => React.element = "Icon"
