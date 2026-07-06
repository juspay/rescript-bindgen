type directoryDirectoryTokenTypeSectionHeaderPaddingConfig = {
  x: string,
  y: string,
}
type directoryDirectoryTokenTypeSectionHeaderLabelConfig = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type directoryDirectoryTokenTypeSectionHeaderChevronConfig = {
  width: string,
  color: string,
}
type directoryDirectoryTokenTypeSectionHeaderConfig = {
  padding: directoryDirectoryTokenTypeSectionHeaderPaddingConfig,
  label: directoryDirectoryTokenTypeSectionHeaderLabelConfig,
  chevron: directoryDirectoryTokenTypeSectionHeaderChevronConfig,
}
type directoryDirectoryTokenTypeSectionItemListItemIconOnlyPaddingConfig = {
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
}
type directoryDirectoryTokenTypeSectionItemListItemBackgroundColorConfig = {
  active: string,
  default: string,
  hover: string,
}
type directoryDirectoryTokenTypeSectionItemListItemIconConfig = {
  width: string,
}
type directoryDirectoryTokenTypeSectionItemListItemConfig = {
  padding: directoryDirectoryTokenTypeSectionHeaderPaddingConfig,
  iconOnlyPadding: directoryDirectoryTokenTypeSectionItemListItemIconOnlyPaddingConfig,
  gap: string,
  borderRadius: string,
  fontWeight: string,
  fontSize: string,
  transition: string,
  backgroundColor: directoryDirectoryTokenTypeSectionItemListItemBackgroundColorConfig,
  color: directoryDirectoryTokenTypeSectionItemListItemBackgroundColorConfig,
  icon: directoryDirectoryTokenTypeSectionItemListItemIconConfig,
  chevron: directoryDirectoryTokenTypeSectionHeaderChevronConfig,
}
type directoryDirectoryTokenTypeSectionItemListNestedBorderConfig = {
  width: string,
  color: string,
  leftOffset: string,
}
type directoryDirectoryTokenTypeSectionItemListNestedConfig = {
  paddingLeft: string,
  marginTop: string,
  border: directoryDirectoryTokenTypeSectionItemListNestedBorderConfig,
}
type directoryDirectoryTokenTypeSectionItemListConfig = {
  gap: string,
  item: directoryDirectoryTokenTypeSectionItemListItemConfig,
  nested: directoryDirectoryTokenTypeSectionItemListNestedConfig,
}
type directoryDirectoryTokenTypeSectionConfig = {
  gap: string,
  header: directoryDirectoryTokenTypeSectionHeaderConfig,
  itemList: directoryDirectoryTokenTypeSectionItemListConfig,
}
type directoryTokenType = {
  gap: string,
  paddingX: string,
  paddingY: string,
  section: directoryDirectoryTokenTypeSectionConfig,
}
type responsiveDirectoryTokens = {
  sm: directoryTokenType,
  lg: directoryTokenType,
}
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
