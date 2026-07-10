@module("@juspay/blend-design-system") @react.component
external make: (
  ~changeValueText: string=?,
  ~leftSymbol: string=?,
  ~rightSymbol: string=?,
  ~arrowDirection: StatCardV2Types.statCardV2ArrowDirection,
  ~changeType: StatCardV2Types.statCardV2ChangeType,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~tooltip: React.element=?,
  ~id: string=?,
) => React.element = "StatCardV2Change"
