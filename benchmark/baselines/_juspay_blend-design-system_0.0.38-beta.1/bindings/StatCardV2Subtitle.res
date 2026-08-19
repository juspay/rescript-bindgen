type props = {
  subtitle?: string,
  tokens: StatCardV2Types.statCardV2TokensType,
  id?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2Subtitle"
