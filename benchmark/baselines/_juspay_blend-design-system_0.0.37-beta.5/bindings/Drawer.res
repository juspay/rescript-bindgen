@module("@juspay/blend-design-system") @react.component
external make: (
  @as("open") ~open_: bool=?,
  ~onOpenChange: bool => unit=?,
  ~direction: DrawerTypes.drawerDirection=?,
  ~modal: bool=?,
  ~dismissible: bool=?,
  ~showHandle: bool=?,
  ~handle: React.element=?,
  ~nested: bool=?,
  ~snapPoints: array<HighchartsSharedTypes.stringOrNumber>=?,
  ~activeSnapPoint: Nullable.t<HighchartsSharedTypes.stringOrNumber>=?,
  ~onSnapPointChange: Nullable.t<HighchartsSharedTypes.stringOrNumber> => unit=?,
  ~fadeFromIndex: float=?,
  ~snapToSequentialPoint: bool=?,
  ~disableDrag: bool=?,
  ~mobileOffset: DrawerTypes.drawerMobileOffsetConfig=?,
  ~children: React.element,
) => React.element = "Drawer"
