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
type sidebarSidebarTokenTypeLeftPanelItemBorderConfig = {
  active: string,
  default: string,
  hover: string,
}
type sidebarSidebarTokenTypeLeftPanelItemConfig = {
  width: string,
  borderRadius: string,
  border: sidebarSidebarTokenTypeLeftPanelItemBorderConfig,
  backgroundColor: sidebarSidebarTokenTypeLeftPanelItemBorderConfig,
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
  backgroundColor: sidebarSidebarTokenTypeLeftPanelItemBorderConfig,
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
type sidebarMobileNavigationTokenTypeDrawerConfig = {
  borderRadius: string,
  borderTop: string,
}
type sidebarMobileNavigationTokenTypeRowItemBackgroundColorConfig = {
  active: string,
  default: string,
}
type sidebarMobileNavigationTokenTypeRowItemIconConfig = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
}
type sidebarMobileNavigationTokenTypeRowItemTextConfig = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type sidebarMobileNavigationTokenTypeRowItemConfig = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: sidebarMobileNavigationTokenTypeRowItemBackgroundColorConfig,
  color: sidebarMobileNavigationTokenTypeRowItemBackgroundColorConfig,
  fontWeight: string,
  icon: sidebarMobileNavigationTokenTypeRowItemIconConfig,
  text: sidebarMobileNavigationTokenTypeRowItemTextConfig,
}
type sidebarMobileNavigationTokenTypeRowPrimaryActionIconConfig = {
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
  icon: sidebarMobileNavigationTokenTypeRowPrimaryActionIconConfig,
}
type sidebarMobileNavigationTokenTypeRowConfig = {
  padding: sidebarSidebarTokenTypeLeftPanelPaddingConfig,
  gap: string,
  item: sidebarMobileNavigationTokenTypeRowItemConfig,
  primaryAction: sidebarMobileNavigationTokenTypeRowPrimaryActionConfig,
}
type mobileNavigationTokenType = {
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
type tenantBadge = {
  text: string,
  size?: BadgeTypes.badgeSize,
  color?: BadgeTypes.badgeColor,
  position?: BadgeTypes.badgePosition,
}
type leftPanelItem = {
  label: string,
  icon: React.element,
  value?: string,
  showInPanel?: bool,
  badge?: tenantBadge,
}
type leftPanelInfo = {
  items: array<leftPanelItem>,
  selected: string,
  onSelect: string => unit,
  tenantSlot1?: React.element,
  tenantSlot2?: React.element,
  tenantFooter?: React.element,
}
type sidebarProps = {
  showLeftPanel?: bool,
  children: React.element,
  data: Nullable.t<array<DirectoryTypes.directoryData>>,
  leftPanel?: leftPanelInfo,
  topbar: React.element,
  footer?: React.element,
  sidebarTopSlot?: React.element,
  sidebarCollapseKey?: string,
  merchantInfo?: TopbarTypes.merchantInfo,
  rightActions?: React.element,
  enableTopbarAutoHide?: bool,
  isTopbarVisible?: bool,
  onTopbarVisibilityChange?: bool => unit,
  defaultIsTopbarVisible?: bool,
  isExpanded?: bool,
  onExpandedChange?: bool => unit,
  onSidebarStateChange?: sidebarStateChangeType => unit,
  defaultIsExpanded?: bool,
  panelOnlyMode?: bool,
  disableIntermediateState?: bool,
  iconOnlyMode?: bool,
  hideOnIconOnlyToggle?: bool,
  showPrimaryActionButton?: bool,
  primaryActionButtonProps?: ReactTypes.reactSidebarPropsPrimaryActionButtonPropsConfig,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
  onHoveringChange?: bool => unit,
}
