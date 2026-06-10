@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~disabled: bool=?,
  ~asChild: bool=?,
  @as("aria-label") ~ariaLabel: string=?,
) => React.element = "DrawerClose"
