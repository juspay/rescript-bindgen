@module("@juspay/blend-design-system") @react.component
external make: (
  ~value: string=?,
  ~valueTooltip: React.element=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~variant: StatCardV2Types.statCardV2Variant,
  ~id: string=?,
  ~isSmallScreen: bool=?,
) => React.element = "StatCardV2Value"
