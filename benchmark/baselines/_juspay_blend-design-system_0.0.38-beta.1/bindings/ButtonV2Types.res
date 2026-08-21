type buttonV2Type =
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("danger") Danger
  | @as("success") Success
type buttonV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type buttonV2SubType =
  | @as("default") Default
  | @as("iconOnly") IconOnly
  | @as("inline") Inline
type buttonV2State =
  | @as("default") Default
  | @as("hover") Hover
  | @as("active") Active
  | @as("disabled") Disabled
type buttonV2GetButtonStatus =
  | @as("disabled") Disabled
  | @as("enabled") Enabled
  | @as("loading") Loading
type buttonGroupPosition =
  | @as("right") Right
  | @as("left") Left
  | @as("center") Center
type buttonV2ResponsiveButtonV2TokensSmSlotMaxHeightConfig = {
  sm: CommonTypes.stringOrNumber,
  md: CommonTypes.stringOrNumber,
  lg: CommonTypes.stringOrNumber,
}
type buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig = {
  default: string,
  iconOnly: string,
  inline: string,
}
type buttonV2ResponsiveButtonV2TokensSmFocusRingConfig = {
  primary: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  secondary: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  danger: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  success: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
}
type buttonV2UseThemeDefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonV2ResponsiveButtonV2TokensSmBackgroundColorPrimaryConfig = {
  default: buttonV2UseThemeDefaultConfig,
  iconOnly: buttonV2UseThemeDefaultConfig,
  inline: buttonV2UseThemeDefaultConfig,
}
type buttonV2ResponsiveButtonV2TokensSmBackgroundColorConfig = {
  primary: buttonV2ResponsiveButtonV2TokensSmBackgroundColorPrimaryConfig,
  secondary: buttonV2ResponsiveButtonV2TokensSmBackgroundColorPrimaryConfig,
  danger: buttonV2ResponsiveButtonV2TokensSmBackgroundColorPrimaryConfig,
  success: buttonV2ResponsiveButtonV2TokensSmBackgroundColorPrimaryConfig,
}
type buttonV2ResponsiveButtonV2TokensSmBorderRadiusSmConfig = {
  primary: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  secondary: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  danger: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
  success: buttonV2ResponsiveButtonV2TokensSmFocusRingPrimaryConfig,
}
type buttonV2ResponsiveButtonV2TokensSmBorderRadiusConfig = {
  sm: buttonV2ResponsiveButtonV2TokensSmBorderRadiusSmConfig,
  md: buttonV2ResponsiveButtonV2TokensSmBorderRadiusSmConfig,
  lg: buttonV2ResponsiveButtonV2TokensSmBorderRadiusSmConfig,
}
type buttonV2ResponsiveButtonV2TokensSmPaddingTopConfig = {
  sm: buttonV2ResponsiveButtonV2TokensSmFocusRingConfig,
  md: buttonV2ResponsiveButtonV2TokensSmFocusRingConfig,
  lg: buttonV2ResponsiveButtonV2TokensSmFocusRingConfig,
}
type buttonV2ResponsiveButtonV2TokensSmPaddingConfig = {
  top: buttonV2ResponsiveButtonV2TokensSmPaddingTopConfig,
  right: buttonV2ResponsiveButtonV2TokensSmPaddingTopConfig,
  bottom: buttonV2ResponsiveButtonV2TokensSmPaddingTopConfig,
  left: buttonV2ResponsiveButtonV2TokensSmPaddingTopConfig,
}
type buttonV2ResponsiveButtonV2TokensSmTextFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type buttonV2ResponsiveButtonV2TokensSmTextConfig = {
  color: buttonV2ResponsiveButtonV2TokensSmBorderRadiusSmConfig,
  fontSize: buttonV2ResponsiveButtonV2TokensSmTextFontSizeConfig,
  fontWeight: buttonV2ResponsiveButtonV2TokensSmTextFontSizeConfig,
  lineHeight: buttonV2ResponsiveButtonV2TokensSmTextFontSizeConfig,
}
type buttonV2ResponsiveButtonV2TokensSmConfig = {
  gap: string,
  slotMaxHeight: buttonV2ResponsiveButtonV2TokensSmSlotMaxHeightConfig,
  focusRing: buttonV2ResponsiveButtonV2TokensSmFocusRingConfig,
  backgroundColor: buttonV2ResponsiveButtonV2TokensSmBackgroundColorConfig,
  borderRadius: buttonV2ResponsiveButtonV2TokensSmBorderRadiusConfig,
  padding: buttonV2ResponsiveButtonV2TokensSmPaddingConfig,
  border: buttonV2ResponsiveButtonV2TokensSmBackgroundColorConfig,
  shadow: buttonV2ResponsiveButtonV2TokensSmBackgroundColorConfig,
  text: buttonV2ResponsiveButtonV2TokensSmTextConfig,
}
type responsiveButtonV2Tokens = {
  sm: buttonV2ResponsiveButtonV2TokensSmConfig,
  lg: buttonV2ResponsiveButtonV2TokensSmConfig,
}
type buttonSlot = {
  slot: React.element,
  maxHeight?: CommonTypes.stringOrNumber,
}
type buttonSkeleton = {
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
}
type buttonBaseProps = {
  buttonType?: buttonV2Type,
  size?: buttonV2Size,
  subType?: buttonV2SubType,
  text?: string,
  leftSlot?: buttonSlot,
  rightSlot?: buttonSlot,
  loading?: bool,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  width?: CommonTypes.stringOrNumber,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  state?: buttonV2State,
}
type buttonGroupV2Props = {
  stacked?: bool,
  gap?: CommonTypes.stringOrNumber,
  children: React.element,
}
type buttonV2GetIconMaxHeightConfig = {
  left: string,
  right: string,
}
type buttonV2GetButtonBorderStylesConfig = {
  border?: string,
  borderTop?: string,
  borderRight?: string,
  borderBottom?: string,
  borderLeft?: string,
}
type buttonStylesReturn = {
  background?: string,
  color?: string,
  border?: string,
  borderTop?: string,
  borderBottom?: string,
  borderLeft?: string,
  borderRight?: string,
  cursor?: string,
  _active?: Dict.t<CommonTypes.stringOrNumber>,
  _hover?: Dict.t<CommonTypes.stringOrNumber>,
  _focusVisible?: Dict.t<CommonTypes.stringOrNumber>,
  _disabled?: Dict.t<CommonTypes.stringOrNumber>,
}
type buttonV2GetButtonPaddingConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type buttonV2Props = {
  buttonType?: buttonV2Type,
  size?: buttonV2Size,
  subType?: buttonV2SubType,
  text?: string,
  leftSlot?: buttonSlot,
  rightSlot?: buttonSlot,
  loading?: bool,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  width?: CommonTypes.stringOrNumber,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  state?: buttonV2State,
  justifyContent?: string,
}
type buttonV2TimelineShowMorePropsButtonPropsConfig = {
  width?: CommonTypes.stringOrNumber,
  size?: buttonV2Size,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  leftSlot?: buttonSlot,
  justifyContent?: string,
  state?: buttonV2State,
  rightSlot?: buttonSlot,
  skeleton?: buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  buttonType?: buttonV2Type,
  subType?: buttonV2SubType,
  loading?: bool,
}
module CardV2Actions = {
  type t
  external fromButtonV2Props: buttonV2Props => t = "%identity"
  external asButtonV2Props: t => (buttonV2Props) = "%identity"
  external fromButtonV2Propss: array<buttonV2Props> => t = "%identity"
  external asButtonV2Propss: t => (array<buttonV2Props>) = "%identity"
}
