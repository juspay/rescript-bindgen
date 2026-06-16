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
type maxWidthConfig = {
  withLeftPanel: string,
  withoutLeftPanel: string,
  iconOnly?: string,
}
type paddingConfig17 = {
  x: string,
  y: string,
}
type borderConfig7 = {
  default: string,
  hover: string,
  active: string,
}
type itemConfig4 = {
  width: string,
  borderRadius: string,
  border: borderConfig7,
  backgroundColor: borderConfig7,
}
type leftPanelConfig = {
  width: string,
  backgroundColor: string,
  borderRight: string,
  padding: paddingConfig17,
  gap: string,
  item: itemConfig4,
}
type toggleButtonConfig = {
  backgroundColor: borderConfig7,
  width: string,
}
type headerConfig9 = {
  backgroundColor: string,
  padding: paddingConfig17,
  gap: string,
  borderBottom: string,
  toggleButton: toggleButtonConfig,
}
type directoryConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
}
type footerConfig5 = {
  backgroundColor: string,
  padding: paddingConfig17,
  borderTop: string,
}
type sidebarTokenType = {
  maxWidth: maxWidthConfig,
  backgroundColor: string,
  borderRight: string,
  leftPanel: leftPanelConfig,
  header: headerConfig9,
  directory: directoryConfig,
  footer: footerConfig5,
}
type responsiveSidebarTokens = {
  sm: sidebarTokenType,
  lg: sidebarTokenType,
}
type drawerConfig3 = {
  borderRadius: string,
  borderTop: string,
}
type backgroundColorConfig19 = {
  default: string,
  active: string,
}
type iconConfig7 = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
}
type textConfig23 = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type itemConfig9 = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: backgroundColorConfig19,
  color: backgroundColorConfig19,
  fontWeight: string,
  icon: iconConfig7,
  text: textConfig23,
}
type iconConfig8 = {
  width: string,
  height: string,
}
type primaryActionConfig3 = {
  width: string,
  height: string,
  borderRadius: string,
  background: string,
  boxShadow: string,
  color: string,
  icon: iconConfig8,
}
type rowConfig4 = {
  padding: paddingConfig17,
  gap: string,
  item: itemConfig9,
  primaryAction: primaryActionConfig3,
}
type mobileNavigationTokenType = {
  backgroundColor: string,
  drawer: drawerConfig3,
  padding: paddingConfig17,
  gap: string,
  row: rowConfig4,
}
type responsiveMobileNavigationTokens = {
  sm: mobileNavigationTokenType,
  lg: mobileNavigationTokenType,
}
