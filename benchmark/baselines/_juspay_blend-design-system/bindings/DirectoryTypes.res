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
type directoryPaddingConfig = {
  x: string,
  y: string,
}
type directoryLabelConfig = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type directoryChevronConfig = {
  width: string,
  color: string,
}
type directoryHeaderConfig = {
  padding: directoryPaddingConfig,
  label: directoryLabelConfig,
  chevron: directoryChevronConfig,
}
type directoryPaddingConfig2 = {
  x: string,
  y: string,
}
type directoryBackgroundColorConfig = {
  default: string,
  hover: string,
  active: string,
}
type directoryIconConfig = {
  width: string,
}
type directoryChevronConfig2 = {
  width: string,
  color: string,
}
type directoryItemConfig = {
  padding: directoryPaddingConfig2,
  gap: string,
  borderRadius: string,
  fontWeight: string,
  fontSize: string,
  transition: string,
  backgroundColor: directoryBackgroundColorConfig,
  color: directoryBackgroundColorConfig,
  icon: directoryIconConfig,
  chevron: directoryChevronConfig2,
}
type directoryBorderConfig = {
  width: string,
  color: string,
  leftOffset: string,
}
type directoryNestedConfig = {
  paddingLeft: string,
  marginTop: string,
  border: directoryBorderConfig,
}
type directoryItemListConfig = {
  gap: string,
  item: directoryItemConfig,
  nested: directoryNestedConfig,
}
type directorySectionConfig = {
  gap: string,
  header: directoryHeaderConfig,
  itemList: directoryItemListConfig,
}
type directoryTokenType = {
  gap: string,
  paddingX: string,
  paddingY: string,
  section: directorySectionConfig,
}
type responsiveDirectoryTokens = {
  sm: directoryTokenType,
  lg: directoryTokenType,
}
