@module("demo") @scope(("Table", "Summary")) @react.component
external make: (
  ~height: float,
) => React.element = "Row"
