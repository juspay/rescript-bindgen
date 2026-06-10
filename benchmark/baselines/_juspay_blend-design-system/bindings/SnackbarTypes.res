type snackbarPosition =
  | @as("top-left") TopLeft
  | @as("top-right") TopRight
  | @as("bottom-left") BottomLeft
  | @as("bottom-right") BottomRight
  | @as("top-center") TopCenter
  | @as("bottom-center") BottomCenter
type snackbarVariant =
  | @as("info") Info
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
type actionButtonConfig = {
  label: string,
  onClick: unit => unit,
  autoDismiss?: bool,
}
type addToastOptions = {
  header: string,
  description?: string,
  variant?: snackbarVariant,
  onClose?: unit => unit,
  actionButton?: actionButtonConfig,
  duration?: float,
  position?: snackbarPosition,
}
type colorConfig5 = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type infoIconConfig = {
  color: colorConfig5,
  height: string,
}
type colorConfig6 = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type headerConfig2 = {
  color: colorConfig6,
  fontSize: string,
  fontWeight: string,
}
type textContainerConfig = {
  gap: string,
  header: headerConfig2,
  description: headerConfig2,
}
type contentConfig = {
  gap: string,
  textContainer: textContainerConfig,
}
type primaryActionConfig = {
  color: colorConfig5,
  fontSize: string,
  fontWeight: string,
}
type closeButtonConfig = {
  height: string,
  color: colorConfig5,
}
type actionsConfig = {
  primaryAction: primaryActionConfig,
  closeButton: closeButtonConfig,
}
type smConfig7 = {
  backgroundColor: string,
  borderRadius: string,
  padding: string,
  maxWidth: string,
  boxShadow: string,
  gap: string,
  infoIcon: infoIconConfig,
  content: contentConfig,
  actions: actionsConfig,
}
type responsiveSnackbarTokens = {
  sm: smConfig7,
  lg: smConfig7,
}
