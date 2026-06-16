type rec navbarItem = {
  label: string,
  items?: array<navbarItem>,
  leftSlot?: React.element,
  rightSlot?: React.element,
  onClick?: unit => unit,
  href?: string,
  isSelected?: bool,
  showOnMobile?: bool,
}
type directoryData = {
  label?: string,
  items?: array<navbarItem>,
  isCollapsible?: bool,
  defaultOpen?: bool,
}
type paddingConfig18 = {
  x: string,
  y: string,
}
type labelConfig3 = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type chevronConfig = {
  width: string,
  color: string,
}
type headerConfig10 = {
  padding: paddingConfig18,
  label: labelConfig3,
  chevron: chevronConfig,
}
type paddingConfig19 = {
  x: string,
  y: string,
}
type backgroundColorConfig7 = {
  default: string,
  hover: string,
  active: string,
}
type iconConfig3 = {
  width: string,
}
type chevronConfig2 = {
  width: string,
  color: string,
}
type itemConfig5 = {
  padding: paddingConfig19,
  gap: string,
  borderRadius: string,
  fontWeight: string,
  fontSize: string,
  transition: string,
  backgroundColor: backgroundColorConfig7,
  color: backgroundColorConfig7,
  icon: iconConfig3,
  chevron: chevronConfig2,
}
type borderConfig8 = {
  width: string,
  color: string,
  leftOffset: string,
}
type nestedConfig = {
  paddingLeft: string,
  marginTop: string,
  border: borderConfig8,
}
type itemListConfig = {
  gap: string,
  item: itemConfig5,
  nested: nestedConfig,
}
type sectionConfig = {
  gap: string,
  header: headerConfig10,
  itemList: itemListConfig,
}
type directoryTokenType = {
  gap: string,
  paddingX: string,
  paddingY: string,
  section: sectionConfig,
}
type responsiveDirectoryTokens = {
  sm: directoryTokenType,
  lg: directoryTokenType,
}
