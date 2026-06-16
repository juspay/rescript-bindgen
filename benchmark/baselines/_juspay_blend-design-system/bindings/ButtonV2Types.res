type buttonV2Type =
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("danger") Danger
  | @as("success") Success
type buttonV2SubType =
  | @as("default") Default
  | @as("iconOnly") IconOnly
  | @as("inline") Inline
type buttonV2State =
  | @as("default") Default
  | @as("hover") Hover
  | @as("active") Active
  | @as("disabled") Disabled
type defaultConfig10 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type primaryConfig7 = {
  default: defaultConfig10,
  iconOnly: defaultConfig10,
  inline: defaultConfig10,
}
type backgroundColorConfig21 = {
  primary: primaryConfig7,
  secondary: primaryConfig7,
  danger: primaryConfig7,
  success: primaryConfig7,
}
type primaryConfig8 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type smConfig17 = {
  primary: primaryConfig8,
  secondary: primaryConfig8,
  danger: primaryConfig8,
  success: primaryConfig8,
}
type borderRadiusConfig12 = {
  sm: smConfig17,
  md: smConfig17,
  lg: smConfig17,
}
type primaryConfig9 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type smConfig18 = {
  primary: primaryConfig9,
  secondary: primaryConfig9,
  danger: primaryConfig9,
  success: primaryConfig9,
}
type topConfig = {
  sm: smConfig18,
  md: smConfig18,
  lg: smConfig18,
}
type paddingConfig25 = {
  top: topConfig,
  right: topConfig,
  bottom: topConfig,
  left: topConfig,
}
type defaultConfig11 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type primaryConfig10 = {
  default: defaultConfig11,
  iconOnly: defaultConfig11,
  inline: defaultConfig11,
}
type colorConfig18 = {
  primary: primaryConfig10,
  secondary: primaryConfig10,
  danger: primaryConfig10,
  success: primaryConfig10,
}
type fontSizeConfig8 = {
  sm: string,
  md: string,
  lg: string,
}
type textConfig26 = {
  color: colorConfig18,
  fontSize: fontSizeConfig8,
  fontWeight: fontSizeConfig8,
  lineHeight: fontSizeConfig8,
}
type smConfig16 = {
  gap: string,
  backgroundColor: backgroundColorConfig21,
  borderRadius: borderRadiusConfig12,
  padding: paddingConfig25,
  border: backgroundColorConfig21,
  shadow: backgroundColorConfig21,
  text: textConfig26,
}
type responsiveButtonV2Tokens = {
  sm: smConfig16,
  lg: smConfig16,
}
type buttonSlot = {
  slot: React.element,
  maxHeight?: CommonTypes.stringOrNumber,
}
type buttonSkeleton = {
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
}
type buttonPropsConfig = {
  ...JsxDOM.domProps,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  leftSlot?: buttonSlot,
  rightSlot?: buttonSlot,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonGroupPosition,
  buttonType?: buttonV2Type,
  subType?: buttonV2SubType,
  state?: buttonV2State,
}
