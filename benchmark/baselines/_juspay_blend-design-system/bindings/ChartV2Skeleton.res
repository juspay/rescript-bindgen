@module("@juspay/blend-design-system") @react.component
external make: (
  ~skeletonVariant: ButtonSkeletonTypes.skeletonVariant=?,
  ~height: int=?,
  ~isExpanded: bool=?,
) => React.element = "ChartV2Skeleton"
