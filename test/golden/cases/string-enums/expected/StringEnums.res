@module("demo") @react.component
external make: (
  ~size: StringEnumsTypes.stringEnumsSize=?,
  ~variant: StringEnumsTypes.stringEnumsVariant=?,
  @as("type") ~type_: StringEnumsTypes.htmlInputTypeAttribute=?,
) => React.element = "StringEnums"
