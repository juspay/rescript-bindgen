type props = {
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  heading: string,
  description?: string,
  rightSlot?: React.element,
  items: array<DrawerTypes.drawerItemsConfig>,
  selectedValue?: string,
  onValueChange?: string => unit,
  enableSearch?: bool,
  searchPlaceholder?: string,
  cancelText?: string,
  confirmText?: string,
  onCancel?: unit => unit,
  onConfirm?: unit => unit,
  showCancelButton?: bool,
  direction?: PopoverTypes.popoverSide,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
  className?: string,
  style?: JsxDOM.style,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "NestedSingleSelectDrawer"
