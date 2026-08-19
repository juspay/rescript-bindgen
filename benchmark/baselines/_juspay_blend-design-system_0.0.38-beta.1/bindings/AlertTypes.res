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
type alertAlertTokenTypeBackgroundPrimaryConfig = {
  subtle: string,
  noFill: string,
}
type alertAlertTokenTypeBackgroundConfig = {
  primary: alertAlertTokenTypeBackgroundPrimaryConfig,
  success: alertAlertTokenTypeBackgroundPrimaryConfig,
  warning: alertAlertTokenTypeBackgroundPrimaryConfig,
  error: alertAlertTokenTypeBackgroundPrimaryConfig,
  purple: alertAlertTokenTypeBackgroundPrimaryConfig,
  orange: alertAlertTokenTypeBackgroundPrimaryConfig,
  neutral: alertAlertTokenTypeBackgroundPrimaryConfig,
}
type alertAlertTokenTypeTextHeadingConfig = {
  color: string,  // ⚪ loose — was `{ primary: Color; success: Color; warning: Color; error: Color; purple: Color; orange: Color; neutral: Color; `
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
}
type alertAlertTokenTypeTextConfig = {
  heading: alertAlertTokenTypeTextHeadingConfig,
  description: alertAlertTokenTypeTextHeadingConfig,
}
type alertAlertTokenTypeButtonConfig = {
  gap: string,
  primaryAction: alertAlertTokenTypeTextHeadingConfig,
  secondaryAction: alertAlertTokenTypeTextHeadingConfig,
  closeButton: alertAlertTokenTypeTextHeadingConfig,
}
type alertTokenType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  gap: string,
  padding: string,
  borderRadius: string,
  background: alertAlertTokenTypeBackgroundConfig,
  border: alertAlertTokenTypeBackgroundConfig,
  text: alertAlertTokenTypeTextConfig,
  button: alertAlertTokenTypeButtonConfig,
}
type responsiveAlertTokens = {
  sm: alertTokenType,
  lg: alertTokenType,
}
type alertAction = {
  label: string,
  onClick: unit => unit,
}
type alertProps = {
  heading: string,
  description: string,
  variant?: alertVariant,
  style?: alertStyle,
  primaryAction?: alertAction,
  secondaryAction?: alertAction,
  onClose?: unit => unit,
  icon?: React.element,
  actionPlacement?: alertActionPlacement,
  maxWidth?: string,
  minWidth?: string,
  width?: string,
}
