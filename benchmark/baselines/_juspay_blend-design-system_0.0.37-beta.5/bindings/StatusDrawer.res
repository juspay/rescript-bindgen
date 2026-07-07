@module("@juspay/blend-design-system") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~onOpenChange: bool => unit=?,
  ~heading: string,
  ~description: string,
  ~primaryButtonProps: HighchartsSharedTypes.buttonProps,
  ~secondaryButtonProps: HighchartsSharedTypes.buttonProps=?,
  ~slot: React.element,
  ~direction: DrawerTypes.drawerDirection=?,
  ~modal: bool=?,
  ~dismissible: bool=?,
  ~mobileOffset: DrawerTypes.drawerMobileOffsetConfig=?,
  ~className: string=?,
  ~style: JsxDOM.style=?,
) => React.element = "StatusDrawer"
