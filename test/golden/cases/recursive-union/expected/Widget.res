@module("demo") @react.component
external make: (
  ~names: CommonTypes.stringOrNumberOrValueArray=?,
) => React.element = "Widget"
