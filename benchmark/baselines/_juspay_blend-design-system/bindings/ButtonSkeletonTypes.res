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
type skeletonVariant =
  | @as("pulse") Pulse
  | @as("wave") Wave
  | @as("shimmer") Shimmer
type buttonGroupPosition =
  | @as("center") Center
  | @as("left") Left
  | @as("right") Right
type buttonState =
  | @as("default") Default
  | @as("hover") Hover
  | @as("active") Active
  | @as("disabled") Disabled
type type_ =
  | @as("submit") Submit
  | @as("reset") Reset
  | @as("button") Button
type skeletonShape =
  | @as("circle") Circle
  | @as("rectangle") Rectangle
  | @as("rounded") Rounded
type size2 =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("md") Md
type shape =
  | @as("circle") Circle
  | @as("square") Square
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
  skeletonVariant?: skeletonVariant,
  buttonGroupPosition?: buttonGroupPosition,
  fullWidth?: bool,
  justifyContent?: string,
  state?: buttonState,
}
type valueConfig4 = {
  shouldShowSkeleton: bool,
  shouldShowContent: bool,
}
type animationConfig = {
  duration: string,
  timingFunction: string,
  iterationCount: string,
  direction: string,
}
type colorsConfig2 = {
  base: string,
  highlight: string,
  shimmer: string,
}
type borderRadiusConfig8 = {
  rectangle: string,
  rounded: string,
  circle: string,
}
type spacingConfig = {
  gap: string,
  margin: string,
}
type textConfig17 = {
  height: string,
  minWidth: string,
}
type buttonConfig2 = {
  sm: textConfig17,
  md: textConfig17,
  lg: textConfig17,
}
type sizesConfig = {
  text: textConfig17,
  avatar: slotMaxHeightConfig,
  button: buttonConfig2,
}
type skeletonTokensType = {
  animation: animationConfig,
  colors: colorsConfig2,
  borderRadius: borderRadiusConfig8,
  spacing: spacingConfig,
  sizes: sizesConfig,
}
type responsiveSkeletonTokens = {
  sm: skeletonTokensType,
  lg: skeletonTokensType,
}
module OnClick = {
  type t
  external asEvent: t => (option<ReactEvent.Mouse.t> => unit) = "%identity"
  external asEvent2: t => (ReactEvent.Mouse.t => unit) = "%identity"
}
