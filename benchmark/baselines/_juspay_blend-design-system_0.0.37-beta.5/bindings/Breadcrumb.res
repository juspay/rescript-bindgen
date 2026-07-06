@module("@juspay/blend-design-system") @react.component
external make: (
  ~items: Nullable.t<array<BreadcrumbTypes.breadcrumbItemType>>,
  ~skeleton: BreadcrumbTypes.breadcrumbSkeletonProps=?,
) => React.element = "Breadcrumb"
