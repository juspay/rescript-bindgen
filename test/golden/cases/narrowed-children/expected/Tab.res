@module("demo") @react.component
external make: (
  ~children: CommonTypes.stringOrNumber,
  ~label: string=?,
) => React.element = "Tab"
