@module("@juspay/blend-design-system") @react.component
external make: (
  ~footer: React.element=?,
  ~sidebarState: SidebarV2Types.sidebarV2SidebarV2PropsOnSidebarStateChange,
  ~tokens: SidebarV2Types.sidebarV2TokensType,
) => React.element = "SidebarV2Footer"
