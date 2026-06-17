@module("demo") @react.component
external make: (
  ~orientation: NumericEnumTypes.orientation=?,
  ~level: CommonTypes.v1OrV2OrV3=?,
  ~size: NumericEnumTypes.size=?,
) => React.element = "Widget"
