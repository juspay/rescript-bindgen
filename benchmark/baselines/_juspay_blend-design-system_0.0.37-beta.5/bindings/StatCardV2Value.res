@module("@juspay/blend-design-system") @react.component
external make: (
  ~value: string=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~variant: StatCardV2Types.statCardV2Variant,
  ~id: string=?,
) => React.element = "StatCardV2Value"
