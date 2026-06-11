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
type headerConfig10 = {
  padding: ModalTypes.paddingConfig5,
  label: CardTypes.contentConfig3,
  chevron: AvatarGroupTypes.borderConfig3,
}
type backgroundColorConfig7 = {
  default: string,
  hover: string,
  active: string,
}
type iconConfig3 = {
  width: string,
}
type chevronConfig = {
  width: string,
  color: string,
}
type itemConfig5 = {
  padding: ButtonSharedTypes.defaultConfig3,
  gap: string,
  borderRadius: string,
  fontWeight: string,
  fontSize: string,
  transition: string,
  backgroundColor: backgroundColorConfig7,
  color: backgroundColorConfig7,
  icon: iconConfig3,
  chevron: chevronConfig,
}
type borderConfig6 = {
  width: string,
  color: string,
  leftOffset: string,
}
type nestedConfig = {
  paddingLeft: string,
  marginTop: string,
  border: borderConfig6,
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
