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
type gapConfig5 = {
  bottom: string,
  right: string,
}
type headingConfig4 = {
  color: AlertTypes.colorConfig2,
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
type contentConfig9 = {
  gap: gapConfig5,
  textContainer: textContainerConfig3,
  actionContainer: actionContainerConfig,
}
type closeButtonConfig2 = {
  color: AlertTypes.colorConfig2,
  height: string,
  width: string,
}
type mainContainerConfig = {
  gap: string,
  content: contentConfig9,
  closeButton: closeButtonConfig2,
}
type alertV2TokensType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  border: AlertTypes.backgroundConfig,
  borderRadius: string,
  backgroundColor: AlertTypes.backgroundConfig,
  padding: DrawerTypes.offsetConfig,
  gap: gapConfig5,
  slot: ChartsTypes.dropdownConfig,
  mainContainer: mainContainerConfig,
}
type responsiveAlertV2Tokens = {
  sm: alertV2TokensType,
  lg: alertV2TokensType,
}
type slotConfig11 = {
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
type closeButtonConfig4 = {
  show?: bool,
  onClick?: ReactEvent.Mouse.t => unit,
}
