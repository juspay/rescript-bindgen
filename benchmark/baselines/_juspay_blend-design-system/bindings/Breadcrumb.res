@module("@juspay/blend-design-system") @react.component
external make: (
  ~items: array<BreadcrumbTypes.breadcrumbItemType>,
  ~skeleton: BreadcrumbTypes.breadcrumbSkeletonProps=?,
) => React.element = "Breadcrumb"
