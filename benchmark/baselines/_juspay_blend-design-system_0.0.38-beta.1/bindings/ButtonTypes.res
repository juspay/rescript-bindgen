type buttonType =
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("danger") Danger
  | @as("success") Success
type buttonSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type buttonSubType =
  | @as("default") Default
  | @as("iconOnly") IconOnly
  | @as("inline") Inline
type buttonButtonGroupPosition =
  | @as("right") Right
  | @as("left") Left
  | @as("center") Center
type buttonState =
  | @as("default") Default
  | @as("hover") Hover
  | @as("active") Active
  | @as("disabled") Disabled
type buttonButtonTokensTypeSlotMaxHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type buttonUseThemeDefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonButtonTokensTypeBackgroundColorPrimaryConfig = {
  default: buttonUseThemeDefaultConfig,
  iconOnly: buttonUseThemeDefaultConfig,
  inline: buttonUseThemeDefaultConfig,
}
type buttonButtonTokensTypeBackgroundColorConfig = {
  primary: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  secondary: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  danger: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  success: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
}
type buttonUseThemePrimaryConfig = {
  default: buttonUseThemeDefaultConfig,
  iconOnly: buttonUseThemeDefaultConfig,
  inline: buttonUseThemeDefaultConfig,
}
type buttonButtonTokensTypeBorderRadiusSmConfig = {
  primary: buttonUseThemePrimaryConfig,
  secondary: buttonUseThemePrimaryConfig,
  danger: buttonUseThemePrimaryConfig,
  success: buttonUseThemePrimaryConfig,
}
type buttonButtonTokensTypeBorderRadiusConfig = {
  sm: buttonButtonTokensTypeBorderRadiusSmConfig,
  md: buttonButtonTokensTypeBorderRadiusSmConfig,
  lg: buttonButtonTokensTypeBorderRadiusSmConfig,
}
type buttonButtonTokensTypeTextConfig = {
  color: buttonButtonTokensTypeBorderRadiusSmConfig,
  fontSize: buttonButtonTokensTypeSlotMaxHeightConfig,
  fontWeight: buttonButtonTokensTypeSlotMaxHeightConfig,
}
type buttonTokensType = {
  gap: string,
  slotMaxHeight: buttonButtonTokensTypeSlotMaxHeightConfig,
  backgroundColor: buttonButtonTokensTypeBackgroundColorConfig,
  borderRadius: buttonButtonTokensTypeBorderRadiusConfig,
  padding: buttonButtonTokensTypeBorderRadiusConfig,
  border: buttonButtonTokensTypeBackgroundColorConfig,
  shadow: buttonButtonTokensTypeBackgroundColorConfig,
  outline: buttonButtonTokensTypeBackgroundColorConfig,
  text: buttonButtonTokensTypeTextConfig,
}
type responsiveButtonTokens = {
  sm: buttonTokensType,
  lg: buttonTokensType,
}
type buttonProps = {
  buttonType?: buttonType,
  size?: buttonSize,
  subType?: buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: buttonButtonGroupPosition,
  fullWidth?: bool,
  width?: CommonTypes.stringOrNumber,
  justifyContent?: string,
  state?: buttonState,
}
