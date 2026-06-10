@module("@juspay/blend-design-system") @react.component
external make: (
  ~maxWidth: string=?,
  ~maxHeight: string=?,
  ~minHeight: string=?,
  ~skeleton: CardTypes.cardSkeletonProps=?,
  ~variant: CardTypes.variant=?,
) => React.element = "Card"
