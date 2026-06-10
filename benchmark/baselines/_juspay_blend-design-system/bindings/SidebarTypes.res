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
type itemConfig4 = {
  width: string,
  borderRadius: string,
  border: BreadcrumbTypes.colorConfig3,
  backgroundColor: BreadcrumbTypes.colorConfig3,
}
type leftPanelConfig = {
  width: string,
  backgroundColor: string,
  borderRight: string,
  padding: ModalTypes.paddingConfig5,
  gap: string,
  item: itemConfig4,
}
type toggleButtonConfig = {
  backgroundColor: BreadcrumbTypes.colorConfig3,
  width: string,
}
type headerConfig9 = {
  backgroundColor: string,
  padding: ModalTypes.paddingConfig5,
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
  padding: ModalTypes.paddingConfig5,
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
type backgroundColorConfig15 = {
  default: string,
  active: string,
}
type iconConfig7 = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
}
type textConfig20 = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type itemConfig9 = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: backgroundColorConfig15,
  color: backgroundColorConfig15,
  fontWeight: string,
  icon: iconConfig7,
  text: textConfig20,
}
type primaryActionConfig2 = {
  width: string,
  height: string,
  borderRadius: string,
  background: string,
  boxShadow: string,
  color: string,
  icon: AvatarTypes.smConfig4,
}
type rowConfig4 = {
  padding: ModalTypes.paddingConfig5,
  gap: string,
  item: itemConfig9,
  primaryAction: primaryActionConfig2,
}
type mobileNavigationTokenType = {
  backgroundColor: string,
  drawer: drawerConfig3,
  padding: ModalTypes.paddingConfig5,
  gap: string,
  row: rowConfig4,
}
type responsiveMobileNavigationTokens = {
  sm: mobileNavigationTokenType,
  lg: mobileNavigationTokenType,
}
