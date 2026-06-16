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
type buttonGroupPosition =
  | @as("center") Center
  | @as("left") Left
  | @as("right") Right
type buttonState =
  | @as("default") Default
  | @as("hover") Hover
  | @as("active") Active
  | @as("disabled") Disabled
type slotMaxHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type defaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type primaryConfig = {
  default: defaultConfig,
  iconOnly: defaultConfig,
  inline: defaultConfig,
}
type backgroundColorConfig = {
  primary: primaryConfig,
  secondary: primaryConfig,
  danger: primaryConfig,
  success: primaryConfig,
}
type defaultConfig2 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type primaryConfig2 = {
  default: defaultConfig2,
  iconOnly: defaultConfig2,
  inline: defaultConfig2,
}
type smConfig = {
  primary: primaryConfig2,
  secondary: primaryConfig2,
  danger: primaryConfig2,
  success: primaryConfig2,
}
type borderRadiusConfig = {
  sm: smConfig,
  md: smConfig,
  lg: smConfig,
}
type defaultConfig3 = {
  x: string,
  y: string,
}
type primaryConfig3 = {
  default: defaultConfig3,
  iconOnly: defaultConfig3,
  inline: defaultConfig3,
}
type smConfig2 = {
  primary: primaryConfig3,
  secondary: primaryConfig3,
  danger: primaryConfig3,
  success: primaryConfig3,
}
type paddingConfig = {
  sm: smConfig2,
  md: smConfig2,
  lg: smConfig2,
}
type textConfig = {
  color: smConfig,
  fontSize: slotMaxHeightConfig,
  fontWeight: slotMaxHeightConfig,
}
type buttonTokensType = {
  gap: string,
  slotMaxHeight: slotMaxHeightConfig,
  backgroundColor: backgroundColorConfig,
  borderRadius: borderRadiusConfig,
  padding: paddingConfig,
  border: backgroundColorConfig,
  shadow: backgroundColorConfig,
  outline: backgroundColorConfig,
  text: textConfig,
}
type responsiveButtonTokens = {
  sm: buttonTokensType,
  lg: buttonTokensType,
}
type buttonProps = {
  ...JsxDOM.domProps,
  buttonType?: buttonType,
  subType?: buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: buttonGroupPosition,
  fullWidth?: bool,
  justifyContent?: string,
  state?: buttonState,
}
module OnClick = {
  type t
  external asEvent: t => (option<ReactEvent.Mouse.t> => unit) = "%identity"
  external asEvent2: t => (ReactEvent.Mouse.t => unit) = "%identity"
}
