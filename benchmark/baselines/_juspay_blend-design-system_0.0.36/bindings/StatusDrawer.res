type props = {
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  heading: string,
  description: string,
  primaryButtonProps: ButtonTypes.buttonProps,
  secondaryButtonProps?: ButtonTypes.buttonProps,
  slot: React.element,
  direction?: DrawerTypes.drawerDirection,
  modal?: bool,
  dismissible?: bool,
  mobileOffset?: DrawerTypes.drawerMobileOffsetConfig,
  className?: string,
  style?: JsxDOM.style,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatusDrawer"
