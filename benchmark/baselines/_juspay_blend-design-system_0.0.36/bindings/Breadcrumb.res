type props = {
  items: array<BreadcrumbTypes.breadcrumbItemType>,
  skeleton?: BreadcrumbTypes.breadcrumbSkeletonProps,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Breadcrumb"
