@module("@juspay/blend-design-system") @react.component
external make: (
  ~href: string=?,
  ~onClick: ReactEvent.Mouse.t => unit=?,
  ~isActive: bool=?,
  ~children: React.element,
) => React.element = "BreadcrumbV2Item"
