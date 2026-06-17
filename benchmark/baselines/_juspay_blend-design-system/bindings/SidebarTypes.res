type sidebarStateChangeType =
  | @as("expanded") Expanded
  | @as("collapsed") Collapsed
  | @as("intermediate") Intermediate
type leftPanelItem = {
  label: string,
  icon: React.element,
  value?: string,
  showInPanel?: bool,
}
type leftPanelInfo = {
  items: array<leftPanelItem>,
  selected: string,
  onSelect: string => unit,
  tenantSlot1?: React.element,
  tenantSlot2?: React.element,
  tenantFooter?: React.element,
}
type sidebarMaxWidthConfig = {
  withLeftPanel: string,
  withoutLeftPanel: string,
  iconOnly?: string,
}
type sidebarPaddingConfig = {
  x: string,
  y: string,
}
type sidebarBorderConfig = {
  default: string,
  hover: string,
  active: string,
}
type sidebarItemConfig = {
  width: string,
  borderRadius: string,
  border: sidebarBorderConfig,
  backgroundColor: sidebarBorderConfig,
}
type sidebarLeftPanelConfig = {
  width: string,
  backgroundColor: string,
  borderRight: string,
  padding: sidebarPaddingConfig,
  gap: string,
  item: sidebarItemConfig,
}
type sidebarToggleButtonConfig = {
  backgroundColor: sidebarBorderConfig,
  width: string,
}
type sidebarHeaderConfig = {
  backgroundColor: string,
  padding: sidebarPaddingConfig,
  gap: string,
  borderBottom: string,
  toggleButton: sidebarToggleButtonConfig,
}
type sidebarDirectoryConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
}
type sidebarFooterConfig = {
  backgroundColor: string,
  padding: sidebarPaddingConfig,
  borderTop: string,
}
type sidebarTokenType = {
  maxWidth: sidebarMaxWidthConfig,
  backgroundColor: string,
  borderRight: string,
  leftPanel: sidebarLeftPanelConfig,
  header: sidebarHeaderConfig,
  directory: sidebarDirectoryConfig,
  footer: sidebarFooterConfig,
}
type responsiveSidebarTokens = {
  sm: sidebarTokenType,
  lg: sidebarTokenType,
}
type sidebarDrawerConfig = {
  borderRadius: string,
  borderTop: string,
}
type sidebarBackgroundColorConfig = {
  default: string,
  active: string,
}
type sidebarIconConfig = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
}
type sidebarTextConfig = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type sidebarItemConfig2 = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: sidebarBackgroundColorConfig,
  color: sidebarBackgroundColorConfig,
  fontWeight: string,
  icon: sidebarIconConfig,
  text: sidebarTextConfig,
}
type sidebarIconConfig2 = {
  width: string,
  height: string,
}
type sidebarPrimaryActionConfig = {
  width: string,
  height: string,
  borderRadius: string,
  background: string,
  boxShadow: string,
  color: string,
  icon: sidebarIconConfig2,
}
type sidebarRowConfig = {
  padding: sidebarPaddingConfig,
  gap: string,
  item: sidebarItemConfig2,
  primaryAction: sidebarPrimaryActionConfig,
}
type mobileNavigationTokenType = {
  backgroundColor: string,
  drawer: sidebarDrawerConfig,
  padding: sidebarPaddingConfig,
  gap: string,
  row: sidebarRowConfig,
}
type responsiveMobileNavigationTokens = {
  sm: mobileNavigationTokenType,
  lg: mobileNavigationTokenType,
}
