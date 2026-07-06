@module("@juspay/blend-design-system") @react.component
external make: (
  ~breadcrumbTokens: BreadcrumbV2Types.breadcrumbV2TokensType,
  ~shouldShowMenu: bool,
  ~base: BreadcrumbV2Types.indexedBreadcrumbChild=?,
  ~rest: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  ~menuItems: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  ~totalItems: float,
) => React.element = "BreadcrumbV2List"
