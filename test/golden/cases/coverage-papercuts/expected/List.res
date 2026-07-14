@module("demo") @react.component
external make: (
  ~items: array<CommonTypes.stringOrNumber>,
) => React.element = "List"
