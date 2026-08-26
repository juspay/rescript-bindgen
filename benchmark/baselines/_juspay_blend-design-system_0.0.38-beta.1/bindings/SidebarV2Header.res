type props = {
  sidebarTopSlot?: React.element,
  merchantInfo?: HighchartsSharedTypes.sidebarV2MerchantInfoConfig,
  isExpanded: bool,
  isScrolled: bool,
  sidebarCollapseKey: string,
  onToggle: unit => unit,
  sidebarNavId?: string,
  hideToggleButton?: bool,
  iconOnlyMode?: bool,
  tokens: HighchartsSharedTypes.sidebarV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SidebarV2Header"
