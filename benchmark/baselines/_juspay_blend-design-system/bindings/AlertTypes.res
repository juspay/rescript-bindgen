type alertVariant =
  | @as("primary") Primary
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("purple") Purple
  | @as("orange") Orange
  | @as("neutral") Neutral
type alertStyle =
  | @as("subtle") Subtle
  | @as("noFill") NoFill
type alertActionPlacement =
  | @as("bottom") Bottom
  | @as("right") Right
type alertAction = {
  label: string,
  onClick: unit => unit,
}
type alertPrimaryConfig = {
  subtle: string,
  noFill: string,
}
type alertBackgroundConfig = {
  primary: alertPrimaryConfig,
  success: alertPrimaryConfig,
  warning: alertPrimaryConfig,
  error: alertPrimaryConfig,
  purple: alertPrimaryConfig,
  orange: alertPrimaryConfig,
  neutral: alertPrimaryConfig,
}
type alertColorConfig = {
  primary: string,
  success: string,
  warning: string,
  error: string,
  purple: string,
  orange: string,
  neutral: string,
}
type alertHeadingConfig = {
  color: alertColorConfig,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
}
type alertTextConfig = {
  heading: alertHeadingConfig,
  description: alertHeadingConfig,
}
type alertButtonConfig = {
  gap: string,
  primaryAction: alertHeadingConfig,
  secondaryAction: alertHeadingConfig,
  closeButton: alertHeadingConfig,
}
type alertTokenType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  gap: string,
  padding: string,
  borderRadius: string,
  background: alertBackgroundConfig,
  border: alertBackgroundConfig,
  text: alertTextConfig,
  button: alertButtonConfig,
}
type responsiveAlertTokens = {
  sm: alertTokenType,
  lg: alertTokenType,
}
