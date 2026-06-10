@module("@juspay/blend-design-system") @react.component
external make: (
  ~skeletonVariant: ButtonSkeletonTypes.skeletonVariant=?,
  ~height: float=?,
  ~isExpanded: bool=?,
) => React.element = "ChartV2Skeleton"
