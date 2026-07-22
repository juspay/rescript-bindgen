type props = {
  id: string,
  secondarySidebar?: SidebarV2Types.secondarySidebarInfo,
  tokens: SidebarV2Types.sidebarV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SecondarySidebar"
