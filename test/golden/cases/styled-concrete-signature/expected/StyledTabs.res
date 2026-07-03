@module("demo") @react.component
external make: (
  ~value: string=?,
  ~onValueChange: string => unit=?,
  ~orientation: StyledConcreteSignatureTypes.styledConcreteSignatureOrientation=?,
  ~children: StyledConcreteSignatureTypes.jsxElement=?,
  @as("as") ~as_: string=?,
  ~forwardedAs: string=?,
) => React.element = "StyledTabs"
