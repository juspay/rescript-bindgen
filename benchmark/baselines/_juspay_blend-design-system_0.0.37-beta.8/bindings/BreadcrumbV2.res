@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element=?,
  ~items: array<BreadcrumbV2Types.breadcrumbV2ItemType>=?,
  ~maxItems: float=?,
) => React.element = "BreadcrumbV2"

// Compound statics — zero-cost aliases; use <BreadcrumbV2.Icon />
module Icon = BreadcrumbV2Icon
module Item = BreadcrumbV2Item
module Page = BreadcrumbV2Page
module Separator = BreadcrumbV2Separator
