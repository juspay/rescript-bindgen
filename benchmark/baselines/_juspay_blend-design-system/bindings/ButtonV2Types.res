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
type primaryConfig7 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type smConfig15 = {
  primary: primaryConfig7,
  secondary: primaryConfig7,
  danger: primaryConfig7,
  success: primaryConfig7,
}
type borderRadiusConfig10 = {
  sm: smConfig15,
  md: smConfig15,
  lg: smConfig15,
}
type primaryConfig8 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type smConfig16 = {
  primary: primaryConfig8,
  secondary: primaryConfig8,
  danger: primaryConfig8,
  success: primaryConfig8,
}
type topConfig = {
  sm: smConfig16,
  md: smConfig16,
  lg: smConfig16,
}
type paddingConfig14 = {
  top: topConfig,
  right: topConfig,
  bottom: topConfig,
  left: topConfig,
}
type textConfig22 = {
  color: ButtonSharedTypes.smConfig,
  fontSize: ButtonSharedTypes.slotMaxHeightConfig,
  fontWeight: ButtonSharedTypes.slotMaxHeightConfig,
  lineHeight: ButtonSharedTypes.slotMaxHeightConfig,
}
type smConfig14 = {
  gap: string,
  backgroundColor: ButtonSharedTypes.backgroundColorConfig,
  borderRadius: borderRadiusConfig10,
  padding: paddingConfig14,
  border: ButtonSharedTypes.backgroundColorConfig,
  shadow: ButtonSharedTypes.backgroundColorConfig,
  text: textConfig22,
}
type responsiveButtonV2Tokens = {
  sm: smConfig14,
  lg: smConfig14,
}
type buttonSlot = {
  slot: React.element,
  maxHeight?: CommonTypes.stringOrNumber,
}
type buttonSkeleton = {
  showSkeleton?: bool,
  skeletonVariant?: ButtonSharedTypes.skeletonVariant,
}
type buttonPropsConfig = {
  ...JsxDOM.domProps,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  leftSlot?: buttonSlot,
  rightSlot?: buttonSlot,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonSharedTypes.buttonGroupPosition,
  buttonType?: buttonV2Type,
  subType?: buttonV2SubType,
  state?: buttonV2State,
}
