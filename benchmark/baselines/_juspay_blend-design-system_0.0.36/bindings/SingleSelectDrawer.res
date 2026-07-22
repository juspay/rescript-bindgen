type props = {
  style?: JsxDOM.style,
  className?: string,
  heading: string,
  onValueChange?: string => unit,
  rightSlot?: React.element,
  @as("open") open_?: bool,
  description?: string,
  selectedValue?: string,
  onOpenChange?: bool => unit,
  items: array<DrawerTypes.selectDrawerGroup>,
  enableSearch?: bool,
  searchPlaceholder?: string,
  cancelText?: string,
  confirmText?: string,
  onCancel?: unit => unit,
  onConfirm?: unit => unit,
  showCancelButton?: bool,
  direction?: DrawerTypes.drawerDirection,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectDrawer"
