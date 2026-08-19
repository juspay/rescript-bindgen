type tabsV2Variant =
  | @as("boxed") Boxed
  | @as("floating") Floating
  | @as("underline") Underline
  | @as("pills") Pills
type tabsV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type tabsV2TabsV2TokensTypeTabListBackgroundColorConfig = {
  boxed: string,
  floating: string,
  underline: string,
  pills: string,
}
type tabsV2TabsV2TokensTypeTabListBorderRadiusConfig = {
  sm: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  md: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  lg: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
}
type tabsV2TabsV2TokensTypeTabListActiveIndicatorConfig = {
  height: string,
  color: string,
  position: string,  // ⚪ loose — was `{ bottom: Bottom<number | (string & {})>; }`
  transition: string,
  zIndex: string,
}
type tabsV2TabsV2TokensTypeTabListStickyHeaderConfig = {
  boxShadow: string,
  zIndex: string,
}
type tabsV2TabsV2TokensTypeTabListTriggerConfig = {
  gap: string,
  icon: string,  // ⚪ loose — was `{ maxWidth: MaxWidth<number | (string & {})>; }`
  backgroundColor: string,  // ⚪ loose — was `{ boxed: { disabled: BackgroundColor; active: BackgroundColor; default: BackgroundColor; hover: BackgroundColo`
  borderRadius: string,  // ⚪ loose — was `{ sm: { boxed: BorderRadius<number | (string & {})>; floating: BorderRadius<number | (string & {})>; underline`
  border: string,  // ⚪ loose — was `{ boxed: Border<number | (string & {})>; floating: Border<number | (string & {})>; underline: Border<number | `
  padding: string,  // ⚪ loose — was `{ sm: { boxed: { top: PaddingTop<number | (string & {})>; right: PaddingRight<number | (string & {})>; bottom:`
  text: string,  // ⚪ loose — was `{ color: { boxed: { disabled: Color; active: Color; default: Color; hover: Color; }; floating: { disabled: Col`
  closeButton: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; borderRadius: BorderRadius<number | (string & {})>; backgroundColor: {`
  transition: string,
}
type tabsV2TabsV2TokensTypeTabListConfig = {
  gap: string,
  backgroundColor: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  borderRadius: tabsV2TabsV2TokensTypeTabListBorderRadiusConfig,
  padding: tabsV2TabsV2TokensTypeTabListBorderRadiusConfig,
  borderBottom: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  activeIndicator: tabsV2TabsV2TokensTypeTabListActiveIndicatorConfig,
  stickyHeader: tabsV2TabsV2TokensTypeTabListStickyHeaderConfig,
  trigger: tabsV2TabsV2TokensTypeTabListTriggerConfig,
}
type tabsV2TokensType = {
  width: string,
  outline: string,
  tabList: tabsV2TabsV2TokensTypeTabListConfig,
}
type responsiveTabsV2Tokens = {
  sm: tabsV2TokensType,
  lg: tabsV2TokensType,
}
type tabsV2ContextValue = {
  variant: tabsV2Variant,
  size: tabsV2Size,
  expanded: bool,
  fitContent: bool,
  disabled: bool,
  showSkeleton: bool,
  skeletonVariant: SkeletonTypes.skeletonVariant,
  stickyHeader: bool,
  offsetTop: float,
  activeTab: string,
}
type tabsV2TabItem = {
  value: string,
  label: string,
  content: React.element,
  disabled?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  leftSlot?: React.element,
  rightSlot?: React.element,
  newItem?: bool,
}
type tabsV2PrepareDropdownItemsItemsConfig = {
  value: string,
  label: string,
}
type tabsV2PrepareDropdownItemsConfig = {
  items: array<tabsV2PrepareDropdownItemsItemsConfig>,
}
type tabsV2CalculateTabIndicatorPositionConfig = {
  tabLeft: float,
  tabWidth: float,
}
