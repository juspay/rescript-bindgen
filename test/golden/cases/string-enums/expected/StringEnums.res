@module("demo") @react.component
external make: (
  ~size: StringEnumsTypes.size=?,
  ~variant: StringEnumsTypes.variant=?,
  @as("type") ~type_: StringEnumsTypes.htmlInputTypeAttribute=?,
) => React.element = "StringEnums"
