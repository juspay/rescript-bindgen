type sidebarStateChangeType =
  | @as("expanded") Expanded
  | @as("collapsed") Collapsed
  | @as("intermediate") Intermediate
type sidebarSidebarTokenTypeMaxWidthConfig = {
  withLeftPanel: string,
  withoutLeftPanel: string,
  iconOnly?: string,
}
type sidebarSidebarTokenTypeLeftPanelPaddingConfig = {
  x: string,
  y: string,
}
type sidebarUseThemeBorderConfig = {
  active: string,
  default: string,
  hover: string,
}
type sidebarSidebarTokenTypeLeftPanelItemConfig = {
  width: string,
  borderRadius: string,
  border: sidebarUseThemeBorderConfig,
  backgroundColor: sidebarUseThemeBorderConfig,
}
type sidebarSidebarTokenTypeLeftPanelConfig = {
  width: string,
  backgroundColor: string,
  borderRight: string,
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  gap: string,
  item: sidebarSidebarTokenTypeLeftPanelItemConfig,
}
type sidebarSidebarTokenTypeHeaderToggleButtonConfig = {
  backgroundColor: sidebarUseThemeBorderConfig,
  width: string,
}
type sidebarSidebarTokenTypeHeaderConfig = {
  backgroundColor: string,
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  gap: string,
  borderBottom: string,
  toggleButton: sidebarSidebarTokenTypeHeaderToggleButtonConfig,
}
type sidebarSidebarTokenTypeDirectoryConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
}
type sidebarSidebarTokenTypeFooterConfig = {
  backgroundColor: string,
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  borderTop: string,
}
type sidebarTokenType = {
  maxWidth: sidebarSidebarTokenTypeMaxWidthConfig,
  backgroundColor: string,
  borderRight: string,
  leftPanel: sidebarSidebarTokenTypeLeftPanelConfig,
  header: sidebarSidebarTokenTypeHeaderConfig,
  directory: sidebarSidebarTokenTypeDirectoryConfig,
  footer: sidebarSidebarTokenTypeFooterConfig,
}
type responsiveSidebarTokens = {
  sm: sidebarTokenType,
  lg: sidebarTokenType,
}
type sidebarMobileNavigationTokenTypeContainerConfig = {
  backgroundColor: string,
  background?: string,
  border: string,
  borderRadius: string,
  backdropFilter: string,
  zIndex?: string,
  transition?: string,
}
type sidebarMobileNavigationTokenTypeDrawerConfig = {
  borderRadius: string,
  borderTop: string,
}
type sidebarUseThemeBackgroundColorConfig = {
  active: string,
  default: string,
}
type __typeHdipr = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
}
type __typeNl3f3 = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type sidebarMobileNavigationTokenTypeRowItemConfig = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: sidebarUseThemeBackgroundColorConfig,
  color: sidebarUseThemeBackgroundColorConfig,
  fontWeight: string,
  icon: __typeHdipr,
  text: __typeNl3f3,
}
type __typeV44l1h3 = {
  width: string,
  height: string,
}
type sidebarMobileNavigationTokenTypeRowPrimaryActionConfig = {
  width: string,
  height: string,
  borderRadius: string,
  background: string,
  boxShadow: string,
  color: string,
  icon: __typeV44l1h3,
}
type sidebarMobileNavigationTokenTypeRowConfig = {
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  gap: string,
  item: sidebarMobileNavigationTokenTypeRowItemConfig,
  primaryAction: sidebarMobileNavigationTokenTypeRowPrimaryActionConfig,
}
type mobileNavigationTokenType = {
  container: sidebarMobileNavigationTokenTypeContainerConfig,
  backgroundColor: string,
  drawer: sidebarMobileNavigationTokenTypeDrawerConfig,
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  gap: string,
  row: sidebarMobileNavigationTokenTypeRowConfig,
}
type responsiveMobileNavigationTokens = {
  sm: mobileNavigationTokenType,
  lg: mobileNavigationTokenType,
}
