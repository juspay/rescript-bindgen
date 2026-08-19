type props = {
  changeValueText?: string,
  leftSymbol?: string,
  rightSymbol?: string,
  arrowDirection: StatCardV2Types.statCardV2ArrowDirection,
  changeType: StatCardV2Types.statCardV2ChangeType,
  tokens: StatCardV2Types.statCardV2TokensType,
  tooltip?: React.element,
  id?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2Change"
