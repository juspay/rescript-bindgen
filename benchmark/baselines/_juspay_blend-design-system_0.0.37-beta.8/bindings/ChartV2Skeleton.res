@module("@juspay/blend-design-system") @react.component
external make: (
  ~skeletonVariant: SkeletonTypes.skeletonVariant=?,
  ~height: float=?,
  ~isExpanded: bool=?,
) => React.element = "ChartV2Skeleton"
