@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~overflowY: DrawerTypes.drawerOverflowY=?,
  ~noPadding: bool=?,
  ~hasFooter: bool=?,
  ~direction: PopoverTypes.popoverSide=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerBody"
