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
  skeletonVariant?: ButtonSkeletonTypes.skeletonVariant,
  leftSlot?: React.element,
  rightSlot?: React.element,
  newItem?: bool,
}
type boxedConfig = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type backgroundColorConfig2 = {
  boxed: boxedConfig,
  floating: boxedConfig,
  underline: boxedConfig,
  pills: boxedConfig,
}
type mdConfig = {
  boxed: string,
  floating: string,
  underline: string,
  pills: string,
}
type borderRadiusConfig2 = {
  md: mdConfig,
  lg: mdConfig,
}
type boxedConfig2 = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type mdConfig2 = {
  boxed: boxedConfig2,
  floating: boxedConfig2,
  underline: boxedConfig2,
  pills: boxedConfig2,
}
type paddingConfig2 = {
  md: mdConfig2,
  lg: mdConfig2,
}
type boxedConfig3 = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type mdConfig3 = {
  boxed: boxedConfig3,
  floating: boxedConfig3,
  underline: boxedConfig3,
  pills: boxedConfig3,
}
type paddingConfig3 = {
  md: mdConfig3,
  lg: mdConfig3,
}
type containerConfig = {
  backgroundColor: mdConfig,
  borderRadius: borderRadiusConfig2,
  padding: paddingConfig3,
}
type activeIndicatorConfig = {
  height: string,
  color: string,
}
type boxedConfig4 = {
  disabled: string,
  default: string,
  hover: string,
  active: string,
}
type colorConfig = {
  boxed: boxedConfig4,
  floating: boxedConfig4,
  underline: boxedConfig4,
  pills: boxedConfig4,
}
type fontSizeConfig2 = {
  md: string,
  lg: string,
}
type textConfig2 = {
  color: colorConfig,
  fontSize: fontSizeConfig2,
  fontWeight: fontSizeConfig2,
}
type triggerConfig = {
  gap: string,
  activeIndicator: activeIndicatorConfig,
  text: textConfig2,
}
type tabsTokensType = {
  gap: string,
  backgroundColor: backgroundColorConfig2,
  borderRadius: borderRadiusConfig2,
  padding: paddingConfig2,
  border: mdConfig,
  borderBottom: mdConfig,
  container: containerConfig,
  trigger: triggerConfig,
}
type responsiveTabsTokens = {
  sm: tabsTokensType,
  lg: tabsTokensType,
}
