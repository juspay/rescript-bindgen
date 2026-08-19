type topbarV2TopbarV2TokenTypeSeparatorConfig = {
  width: string,
  color: string,
}
type topbarV2TopbarV2TokenTypeToggleButtonBackgroundColorConfig = {
  active: string,
  default: string,
  hover: string,
}
type topbarV2TopbarV2TokenTypeToggleButtonIconConfig = {
  size: string,
  color: string,
}
type topbarV2TopbarV2TokenTypeToggleButtonConfig = {
  borderRadius: string,
  padding: string,
  backgroundColor: topbarV2TopbarV2TokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
  icon: topbarV2TopbarV2TokenTypeToggleButtonIconConfig,
}
type topbarV2TopbarV2TokenTypeActionButtonConfig = {
  borderRadius: string,
  padding: string,
  minWidth: string,
  height: string,
  backgroundColor: topbarV2TopbarV2TokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
  icon: topbarV2TopbarV2TokenTypeToggleButtonIconConfig,
}
type topbarV2TopbarV2TokenTypeTenantIconButtonConfig = {
  borderRadius: string,
  minHeight: string,
  backgroundColor: topbarV2TopbarV2TokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
}
type topbarV2TopbarV2TokenTypeMerchantSelectTriggerTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type topbarV2TopbarV2TokenTypeMerchantSelectTriggerConfig = {
  gap: string,
  icon: topbarV2TopbarV2TokenTypeToggleButtonIconConfig,
  text: topbarV2TopbarV2TokenTypeMerchantSelectTriggerTextConfig,
}
type topbarV2TopbarV2TokenTypeLeftSectionConfig = {
  gap: string,
  maxHeight: string,
  divider: topbarV2TopbarV2TokenTypeMerchantSelectTriggerTextConfig,
}
type topbarV2TopbarV2TokenTypeRightSectionConfig = {
  gap: string,
}
type topbarV2TokenType = {
  zIndex: string,
  height: string,
  borderBottom: string,
  backgroundColor: string,
  backdropFilter: string,
  padding: string,
  gap: string,
  separator: topbarV2TopbarV2TokenTypeSeparatorConfig,
  toggleButton: topbarV2TopbarV2TokenTypeToggleButtonConfig,
  actionButton: topbarV2TopbarV2TokenTypeActionButtonConfig,
  tenantIconButton: topbarV2TopbarV2TokenTypeTenantIconButtonConfig,
  merchantSelectTrigger: topbarV2TopbarV2TokenTypeMerchantSelectTriggerConfig,
  leftSection: topbarV2TopbarV2TokenTypeLeftSectionConfig,
  rightSection: topbarV2TopbarV2TokenTypeRightSectionConfig,
  sidebarSection: topbarV2TopbarV2TokenTypeRightSectionConfig,
}
type responsiveTopbarV2Tokens = {
  sm: topbarV2TokenType,
  lg: topbarV2TokenType,
}
type topbarV2MerchantInfoV2ItemsConfig = {
  label: string,
  value: string,
  icon?: React.element,
}
type merchantInfoV2 = {
  items: array<topbarV2MerchantInfoV2ItemsConfig>,
  selected: string,
  onSelect: string => unit,
}
type topbarV2Props = {
  children?: React.element,
  isExpanded?: bool,
  onToggleExpansion?: unit => unit,
  showToggleButton?: bool,
  panelOnlyMode?: bool,
  isVisible?: bool,
  onVisibilityChange?: bool => unit,
  defaultIsVisible?: bool,
  sidebarTopSlot?: React.element,
  topbar?: React.element,
  leftAction?: React.element,
  rightActions?: React.element,
  showBackButton?: bool,
  onBackClick?: unit => unit,
  secondarySidebar?: SidebarV2Types.secondarySidebarInfo,
  merchantInfo?: merchantInfoV2,
  ariaControls?: string,
}
