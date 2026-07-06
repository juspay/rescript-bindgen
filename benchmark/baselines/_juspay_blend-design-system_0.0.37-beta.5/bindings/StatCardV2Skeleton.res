@module("@juspay/blend-design-system") @react.component
external make: (
  ~skeleton: StatCardV2Types.statCardV2SkeletonProps,
  ~maxWidth: CommonTypes.stringOrNumber,
  ~minWidth: CommonTypes.stringOrNumber,
) => React.element = "StatCardV2Skeleton"
