@module("demo") @scope("Menu") @react.component
external make: (
  ~label: string,
) => React.element = "Item"
