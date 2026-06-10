@module("@juspay/blend-design-system") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~onOpenChange: bool => unit=?,
  ~heading: string,
  ~description: string,
  ~primaryButtonProps: ButtonSkeletonTypes.buttonProps,
  ~secondaryButtonProps: ButtonSkeletonTypes.buttonProps=?,
  ~slot: React.element,
  ~direction: DrawerTypes.drawerDirection=?,
  ~modal: bool=?,
  ~dismissible: bool=?,
  ~mobileOffset: DrawerTypes.mobileOffsetConfig=?,
  ~className: string=?,
  ~style: JsxDOM.style=?,
) => React.element = "StatusDrawer"
