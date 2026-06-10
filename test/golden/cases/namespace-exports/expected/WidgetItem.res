@module("demo") @scope("Widget") @react.component
external make: (
  ~label: string=?,
) => React.element = "Item"
