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
type primaryConfig4 = {
  subtle: string,
  noFill: string,
}
type backgroundConfig = {
  primary: primaryConfig4,
  success: primaryConfig4,
  warning: primaryConfig4,
  error: primaryConfig4,
  purple: primaryConfig4,
  orange: primaryConfig4,
  neutral: primaryConfig4,
}
type colorConfig2 = {
  primary: string,
  success: string,
  warning: string,
  error: string,
  purple: string,
  orange: string,
  neutral: string,
}
type headingConfig2 = {
  color: colorConfig2,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
}
type textConfig3 = {
  heading: headingConfig2,
  description: headingConfig2,
}
type buttonConfig = {
  gap: string,
  primaryAction: headingConfig2,
  secondaryAction: headingConfig2,
  closeButton: headingConfig2,
}
type alertTokenType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  gap: string,
  padding: string,
  borderRadius: string,
  background: backgroundConfig,
  border: backgroundConfig,
  text: textConfig3,
  button: buttonConfig,
}
type responsiveAlertTokens = {
  sm: alertTokenType,
  lg: alertTokenType,
}
