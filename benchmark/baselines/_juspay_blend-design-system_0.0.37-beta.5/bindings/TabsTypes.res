type tabsActivationMode =
  | @as("manual") Manual
  | @as("automatic") Automatic
type tabsVariant =
  | @as("boxed") Boxed
  | @as("floating") Floating
  | @as("underline") Underline
  | @as("pills") Pills
type tabsSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type tabsType =
  | @as("button") Button
  | @as("reset") Reset
  | @as("submit") Submit
type tabsTabsTokensTypeBackgroundColorBoxedConfig = {
  active: string,
  default: string,
  hover: string,
  disabled: string,
}
type tabsTabsTokensTypeBackgroundColorConfig = {
  boxed: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  floating: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  underline: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  pills: tabsTabsTokensTypeBackgroundColorBoxedConfig,
}
type tabsTabsTokensTypeBorderRadiusSmConfig = {
  boxed: string,
  floating: string,
  underline: string,
  pills: string,
}
type tabsTabsTokensTypeBorderRadiusConfig = {
  sm: tabsTabsTokensTypeBorderRadiusSmConfig,
  md: tabsTabsTokensTypeBorderRadiusSmConfig,
  lg: tabsTabsTokensTypeBorderRadiusSmConfig,
}
type tabsTabsTokensTypePaddingSmBoxedConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type tabsTabsTokensTypePaddingSmConfig = {
  boxed: tabsTabsTokensTypePaddingSmBoxedConfig,
  floating: tabsTabsTokensTypePaddingSmBoxedConfig,
  underline: tabsTabsTokensTypePaddingSmBoxedConfig,
  pills: tabsTabsTokensTypePaddingSmBoxedConfig,
}
type tabsTabsTokensTypePaddingConfig = {
  sm: tabsTabsTokensTypePaddingSmConfig,
  md: tabsTabsTokensTypePaddingSmConfig,
  lg: tabsTabsTokensTypePaddingSmConfig,
}
type tabsTabsTokensTypeContainerConfig = {
  backgroundColor: tabsTabsTokensTypeBorderRadiusSmConfig,
  borderRadius: tabsTabsTokensTypeBorderRadiusConfig,
  padding: tabsTabsTokensTypePaddingConfig,
}
type tabsTabsTokensTypeTriggerActiveIndicatorConfig = {
  height: string,
  color: string,
}
type tabsTabsTokensTypeTriggerTextFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type tabsTabsTokensTypeTriggerTextConfig = {
  color: tabsTabsTokensTypeBackgroundColorConfig,
  fontSize: tabsTabsTokensTypeTriggerTextFontSizeConfig,
  fontWeight: tabsTabsTokensTypeTriggerTextFontSizeConfig,
}
type tabsTabsTokensTypeTriggerConfig = {
  gap: string,
  activeIndicator: tabsTabsTokensTypeTriggerActiveIndicatorConfig,
  text: tabsTabsTokensTypeTriggerTextConfig,
}
type tabsTokensType = {
  gap: string,
  backgroundColor: tabsTabsTokensTypeBackgroundColorConfig,
  borderRadius: tabsTabsTokensTypeBorderRadiusConfig,
  padding: tabsTabsTokensTypePaddingConfig,
  border: tabsTabsTokensTypeBorderRadiusSmConfig,
  borderBottom: tabsTabsTokensTypeBorderRadiusSmConfig,
  container: tabsTabsTokensTypeContainerConfig,
  trigger: tabsTabsTokensTypeTriggerConfig,
}
type responsiveTabsTokens = {
  sm: tabsTokensType,
  lg: tabsTokensType,
}
type tabItem = {
  value: string,
  label: string,
  content: React.element,
  disable?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  leftSlot?: React.element,
  rightSlot?: React.element,
  newItem?: bool,
}
