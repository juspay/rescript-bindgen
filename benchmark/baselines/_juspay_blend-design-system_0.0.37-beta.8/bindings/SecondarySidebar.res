@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string,
  ~secondarySidebar: SidebarV2Types.secondarySidebarInfo=?,
  ~tokens: SidebarV2Types.sidebarV2TokensType,
) => React.element = "SecondarySidebar"
