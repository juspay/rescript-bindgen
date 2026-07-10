@module("@juspay/blend-design-system") @react.component
external make: (
  ~menuItems: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  ~breadcrumbTokens: BreadcrumbV2Types.breadcrumbV2TokensType,
) => React.element = "BreadcrumbV2OverflowMenu"
