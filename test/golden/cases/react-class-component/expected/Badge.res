@module("demo") @react.component
external make: (
  ~count: int,
  ~label: string=?,
) => React.element = "Badge"
