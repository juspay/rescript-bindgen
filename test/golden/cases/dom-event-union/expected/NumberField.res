@module("demo") @react.component
external make: (
  ~onValueChange: (float, DomEventUnionTypes.fieldChangeDetails) => unit=?,
) => React.element = "NumberField"
