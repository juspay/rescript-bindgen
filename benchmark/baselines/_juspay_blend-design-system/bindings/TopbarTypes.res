type itemsConfig = {
  label: string,
  value: string,
  icon?: React.element,
}
type merchantInfo = {
  items: array<itemsConfig>,
  selected: string,
  onSelect: string => unit,
}
type backgroundColorConfig18 = {
  default: string,
  hover: string,
  active: string,
}
type iconConfig6 = {
  size: string,
  color: string,
}
type toggleButtonConfig2 = {
  borderRadius: string,
  padding: string,
  backgroundColor: backgroundColorConfig18,
  transition: string,
  icon: iconConfig6,
}
type actionButtonConfig2 = {
  borderRadius: string,
  padding: string,
  minWidth: string,
  height: string,
  backgroundColor: backgroundColorConfig18,
  transition: string,
  icon: iconConfig6,
}
type tenantIconButtonConfig = {
  borderRadius: string,
  minHeight: string,
  backgroundColor: backgroundColorConfig18,
  transition: string,
}
type textConfig22 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type merchantSelectTriggerConfig = {
  gap: string,
  icon: iconConfig6,
  text: textConfig22,
}
type leftSectionConfig = {
  gap: string,
  maxHeight: string,
  divider: textConfig22,
}
type rightSectionConfig = {
  gap: string,
}
type topbarTokenType = {
  zIndex: string,
  borderBottom: string,
  backgroundColor: string,
  backdropFilter: string,
  padding: string,
  gap: string,
  toggleButton: toggleButtonConfig2,
  actionButton: actionButtonConfig2,
  tenantIconButton: tenantIconButtonConfig,
  merchantSelectTrigger: merchantSelectTriggerConfig,
  leftSection: leftSectionConfig,
  rightSection: rightSectionConfig,
  sidebarSection: rightSectionConfig,
}
type responsiveTopbarTokens = {
  sm: topbarTokenType,
  lg: topbarTokenType,
}
