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
  disabled: string,
  active: string,
  default: string,
  hover: string,
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
type tabsTabsTokensTypePaddingSmConfig = {
  boxed: string,  // ⚪ loose — was `{ top: PaddingTop<number | (string & {})>; right: PaddingRight<number | (string & {})>; bottom: PaddingBottom<`
  floating: string,  // ⚪ loose — was `{ top: PaddingTop<number | (string & {})>; right: PaddingRight<number | (string & {})>; bottom: PaddingBottom<`
  underline: string,  // ⚪ loose — was `{ top: PaddingTop<number | (string & {})>; right: PaddingRight<number | (string & {})>; bottom: PaddingBottom<`
  pills: string,  // ⚪ loose — was `{ top: PaddingTop<number | (string & {})>; right: PaddingRight<number | (string & {})>; bottom: PaddingBottom<`
}
type tabsTabsTokensTypePaddingConfig = {
  sm: tabsTabsTokensTypePaddingSmConfig,
  md: tabsTabsTokensTypePaddingSmConfig,
  lg: tabsTabsTokensTypePaddingSmConfig,
}
type tabsTabsTokensTypeContainerBorderRadiusConfig = {
  sm: tabsTabsTokensTypeBorderRadiusSmConfig,
  md: tabsTabsTokensTypeBorderRadiusSmConfig,
  lg: tabsTabsTokensTypeBorderRadiusSmConfig,
}
type tabsTabsTokensTypeContainerConfig = {
  backgroundColor: tabsTabsTokensTypeBorderRadiusSmConfig,
  borderRadius: tabsTabsTokensTypeContainerBorderRadiusConfig,
  padding: tabsTabsTokensTypeContainerBorderRadiusConfig,
}
type tabsTabsTokensTypeTriggerActiveIndicatorConfig = {
  height: string,
  color: string,
}
type tabsTabsTokensTypeTriggerTextConfig = {
  color: string,  // ⚪ loose — was `{ boxed: { disabled: Color; active: Color; default: Color; hover: Color; }; floating: { disabled: Color; activ`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: FontSize<number | (string & `
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; lg: FontWeight; }`
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
