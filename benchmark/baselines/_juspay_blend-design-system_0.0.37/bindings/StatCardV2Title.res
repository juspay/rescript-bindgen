type props = {
  title: string,
  helpIconText?: string,
  tokens: StatCardV2Types.statCardV2TokensType,
  id?: string,
  isSmallScreen?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2Title"
