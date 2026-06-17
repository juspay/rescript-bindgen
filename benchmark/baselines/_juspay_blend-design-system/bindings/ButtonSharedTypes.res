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
type buttonSlotMaxHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type buttonDefaultConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonPrimaryConfig = {
  default: buttonDefaultConfig,
  iconOnly: buttonDefaultConfig,
  inline: buttonDefaultConfig,
}
type buttonBackgroundColorConfig = {
  primary: buttonPrimaryConfig,
  secondary: buttonPrimaryConfig,
  danger: buttonPrimaryConfig,
  success: buttonPrimaryConfig,
}
type buttonDefaultConfig2 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type buttonPrimaryConfig2 = {
  default: buttonDefaultConfig2,
  iconOnly: buttonDefaultConfig2,
  inline: buttonDefaultConfig2,
}
type buttonSmConfig = {
  primary: buttonPrimaryConfig2,
  secondary: buttonPrimaryConfig2,
  danger: buttonPrimaryConfig2,
  success: buttonPrimaryConfig2,
}
type buttonBorderRadiusConfig = {
  sm: buttonSmConfig,
  md: buttonSmConfig,
  lg: buttonSmConfig,
}
type buttonDefaultConfig3 = {
  x: string,
  y: string,
}
type buttonPrimaryConfig3 = {
  default: buttonDefaultConfig3,
  iconOnly: buttonDefaultConfig3,
  inline: buttonDefaultConfig3,
}
type buttonSmConfig2 = {
  primary: buttonPrimaryConfig3,
  secondary: buttonPrimaryConfig3,
  danger: buttonPrimaryConfig3,
  success: buttonPrimaryConfig3,
}
type buttonPaddingConfig = {
  sm: buttonSmConfig2,
  md: buttonSmConfig2,
  lg: buttonSmConfig2,
}
type buttonTextConfig = {
  color: buttonSmConfig,
  fontSize: buttonSlotMaxHeightConfig,
  fontWeight: buttonSlotMaxHeightConfig,
}
type buttonTokensType = {
  gap: string,
  slotMaxHeight: buttonSlotMaxHeightConfig,
  backgroundColor: buttonBackgroundColorConfig,
  borderRadius: buttonBorderRadiusConfig,
  padding: buttonPaddingConfig,
  border: buttonBackgroundColorConfig,
  shadow: buttonBackgroundColorConfig,
  outline: buttonBackgroundColorConfig,
  text: buttonTextConfig,
}
type responsiveButtonTokens = {
  sm: buttonTokensType,
  lg: buttonTokensType,
}
module OnClick2 = {
  type t
  external asEvent: t => (option<ReactEvent.Mouse.t> => unit) = "%identity"
  external asEvent2: t => (ReactEvent.Mouse.t => unit) = "%identity"
}
type modalButtonAction = {
  disabled?: bool,
  onClick?: OnClick2.t,
  justifyContent?: string,
  width?: CommonTypes.stringOrNumber,
  size?: buttonSize,
  text?: string,
  buttonType?: buttonType,
  subType?: buttonSubType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  fullWidth?: bool,
  state?: buttonState,
}
type bodySkeletonProps = {
  show?: bool,
  width?: string,
  height?: string,
}
type modalSkeletonProps = {
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonProps,
}
type modalPaddingConfig = {
  x: string,
  y: string,
}
type modalTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type modalTextConfig = {
  title: modalTitleConfig,
  subtitle: modalTitleConfig,
}
type modalHeaderConfig = {
  padding: modalPaddingConfig,
  borderBottom: string,
  backgroundColor: string,
  text: modalTextConfig,
}
type modalBodyConfig = {
  padding: string,
  backgroundColor: string,
}
type modalFooterConfig = {
  padding: string,
  borderTop: string,
  backgroundColor: string,
  gap: string,
}
type modalCloseButtonConfig = {
  color: string,
}
type modalTokensType = {
  boxShadow: string,
  borderRadius: string,
  header: modalHeaderConfig,
  body: modalBodyConfig,
  footer: modalFooterConfig,
  closeButton: modalCloseButtonConfig,
}
type responsiveModalTokens = {
  sm: modalTokensType,
  lg: modalTokensType,
}
type buttonProps = {
  buttonType?: buttonType,
  size?: buttonSize,
  subType?: buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: OnClick2.t,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: buttonGroupPosition,
  fullWidth?: bool,
  width?: CommonTypes.stringOrNumber,
  justifyContent?: string,
  state?: buttonState,
}
module OnClick = {
  type t
  external asEvent: t => (option<ReactEvent.Mouse.t> => unit) = "%identity"
  external asEvent2: t => (ReactEvent.Mouse.t => unit) = "%identity"
}
