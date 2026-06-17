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
type alertV2PrimaryConfig = {
  subtle: string,
  noFill: string,
}
type alertV2BorderConfig = {
  primary: alertV2PrimaryConfig,
  success: alertV2PrimaryConfig,
  warning: alertV2PrimaryConfig,
  error: alertV2PrimaryConfig,
  purple: alertV2PrimaryConfig,
  orange: alertV2PrimaryConfig,
  neutral: alertV2PrimaryConfig,
}
type alertV2PaddingConfig = {
  top: string,
  bottom: string,
  left: string,
  right: string,
}
type alertV2GapConfig = {
  bottom: string,
  right: string,
}
type alertV2SlotConfig = {
  maxHeight?: string,
}
type alertV2ColorConfig = {
  primary: string,
  success: string,
  warning: string,
  error: string,
  purple: string,
  orange: string,
  neutral: string,
}
type alertV2HeadingConfig = {
  color: alertV2ColorConfig,
  fontWeight?: string,
  fontSize?: string,
  lineHeight?: string,
}
type alertV2TextContainerConfig = {
  gap?: string,
  heading: alertV2HeadingConfig,
  description: alertV2HeadingConfig,
}
type alertV2ActionContainerConfig = {
  gap?: string,
  primaryAction: alertV2HeadingConfig,
  secondaryAction: alertV2HeadingConfig,
}
type alertV2ContentConfig = {
  gap: alertV2GapConfig,
  textContainer: alertV2TextContainerConfig,
  actionContainer: alertV2ActionContainerConfig,
}
type alertV2CloseButtonConfig = {
  color: alertV2ColorConfig,
  height?: string,
  width?: string,
}
type alertV2MainContainerConfig = {
  gap?: string,
  content: alertV2ContentConfig,
  closeButton: alertV2CloseButtonConfig,
}
type alertV2TokensType = {
  width?: string,
  maxWidth?: string,
  minWidth?: string,
  border: alertV2BorderConfig,
  borderRadius?: string,
  backgroundColor: alertV2BorderConfig,
  padding: alertV2PaddingConfig,
  gap: alertV2GapConfig,
  slot: alertV2SlotConfig,
  mainContainer: alertV2MainContainerConfig,
}
type responsiveAlertV2Tokens = {
  sm: alertV2TokensType,
  lg: alertV2TokensType,
}
type alertV2SlotConfig2 = {
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
type alertV2CloseButtonConfig2 = {
  show?: bool,
  onClick?: ReactEvent.Mouse.t => unit,
}
