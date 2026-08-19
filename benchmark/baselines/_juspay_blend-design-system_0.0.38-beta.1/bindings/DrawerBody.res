type props = {
  children: React.element,
  className?: string,
  overflowY?: DrawerTypes.drawerOverflowY,
  noPadding?: bool,
  hasFooter?: bool,
  direction?: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerBody"
