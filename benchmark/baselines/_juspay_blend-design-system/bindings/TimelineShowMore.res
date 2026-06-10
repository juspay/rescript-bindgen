@module("@juspay/blend-design-system") @react.component
external make: (
  ~count: int,
  ~label: string=?,
  ~onShowMore: unit => unit=?,
  ~buttonProps: ButtonV2Types.buttonPropsConfig=?,
) => React.element = "TimelineShowMore"
