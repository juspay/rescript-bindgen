type props = {
  id: string,
  secondarySidebar?: HighchartsSharedTypes.secondarySidebarInfo,
  isExpanded?: bool,
  tokens: HighchartsSharedTypes.sidebarV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SecondarySidebar"
