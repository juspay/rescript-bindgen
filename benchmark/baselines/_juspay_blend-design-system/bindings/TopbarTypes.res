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
type iconConfig6 = {
  size: string,
  color: string,
}
type toggleButtonConfig2 = {
  borderRadius: string,
  padding: string,
  backgroundColor: BreadcrumbTypes.colorConfig3,
  transition: string,
  icon: iconConfig6,
}
type actionButtonConfig2 = {
  borderRadius: string,
  padding: string,
  minWidth: string,
  height: string,
  backgroundColor: BreadcrumbTypes.colorConfig3,
  transition: string,
  icon: iconConfig6,
}
type tenantIconButtonConfig = {
  borderRadius: string,
  minHeight: string,
  backgroundColor: BreadcrumbTypes.colorConfig3,
  transition: string,
}
type merchantSelectTriggerConfig = {
  gap: string,
  icon: iconConfig6,
  text: StatCardTypes.titleConfig3,
}
type leftSectionConfig = {
  gap: string,
  maxHeight: string,
  divider: StatCardTypes.titleConfig3,
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
  rightSection: ChartsTypes.slotsConfig,
  sidebarSection: ChartsTypes.slotsConfig,
}
type responsiveTopbarTokens = {
  sm: topbarTokenType,
  lg: topbarTokenType,
}
