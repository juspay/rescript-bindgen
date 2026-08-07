type props = {
  children: React.element,
  className?: string,
  disabled?: bool,
  asChild?: bool,
  @as("aria-label") ariaLabel?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerClose"
