type props = {
  children?: React.element,
  items?: array<BreadcrumbV2Types.breadcrumbV2ItemType>,
  maxItems?: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "BreadcrumbV2"

// Compound statics — zero-cost aliases; use <BreadcrumbV2.Icon />
module Icon = BreadcrumbV2Icon
module Item = BreadcrumbV2Item
module Page = BreadcrumbV2Page
module Separator = BreadcrumbV2Separator
