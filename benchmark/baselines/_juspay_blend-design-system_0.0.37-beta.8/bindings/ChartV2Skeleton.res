type props = {
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  height?: float,
  isExpanded?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartV2Skeleton"
