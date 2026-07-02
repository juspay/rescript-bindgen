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
  | @as("center") Center
  | @as("left") Left
  | @as("right") Right
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
type buttonButtonTokensTypeBackgroundColorPrimaryDefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonButtonTokensTypeBackgroundColorPrimaryConfig = {
  default: buttonButtonTokensTypeBackgroundColorPrimaryDefaultConfig,
  iconOnly: buttonButtonTokensTypeBackgroundColorPrimaryDefaultConfig,
  inline: buttonButtonTokensTypeBackgroundColorPrimaryDefaultConfig,
}
type buttonButtonTokensTypeBackgroundColorConfig = {
  primary: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  secondary: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  danger: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
  success: buttonButtonTokensTypeBackgroundColorPrimaryConfig,
}
type buttonButtonTokensTypeBorderRadiusSmPrimaryDefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonButtonTokensTypeBorderRadiusSmPrimaryConfig = {
  default: buttonButtonTokensTypeBorderRadiusSmPrimaryDefaultConfig,
  iconOnly: buttonButtonTokensTypeBorderRadiusSmPrimaryDefaultConfig,
  inline: buttonButtonTokensTypeBorderRadiusSmPrimaryDefaultConfig,
}
type buttonButtonTokensTypeBorderRadiusSmConfig = {
  primary: buttonButtonTokensTypeBorderRadiusSmPrimaryConfig,
  secondary: buttonButtonTokensTypeBorderRadiusSmPrimaryConfig,
  danger: buttonButtonTokensTypeBorderRadiusSmPrimaryConfig,
  success: buttonButtonTokensTypeBorderRadiusSmPrimaryConfig,
}
type buttonButtonTokensTypeBorderRadiusConfig = {
  sm: buttonButtonTokensTypeBorderRadiusSmConfig,
  md: buttonButtonTokensTypeBorderRadiusSmConfig,
  lg: buttonButtonTokensTypeBorderRadiusSmConfig,
}
type buttonButtonTokensTypePaddingSmPrimaryDefaultConfig = {
  x: string,
  y: string,
}
type buttonButtonTokensTypePaddingSmPrimaryConfig = {
  default: buttonButtonTokensTypePaddingSmPrimaryDefaultConfig,
  iconOnly: buttonButtonTokensTypePaddingSmPrimaryDefaultConfig,
  inline: buttonButtonTokensTypePaddingSmPrimaryDefaultConfig,
}
type buttonButtonTokensTypePaddingSmConfig = {
  primary: buttonButtonTokensTypePaddingSmPrimaryConfig,
  secondary: buttonButtonTokensTypePaddingSmPrimaryConfig,
  danger: buttonButtonTokensTypePaddingSmPrimaryConfig,
  success: buttonButtonTokensTypePaddingSmPrimaryConfig,
}
type buttonButtonTokensTypePaddingConfig = {
  sm: buttonButtonTokensTypePaddingSmConfig,
  md: buttonButtonTokensTypePaddingSmConfig,
  lg: buttonButtonTokensTypePaddingSmConfig,
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
  padding: buttonButtonTokensTypePaddingConfig,
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
