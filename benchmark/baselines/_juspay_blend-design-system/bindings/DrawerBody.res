@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~overflowY: DrawerTypes.drawerOverflowY=?,
  ~noPadding: bool=?,
  ~hasFooter: bool=?,
  ~direction: PopoverTypes.popoverSide=?,
) => React.element = "DrawerBody"
