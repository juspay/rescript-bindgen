type props = {
  heading: string,
  style?: JsxDOM.style,
  className?: string,
  @as("open") open_?: bool,
  rightSlot?: React.element,
  description?: string,
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
  direction?: DrawerTypes.drawerDirection,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectDrawer"
