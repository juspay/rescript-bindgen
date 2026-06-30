type topbarMerchantInfoItemsConfig = {
  label: string,
  value: string,
  icon?: React.element,
}
type merchantInfo = {
  items: array<topbarMerchantInfoItemsConfig>,
  selected: string,
  onSelect: string => unit,
}
type topbarTopbarTokenTypeToggleButtonBackgroundColorConfig = {
  default: string,
  hover: string,
  active: string,
}
type topbarTopbarTokenTypeToggleButtonIconConfig = {
  size: string,
  color: string,
}
type topbarTopbarTokenTypeToggleButtonConfig = {
  borderRadius: string,
  padding: string,
  backgroundColor: topbarTopbarTokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
  icon: topbarTopbarTokenTypeToggleButtonIconConfig,
}
type topbarTopbarTokenTypeActionButtonConfig = {
  borderRadius: string,
  padding: string,
  minWidth: string,
  height: string,
  backgroundColor: topbarTopbarTokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
  icon: topbarTopbarTokenTypeToggleButtonIconConfig,
}
type topbarTopbarTokenTypeTenantIconButtonConfig = {
  borderRadius: string,
  minHeight: string,
  backgroundColor: topbarTopbarTokenTypeToggleButtonBackgroundColorConfig,
  transition: string,
}
type topbarTopbarTokenTypeMerchantSelectTriggerTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type topbarTopbarTokenTypeMerchantSelectTriggerConfig = {
  gap: string,
  icon: topbarTopbarTokenTypeToggleButtonIconConfig,
  text: topbarTopbarTokenTypeMerchantSelectTriggerTextConfig,
}
type topbarTopbarTokenTypeLeftSectionConfig = {
  gap: string,
  maxHeight: string,
  divider: topbarTopbarTokenTypeMerchantSelectTriggerTextConfig,
}
type topbarTopbarTokenTypeRightSectionConfig = {
  gap: string,
}
type topbarTokenType = {
  zIndex: string,
  borderBottom: string,
  backgroundColor: string,
  backdropFilter: string,
  padding: string,
  gap: string,
  toggleButton: topbarTopbarTokenTypeToggleButtonConfig,
  actionButton: topbarTopbarTokenTypeActionButtonConfig,
  tenantIconButton: topbarTopbarTokenTypeTenantIconButtonConfig,
  merchantSelectTrigger: topbarTopbarTokenTypeMerchantSelectTriggerConfig,
  leftSection: topbarTopbarTokenTypeLeftSectionConfig,
  rightSection: topbarTopbarTokenTypeRightSectionConfig,
  sidebarSection: topbarTopbarTokenTypeRightSectionConfig,
}
type responsiveTopbarTokens = {
  sm: topbarTokenType,
  lg: topbarTokenType,
}
