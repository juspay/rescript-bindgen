@module("demo") @react.component
external make: (
  ~label: string,
  ~caption: string=?,
) => React.element = "Widget"
