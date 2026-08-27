type props = {
  footer?: React.element,
  sidebarState: HighchartsSharedTypes.sidebarV2SidebarV2PropsOnSidebarStateChange,
  tokens: HighchartsSharedTypes.sidebarV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SidebarV2Footer"
