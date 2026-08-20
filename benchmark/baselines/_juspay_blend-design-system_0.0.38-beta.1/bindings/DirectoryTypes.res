type __typeV1okzr2 = {
  x: string,
  y: string,
}
type __typeQb0or2 = {
  fontSize: string,
  color: string,
  fontWeight: string,
}
type __typeV1agq4 = {
  width: string,
  color: string,
}
type directoryDirectoryTokenTypeSectionHeaderConfig = {
  padding: __typeV1okzr2,
  label: __typeQb0or2,
  chevron: __typeV1agq4,
}
type __typeV1c78s = {
  width: string,
  color: string,
  leftOffset: string,
}
type __typeV1cbrj = {
  itemInset: string,
  itemPaddingLeft: string,
  elbowTop: string,
  elbowHeight: string,
  elbowWidthOffset: string,
}
type __typeQic2i = {
  paddingLeft: string,
  marginTop: string,
  border: __typeV1c78s,
  connector: __typeV1cbrj,
}
type directoryDirectoryTokenTypeSectionItemListConfig = {
  gap: string,
  item: string,  // ⚪ loose — was `{ padding: { x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }; iconOnlyPadding: { pad`
  nested: __typeQic2i,
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
  id?: string,
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
type directoryVirtualizationConfig = {
  viewportRef?: React.ref<Nullable.t<Dom.element>>,
  rowHeight?: float,
  sectionHeight?: float,
  viewportHeight?: float,
  overscan?: float,
  threshold?: float,
}
module DirectoryExpandedItems = {
  type t
  external fromArray: array<string> => t = "%identity"
  external asArray: t => (array<string>) = "%identity"
  external fromSet: Set.t<string> => t = "%identity"
  external asSet: t => (Set.t<string>) = "%identity"
}
