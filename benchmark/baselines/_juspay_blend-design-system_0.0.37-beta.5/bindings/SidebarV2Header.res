@module("@juspay/blend-design-system") @react.component
external make: (
  ~sidebarTopSlot: React.element=?,
  ~merchantInfo: SidebarV2Types.sidebarV2MerchantInfoConfig=?,
  ~isExpanded: bool,
  ~isScrolled: bool,
  ~sidebarCollapseKey: string,
  ~onToggle: unit => unit,
  ~sidebarNavId: string=?,
  ~hideToggleButton: bool=?,
  ~iconOnlyMode: bool=?,
  ~tokens: SidebarV2Types.sidebarV2TokensType,
) => React.element = "SidebarV2Header"
