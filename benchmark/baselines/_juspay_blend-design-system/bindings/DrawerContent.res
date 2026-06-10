@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~style: JsxDOM.style=?,
  @as("aria-label") ~ariaLabel: string=?,
  @as("aria-describedby") ~ariaDescribedby: string=?,
  ~fullScreen: bool=?,
  ~direction: PopoverTypes.side=?,
  ~showHandle: bool=?,
  ~handle: React.element=?,
  ~hasSnapPoints: bool=?,
  ~contentDriven: bool=?,
  ~width: CommonTypes.stringOrNumber=?,
  ~maxWidth: CommonTypes.stringOrNumber=?,
  ~offSet: CommonTypes.stringOrNumber=?,
  ~mobileOffset: DrawerTypes.mobileOffsetConfig=?,
) => React.element = "DrawerContent"
