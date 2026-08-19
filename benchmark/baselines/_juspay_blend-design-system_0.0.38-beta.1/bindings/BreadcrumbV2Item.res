type props = {
  href?: string,
  onClick?: ReactEvent.Mouse.t => unit,
  isActive?: bool,
  children: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "BreadcrumbV2Item"
