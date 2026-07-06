@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element=?,
  ~items: array<BreadcrumbV2Types.breadcrumbV2ItemType>=?,
  ~maxItems: float=?,
) => React.element = "BreadcrumbV2"
