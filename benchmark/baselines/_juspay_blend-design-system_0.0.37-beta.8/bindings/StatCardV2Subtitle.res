@module("@juspay/blend-design-system") @react.component
external make: (
  ~subtitle: string=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~id: string=?,
) => React.element = "StatCardV2Subtitle"
