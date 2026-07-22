type props = {
  footer?: React.element,
  sidebarState: SidebarV2Types.sidebarV2SidebarV2PropsOnSidebarStateChange,
  tokens: SidebarV2Types.sidebarV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SidebarV2Footer"
