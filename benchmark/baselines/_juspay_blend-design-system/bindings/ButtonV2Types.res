type buttonV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
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
type buttonV2DefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonV2PrimaryConfig = {
  default: buttonV2DefaultConfig,
  iconOnly: buttonV2DefaultConfig,
  inline: buttonV2DefaultConfig,
}
type buttonV2BackgroundColorConfig = {
  primary: buttonV2PrimaryConfig,
  secondary: buttonV2PrimaryConfig,
  danger: buttonV2PrimaryConfig,
  success: buttonV2PrimaryConfig,
}
type buttonV2PrimaryConfig2 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type buttonV2SmConfig2 = {
  primary: buttonV2PrimaryConfig2,
  secondary: buttonV2PrimaryConfig2,
  danger: buttonV2PrimaryConfig2,
  success: buttonV2PrimaryConfig2,
}
type buttonV2BorderRadiusConfig = {
  sm: buttonV2SmConfig2,
  md: buttonV2SmConfig2,
  lg: buttonV2SmConfig2,
}
type buttonV2PrimaryConfig3 = {
  default: string,
  iconOnly: string,
  inline: string,
}
type buttonV2SmConfig3 = {
  primary: buttonV2PrimaryConfig3,
  secondary: buttonV2PrimaryConfig3,
  danger: buttonV2PrimaryConfig3,
  success: buttonV2PrimaryConfig3,
}
type buttonV2TopConfig = {
  sm: buttonV2SmConfig3,
  md: buttonV2SmConfig3,
  lg: buttonV2SmConfig3,
}
type buttonV2PaddingConfig = {
  top: buttonV2TopConfig,
  right: buttonV2TopConfig,
  bottom: buttonV2TopConfig,
  left: buttonV2TopConfig,
}
type buttonV2DefaultConfig2 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonV2PrimaryConfig4 = {
  default: buttonV2DefaultConfig2,
  iconOnly: buttonV2DefaultConfig2,
  inline: buttonV2DefaultConfig2,
}
type buttonV2ColorConfig = {
  primary: buttonV2PrimaryConfig4,
  secondary: buttonV2PrimaryConfig4,
  danger: buttonV2PrimaryConfig4,
  success: buttonV2PrimaryConfig4,
}
type buttonV2FontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type buttonV2TextConfig = {
  color: buttonV2ColorConfig,
  fontSize: buttonV2FontSizeConfig,
  fontWeight: buttonV2FontSizeConfig,
  lineHeight: buttonV2FontSizeConfig,
}
type buttonV2SmConfig = {
  gap: string,
  backgroundColor: buttonV2BackgroundColorConfig,
  borderRadius: buttonV2BorderRadiusConfig,
  padding: buttonV2PaddingConfig,
  border: buttonV2BackgroundColorConfig,
  shadow: buttonV2BackgroundColorConfig,
  text: buttonV2TextConfig,
}
type responsiveButtonV2Tokens = {
  sm: buttonV2SmConfig,
  lg: buttonV2SmConfig,
}
type buttonSlot = {
  slot: React.element,
  maxHeight?: CommonTypes.stringOrNumber,
}
type buttonSkeleton = {
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
}
type buttonV2ButtonPropsConfig = {
  width?: CommonTypes.stringOrNumber,
  size?: buttonV2Size,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  leftSlot?: buttonSlot,
  rightSlot?: buttonSlot,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonGroupPosition,
  buttonType?: buttonV2Type,
  subType?: buttonV2SubType,
  loading?: bool,
  state?: buttonV2State,
}
