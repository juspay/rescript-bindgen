type props = {
  ...DrawerTypes.drawerContentProps,
  direction?: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide,
  showHandle?: bool,
  handle?: React.element,
  hasSnapPoints?: bool,
  contentDriven?: bool,
  width?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  offSet?: CommonTypes.stringOrNumber,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerContent"
