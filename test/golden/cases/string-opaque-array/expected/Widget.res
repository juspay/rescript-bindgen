@module("demo") @react.component
external make: (
  ~tokens: CommonTypes.stringOrValueArray=?,
) => React.element = "Widget"
