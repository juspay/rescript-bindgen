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
type __typeN52nn = {
  bottom: string,
}
type tabsV2TabsV2TokensTypeTabListActiveIndicatorConfig = {
  height: string,
  color: string,
  position: __typeN52nn,
  transition: string,
  zIndex: string,
}
type tabsV2TabsV2TokensTypeTabListStickyHeaderConfig = {
  boxShadow: string,
  zIndex: string,
}
type __typeV75sq = {
  maxWidth: string,
}
type tabsV2UseThemeBackgroundColorBoxedConfig = {
  disabled: string,
  active: string,
  default: string,
  hover: string,
}
type tabsV2UseThemeBackgroundColorConfig = {
  boxed: tabsV2UseThemeBackgroundColorBoxedConfig,
  floating: tabsV2UseThemeBackgroundColorBoxedConfig,
  underline: tabsV2UseThemeBackgroundColorBoxedConfig,
  pills: tabsV2UseThemeBackgroundColorBoxedConfig,
}
type tabsV2UseThemeBorderRadiusConfig = {
  sm: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  md: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  lg: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
}
type tabsV2UseThemePaddingSmBoxedConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type tabsV2UseThemePaddingSmConfig = {
  boxed: tabsV2UseThemePaddingSmBoxedConfig,
  floating: tabsV2UseThemePaddingSmBoxedConfig,
  underline: tabsV2UseThemePaddingSmBoxedConfig,
  pills: tabsV2UseThemePaddingSmBoxedConfig,
}
type tabsV2UseThemePaddingConfig = {
  sm: tabsV2UseThemePaddingSmConfig,
  md: tabsV2UseThemePaddingSmConfig,
  lg: tabsV2UseThemePaddingSmConfig,
}
type tabsV2UseThemeTextFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type tabsV2UseThemeTextConfig = {
  color: tabsV2UseThemeBackgroundColorConfig,
  fontSize: tabsV2UseThemeTextFontSizeConfig,
  fontWeight: tabsV2UseThemeTextFontSizeConfig,
}
type tabsV2UseThemeCloseButtonConfig = {
  width: string,
  borderRadius: string,
  backgroundColor: tabsV2UseThemeBackgroundColorBoxedConfig,
}
type tabsV2TabsV2TokensTypeTabListTriggerConfig = {
  gap: string,
  icon: __typeV75sq,
  backgroundColor: tabsV2UseThemeBackgroundColorConfig,
  borderRadius: tabsV2UseThemeBorderRadiusConfig,
  border: tabsV2TabsV2TokensTypeTabListBackgroundColorConfig,
  padding: tabsV2UseThemePaddingConfig,
  text: tabsV2UseThemeTextConfig,
  closeButton: tabsV2UseThemeCloseButtonConfig,
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
