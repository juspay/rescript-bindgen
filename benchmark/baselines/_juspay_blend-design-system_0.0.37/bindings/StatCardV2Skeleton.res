type props = {
  skeleton: StatCardV2Types.statCardV2SkeletonProps,
  maxWidth: CommonTypes.stringOrNumber,
  minWidth: CommonTypes.stringOrNumber,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2Skeleton"
