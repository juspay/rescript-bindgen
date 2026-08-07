type props = {
  menuItems: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  breadcrumbTokens: BreadcrumbV2Types.breadcrumbV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "BreadcrumbV2OverflowMenu"
