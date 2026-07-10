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
type tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type tabsV2TabsV2TokensTypeTabListPaddingSmConfig = {
  boxed: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  floating: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  underline: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  pills: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
}
type tabsV2TabsV2TokensTypeTabListPaddingConfig = {
  sm: tabsV2TabsV2TokensTypeTabListPaddingSmConfig,
  md: tabsV2TabsV2TokensTypeTabListPaddingSmConfig,
  lg: tabsV2TabsV2TokensTypeTabListPaddingSmConfig,
}
type tabsV2TabsV2TokensTypeTabListActiveIndicatorPositionConfig = {
  bottom: string,
}
type tabsV2TabsV2TokensTypeTabListActiveIndicatorConfig = {
  height: string,
  color: string,
  position: tabsV2TabsV2TokensTypeTabListActiveIndicatorPositionConfig,
  transition: string,
  zIndex: string,
}
type tabsV2TabsV2TokensTypeTabListStickyHeaderConfig = {
  boxShadow: string,
  zIndex: string,
}
type tabsV2TabsV2TokensTypeTabListTriggerIconConfig = {
  maxWidth: string,
}
type tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig = {
  active: string,
  default: string,
  hover: string,
  disabled: string,
}
type tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorConfig = {
  boxed: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig,
  floating: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig,
  underline: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig,
  pills: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerPaddingSmConfig = {
  boxed: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  floating: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  underline: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
  pills: tabsV2TabsV2TokensTypeTabListPaddingSmBoxedConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerPaddingConfig = {
  sm: tabsV2TabsV2TokensTypeTabListTriggerPaddingSmConfig,
  md: tabsV2TabsV2TokensTypeTabListTriggerPaddingSmConfig,
  lg: tabsV2TabsV2TokensTypeTabListTriggerPaddingSmConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerTextFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type tabsV2TabsV2TokensTypeTabListTriggerTextConfig = {
  color: tabsV2TabsV2TokensTypeTabListTriggerPaddingSmConfig,
  fontSize: tabsV2TabsV2TokensTypeTabListTriggerTextFontSizeConfig,
  fontWeight: tabsV2TabsV2TokensTypeTabListTriggerTextFontSizeConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerCloseButtonConfig = {
  width: string,
  borderRadius: string,
  backgroundColor: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorBoxedConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerConfig = {
  gap: string,
  icon: tabsV2TabsV2TokensTypeTabListTriggerIconConfig,
  backgroundColor: tabsV2TabsV2TokensTypeTabListTriggerBackgroundColorConfig,
  borderRadius: tabsV2TabsV2TokensTypeTabListBorderRadiusConfig,
  border: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  padding: tabsV2TabsV2TokensTypeTabListTriggerPaddingConfig,
  text: tabsV2TabsV2TokensTypeTabListTriggerTextConfig,
  closeButton: tabsV2TabsV2TokensTypeTabListTriggerCloseButtonConfig,
  transition: string,
}
type tabsV2TabsV2TokensTypeTabListConfig = {
  gap: string,
  backgroundColor: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  borderRadius: tabsV2TabsV2TokensTypeTabListBorderRadiusConfig,
  padding: tabsV2TabsV2TokensTypeTabListPaddingConfig,
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
