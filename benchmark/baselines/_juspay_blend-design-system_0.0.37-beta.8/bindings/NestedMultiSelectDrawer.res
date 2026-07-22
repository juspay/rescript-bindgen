type props = {
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  heading: string,
  description?: string,
  rightSlot?: React.element,
  items: array<DrawerTypes.drawerItemsConfig>,
  selectedValues?: array<string>,
  onSelectionChange?: array<string> => unit,
  enableSearch?: bool,
  searchPlaceholder?: string,
  cancelText?: string,
  confirmText?: string,
  onCancel?: unit => unit,
  onConfirm?: unit => unit,
  showCancelButton?: bool,
  direction?: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
  className?: string,
  style?: JsxDOM.style,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "NestedMultiSelectDrawer"
