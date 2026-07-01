type orientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type activationMode =
  | @as("manual") Manual
  | @as("automatic") Automatic
type tabsVariant =
  | @as("boxed") Boxed
  | @as("floating") Floating
  | @as("underline") Underline
  | @as("pills") Pills
type tabsSize =
  | @as("md") Md
  | @as("lg") Lg
type type_ =
  | @as("button") Button
  | @as("submit") Submit
  | @as("reset") Reset
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
type tabsTabsTokensTypeBackgroundColorBoxedConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type tabsTabsTokensTypeBackgroundColorConfig = {
  boxed: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  floating: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  underline: tabsTabsTokensTypeBackgroundColorBoxedConfig,
  pills: tabsTabsTokensTypeBackgroundColorBoxedConfig,
}
type tabsTabsTokensTypeBorderRadiusMdConfig = {
  boxed: string,
  floating: string,
  underline: string,
  pills: string,
}
type tabsTabsTokensTypeBorderRadiusConfig = {
  md: tabsTabsTokensTypeBorderRadiusMdConfig,
  lg: tabsTabsTokensTypeBorderRadiusMdConfig,
}
type tabsTabsTokensTypePaddingMdBoxedConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type tabsTabsTokensTypePaddingMdConfig = {
  boxed: tabsTabsTokensTypePaddingMdBoxedConfig,
  floating: tabsTabsTokensTypePaddingMdBoxedConfig,
  underline: tabsTabsTokensTypePaddingMdBoxedConfig,
  pills: tabsTabsTokensTypePaddingMdBoxedConfig,
}
type tabsTabsTokensTypePaddingConfig = {
  md: tabsTabsTokensTypePaddingMdConfig,
  lg: tabsTabsTokensTypePaddingMdConfig,
}
type tabsTabsTokensTypeContainerPaddingMdBoxedConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type tabsTabsTokensTypeContainerPaddingMdConfig = {
  boxed: tabsTabsTokensTypeContainerPaddingMdBoxedConfig,
  floating: tabsTabsTokensTypeContainerPaddingMdBoxedConfig,
  underline: tabsTabsTokensTypeContainerPaddingMdBoxedConfig,
  pills: tabsTabsTokensTypeContainerPaddingMdBoxedConfig,
}
type tabsTabsTokensTypeContainerPaddingConfig = {
  md: tabsTabsTokensTypeContainerPaddingMdConfig,
  lg: tabsTabsTokensTypeContainerPaddingMdConfig,
}
type tabsTabsTokensTypeContainerConfig = {
  backgroundColor: tabsTabsTokensTypeBorderRadiusMdConfig,
  borderRadius: tabsTabsTokensTypeBorderRadiusConfig,
  padding: tabsTabsTokensTypeContainerPaddingConfig,
}
type tabsTabsTokensTypeTriggerActiveIndicatorConfig = {
  height: string,
  color: string,
}
type tabsTabsTokensTypeTriggerTextColorBoxedConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type tabsTabsTokensTypeTriggerTextColorConfig = {
  boxed: tabsTabsTokensTypeTriggerTextColorBoxedConfig,
  floating: tabsTabsTokensTypeTriggerTextColorBoxedConfig,
  underline: tabsTabsTokensTypeTriggerTextColorBoxedConfig,
  pills: tabsTabsTokensTypeTriggerTextColorBoxedConfig,
}
type tabsTabsTokensTypeTriggerTextFontSizeConfig = {
  md: string,
  lg: string,
}
type tabsTabsTokensTypeTriggerTextConfig = {
  color: tabsTabsTokensTypeTriggerTextColorConfig,
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
  border: tabsTabsTokensTypeBorderRadiusMdConfig,
  borderBottom: tabsTabsTokensTypeBorderRadiusMdConfig,
  container: tabsTabsTokensTypeContainerConfig,
  trigger: tabsTabsTokensTypeTriggerConfig,
}
type responsiveTabsTokens = {
  sm: tabsTokensType,
  lg: tabsTokensType,
}
