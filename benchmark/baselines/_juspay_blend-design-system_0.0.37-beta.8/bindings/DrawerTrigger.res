type props = {
  children: React.element,
  className?: string,
  disabled?: bool,
  onClick?: unit => unit,
  @as("aria-label") ariaLabel?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerTrigger"
