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
type primaryConfig11 = {
  subtle: string,
  noFill: string,
}
type borderConfig12 = {
  primary: primaryConfig11,
  success: primaryConfig11,
  warning: primaryConfig11,
  error: primaryConfig11,
  purple: primaryConfig11,
  orange: primaryConfig11,
  neutral: primaryConfig11,
}
type paddingConfig27 = {
  top: string,
  bottom: string,
  left: string,
  right: string,
}
type gapConfig5 = {
  bottom: string,
  right: string,
}
type slotConfig6 = {
  maxHeight: string,
}
type colorConfig19 = {
  primary: string,
  success: string,
  warning: string,
  error: string,
  purple: string,
  orange: string,
  neutral: string,
}
type headingConfig4 = {
  color: colorConfig19,
  fontWeight: string,
  fontSize: string,
  lineHeight: string,
}
type textContainerConfig3 = {
  gap: string,
  heading: headingConfig4,
  description: headingConfig4,
}
type actionContainerConfig = {
  gap: string,
  primaryAction: headingConfig4,
  secondaryAction: headingConfig4,
}
type contentConfig10 = {
  gap: gapConfig5,
  textContainer: textContainerConfig3,
  actionContainer: actionContainerConfig,
}
type closeButtonConfig3 = {
  color: colorConfig19,
  height: string,
  width: string,
}
type mainContainerConfig = {
  gap: string,
  content: contentConfig10,
  closeButton: closeButtonConfig3,
}
type alertV2TokensType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  border: borderConfig12,
  borderRadius: string,
  backgroundColor: borderConfig12,
  padding: paddingConfig27,
  gap: gapConfig5,
  slot: slotConfig6,
  mainContainer: mainContainerConfig,
}
type responsiveAlertV2Tokens = {
  sm: alertV2TokensType,
  lg: alertV2TokensType,
}
type slotConfig13 = {
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
type closeButtonConfig5 = {
  show?: bool,
  onClick?: ReactEvent.Mouse.t => unit,
}
