type props = {
  heading: string,
  style?: JsxDOM.style,
  className?: string,
  description?: string,
  @as("open") open_?: bool,
  direction?: DrawerTypes.drawerDirection,
  rightSlot?: React.element,
  items: array<DrawerTypes.selectDrawerGroup>,
  enableSearch?: bool,
  searchPlaceholder?: string,
  onOpenChange?: bool => unit,
  selectedValues?: array<string>,
  onSelectionChange?: array<string> => unit,
  cancelText?: string,
  confirmText?: string,
  onCancel?: unit => unit,
  onConfirm?: unit => unit,
  showCancelButton?: bool,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectDrawer"
