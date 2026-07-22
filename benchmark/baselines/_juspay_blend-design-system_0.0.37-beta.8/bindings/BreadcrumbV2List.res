type props = {
  breadcrumbTokens: BreadcrumbV2Types.breadcrumbV2TokensType,
  shouldShowMenu: bool,
  base?: BreadcrumbV2Types.indexedBreadcrumbChild,
  rest: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  menuItems: array<BreadcrumbV2Types.indexedBreadcrumbChild>,
  totalItems: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "BreadcrumbV2List"
