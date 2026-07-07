@module("@juspay/blend-design-system") @react.component
external make: (
  ~skeleton: StatCardV2Types.statCardV2SkeletonProps,
  ~maxWidth: HighchartsSharedTypes.stringOrNumber,
  ~minWidth: HighchartsSharedTypes.stringOrNumber,
) => React.element = "StatCardV2Skeleton"
