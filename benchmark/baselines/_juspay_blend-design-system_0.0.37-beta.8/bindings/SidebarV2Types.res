type sidebarV2SidebarV2PropsOnSidebarStateChange =
  | @as("expanded") Expanded
  | @as("collapsed") Collapsed
  | @as("intermediate") Intermediate
type sidebarV2MobileNavigationV2TokenTypeContainerConfig = {
  zIndex: string,
  backgroundColor: string,
  background?: string,
  border: string,
  borderWidth: string,
  borderRadius: string,
  backdropFilter: string,
  transition: string,
}
type sidebarV2MobileNavigationV2TokenTypeLayoutConfig = {
  safeAreaOffset: string,
  floatingPadding: string,
  primaryActionMarginX: string,
  itemLabelMarginTop: string,
  itemLabelLineHeight: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  gap: string,
  rowPaddingTop: string,
  rowPaddingBottom: string,
  rowPaddingLeft: string,
  rowPaddingRight: string,
  rowGap: string,
}
type sidebarV2MobileNavigationV2TokenTypeItemBackgroundColorConfig = {
  active: string,
  default: string,
}
type sidebarV2MobileNavigationV2TokenTypeItemIconConfig = {
  width: string,
  height: string,
  borderRadius: string,
  transition: string,
  strokeWidth: float,
}
type sidebarV2MobileNavigationV2TokenTypeItemTextConfig = {
  fontSize: string,
  fontWeight: string,
  textAlign: string,
}
type sidebarV2MobileNavigationV2TokenTypeItemConfig = {
  width: string,
  height: string,
  borderRadius: string,
  gap: string,
  backgroundColor: sidebarV2MobileNavigationV2TokenTypeItemBackgroundColorConfig,
  color: sidebarV2MobileNavigationV2TokenTypeItemBackgroundColorConfig,
  fontWeight: string,
  icon: sidebarV2MobileNavigationV2TokenTypeItemIconConfig,
  text: sidebarV2MobileNavigationV2TokenTypeItemTextConfig,
}
type sidebarV2MobileNavigationV2TokenTypePrimaryActionIconConfig = {
  width: string,
  height: string,
  strokeWidth: float,
}
type sidebarV2MobileNavigationV2TokenTypePrimaryActionConfig = {
  width: string,
  height: string,
  borderRadius: string,
  background: string,
  boxShadow: string,
  color: string,
  icon: sidebarV2MobileNavigationV2TokenTypePrimaryActionIconConfig,
}
type mobileNavigationV2TokenType = {
  container: sidebarV2MobileNavigationV2TokenTypeContainerConfig,
  layout: sidebarV2MobileNavigationV2TokenTypeLayoutConfig,
  item: sidebarV2MobileNavigationV2TokenTypeItemConfig,
  primaryAction: sidebarV2MobileNavigationV2TokenTypePrimaryActionConfig,
}
type responsiveMobileNavigationV2Tokens = {
  sm: mobileNavigationV2TokenType,
  lg: mobileNavigationV2TokenType,
}
type sidebarV2SidebarV2TokensTypeContainerHoverPreviewConfig = {
  boxShadow: string,
}
type sidebarV2SidebarV2TokensTypeContainerMaxWidthConfig = {
  withLeftPanel: string,
  withoutLeftPanel: string,
  iconOnly: string,
}
type sidebarV2SidebarV2TokensTypeContainerConfig = {
  zIndex: string,
  backgroundColor: string,
  borderRight: string,
  hoverPreview: sidebarV2SidebarV2TokensTypeContainerHoverPreviewConfig,
  maxWidth: sidebarV2SidebarV2TokensTypeContainerMaxWidthConfig,
}
type sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig = {
  active: string,
  default: string,
  hover: string,
}
type sidebarV2SidebarV2TokensTypeLeftPanelItemConfig = {
  width: string,
  borderRadius: string,
  border: sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig,
  backgroundColor: sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig,
}
type sidebarV2SidebarV2TokensTypeLeftPanelConfig = {
  width: string,
  backgroundColor: string,
  borderRight: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  gap: string,
  item: sidebarV2SidebarV2TokensTypeLeftPanelItemConfig,
}
type sidebarV2SidebarV2TokensTypeHeaderToggleButtonConfig = {
  borderRadius: string,
  padding: string,
  backgroundColor: sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig,
  width: string,
  iconColor: string,
}
type sidebarV2SidebarV2TokensTypeHeaderConfig = {
  zIndex: string,
  backgroundColor: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  gap: string,
  borderBottom: string,
  borderBottomWidth: string,
  scrolledBorderColor: string,
  toggleButton: sidebarV2SidebarV2TokensTypeHeaderToggleButtonConfig,
}
type sidebarV2SidebarV2TokensTypeDirectoryConfig = {
  gap: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
}
type sidebarV2SidebarV2TokensTypeFooterConfig = {
  zIndex: string,
  backgroundColor: string,
  gap: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  borderTop: string,
}
type sidebarV2SidebarV2TokensTypePrimarySidebarConfig = {
  width: string,
}
type sidebarV2SidebarV2TokensTypeSecondarySidebarItemConfig = {
  width: string,
  height: string,
  borderRadius: string,
  border: sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig,
  backgroundColor: sidebarV2SidebarV2TokensTypeLeftPanelItemBorderConfig,
}
type sidebarV2SidebarV2TokensTypeSecondarySidebarConfig = {
  width: string,
  borderRight: string,
  backgroundColor: string,
  gap: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  item: sidebarV2SidebarV2TokensTypeSecondarySidebarItemConfig,
}
type sidebarV2TokensType = {
  container: sidebarV2SidebarV2TokensTypeContainerConfig,
  leftPanel: sidebarV2SidebarV2TokensTypeLeftPanelConfig,
  header: sidebarV2SidebarV2TokensTypeHeaderConfig,
  directory: sidebarV2SidebarV2TokensTypeDirectoryConfig,
  footer: sidebarV2SidebarV2TokensTypeFooterConfig,
  primarySidebar: sidebarV2SidebarV2TokensTypePrimarySidebarConfig,
  secondarySidebar: sidebarV2SidebarV2TokensTypeSecondarySidebarConfig,
}
type responsiveSidebarV2Tokens = {
  sm: sidebarV2TokensType,
  lg: sidebarV2TokensType,
}
type secondarySidebarItem = {
  label: string,
  value: string,
  icon: React.element,
  badge?: SharedTypes.tenantBadge,
}
type secondarySidebarInfo = {
  items: array<secondarySidebarItem>,
  selected: string,
  onSelect: string => unit,
  buttonProps?: ReactTypes.reactSidebarPropsPrimaryActionButtonPropsConfig,
  footerSlot?: React.element,
}
type sidebarV2Props = {
  height?: string,
  children?: React.element,
  data?: Nullable.t<array<DirectoryTypes.directoryData>>,
  secondarySidebar?: secondarySidebarInfo,
  topbar?: React.element,
  footer?: React.element,
  sidebarTopSlot?: React.element,
  sidebarCollapseKey?: string,
  merchantInfo?: SharedTypes.merchantInfo,
  rightActions?: React.element,
  enableTopbarAutoHide?: bool,
  isTopbarVisible?: bool,
  onTopbarVisibilityChange?: bool => unit,
  defaultIsTopbarVisible?: bool,
  isExpanded?: bool,
  onExpandedChange?: bool => unit,
  onSidebarStateChange?: sidebarV2SidebarV2PropsOnSidebarStateChange => unit,
  defaultIsExpanded?: bool,
  showMobilePrimaryActionButton?: bool,
  mobilePrimaryActionButtonProps?: ReactTypes.reactSidebarPropsPrimaryActionButtonPropsConfig,
  activeItem?: Nullable.t<string>,
  onActiveItemChange?: Nullable.t<string> => unit,
  defaultActiveItem?: Nullable.t<string>,
}
type sidebarV2MerchantInfoItemsConfig = {
  label: string,
  value: string,
  icon?: React.element,
}
type sidebarV2MerchantInfoConfig = {
  items: array<sidebarV2MerchantInfoItemsConfig>,
  selected: string,
  onSelect: string => unit,
}
type sidebarV2MobileNavigationItem = {
  label: string,
  items?: array<DirectoryTypes.navbarItem>,
  leftSlot?: React.element,
  rightSlot?: React.element,
  onClick?: unit => unit,
  href?: string,
  isSelected?: bool,
  showOnMobile?: bool,
  sectionLabel?: string,
}
