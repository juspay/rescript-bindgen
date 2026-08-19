type directoryDirectoryTokenTypeSectionHeaderConfig = {
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  label: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; color: Color; fontWeight: FontWeight; }`
  chevron: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; color: Color; }`
}
type directoryDirectoryTokenTypeSectionItemListConfig = {
  gap: string,
  item: string,  // ⚪ loose — was `{ padding: { x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }; iconOnlyPadding: { pad`
  nested: string,  // ⚪ loose — was `{ paddingLeft: PaddingLeft<number | (string & {})>; marginTop: MarginTop<number | (string & {})>; border: { wi`
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
