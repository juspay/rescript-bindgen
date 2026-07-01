type alertV2Type =
  | @as("primary") Primary
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("purple") Purple
  | @as("orange") Orange
  | @as("neutral") Neutral
type alertV2SubType =
  | @as("subtle") Subtle
  | @as("noFill") NoFill
type alertV2ActionPosition =
  | @as("bottom") Bottom
  | @as("right") Right
type alertV2AlertV2TokensTypeBorderPrimaryConfig = {
  subtle: string,
  noFill: string,
}
type alertV2AlertV2TokensTypeBorderConfig = {
  primary: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  success: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  warning: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  error: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  purple: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  orange: alertV2AlertV2TokensTypeBorderPrimaryConfig,
  neutral: alertV2AlertV2TokensTypeBorderPrimaryConfig,
}
type alertV2AlertV2TokensTypePaddingConfig = {
  top: string,
  bottom: string,
  left: string,
  right: string,
}
type alertV2AlertV2TokensTypeGapConfig = {
  bottom: string,
  right: string,
}
type alertV2AlertV2TokensTypeSlotConfig = {
  maxHeight: string,
}
type alertV2AlertV2TokensTypeMainContainerCloseButtonColorConfig = {
  primary: string,
  success: string,
  warning: string,
  error: string,
  purple: string,
  orange: string,
  neutral: string,
}
type alertV2AlertV2TokensTypeMainContainerContentTextContainerHeadingConfig = {
  color: alertV2AlertV2TokensTypeMainContainerCloseButtonColorConfig,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
}
type alertV2AlertV2TokensTypeMainContainerContentTextContainerConfig = {
  gap: string,
  heading: alertV2AlertV2TokensTypeMainContainerContentTextContainerHeadingConfig,
  description: alertV2AlertV2TokensTypeMainContainerContentTextContainerHeadingConfig,
}
type alertV2AlertV2TokensTypeMainContainerContentActionContainerConfig = {
  gap: string,
  primaryAction: alertV2AlertV2TokensTypeMainContainerContentTextContainerHeadingConfig,
  secondaryAction: alertV2AlertV2TokensTypeMainContainerContentTextContainerHeadingConfig,
}
type alertV2AlertV2TokensTypeMainContainerContentConfig = {
  gap: alertV2AlertV2TokensTypeGapConfig,
  textContainer: alertV2AlertV2TokensTypeMainContainerContentTextContainerConfig,
  actionContainer: alertV2AlertV2TokensTypeMainContainerContentActionContainerConfig,
}
type alertV2AlertV2TokensTypeMainContainerCloseButtonConfig = {
  color: alertV2AlertV2TokensTypeMainContainerCloseButtonColorConfig,
  height: string,
  width: string,
}
type alertV2AlertV2TokensTypeMainContainerConfig = {
  gap: string,
  content: alertV2AlertV2TokensTypeMainContainerContentConfig,
  closeButton: alertV2AlertV2TokensTypeMainContainerCloseButtonConfig,
}
type alertV2TokensType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  border: alertV2AlertV2TokensTypeBorderConfig,
  borderRadius: string,
  backgroundColor: alertV2AlertV2TokensTypeBorderConfig,
  padding: alertV2AlertV2TokensTypePaddingConfig,
  gap: alertV2AlertV2TokensTypeGapConfig,
  slot: alertV2AlertV2TokensTypeSlotConfig,
  mainContainer: alertV2AlertV2TokensTypeMainContainerConfig,
}
type responsiveAlertV2Tokens = {
  sm: alertV2TokensType,
  lg: alertV2TokensType,
}
type alertV2SlotConfig = {
  slot: React.element,
  maxHeight?: string,
}
type alertV2Action = {
  text: string,
  onClick: ReactEvent.Mouse.t => unit,
}
type alertV2Actions = {
  position?: alertV2ActionPosition,
  primaryAction?: alertV2Action,
  secondaryAction?: alertV2Action,
}
type alertV2CloseButtonConfig = {
  show?: bool,
  onClick?: ReactEvent.Mouse.t => unit,
}
