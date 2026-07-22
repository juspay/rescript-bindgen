type props = {
  value?: string,
  valueTooltip?: React.element,
  tokens: StatCardV2Types.statCardV2TokensType,
  variant: StatCardV2Types.statCardV2Variant,
  id?: string,
  isSmallScreen?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2Value"
