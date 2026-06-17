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
type snackbarActionButtonConfig = {
  label: string,
  onClick: unit => unit,
  autoDismiss?: bool,
}
type addToastOptions = {
  header: string,
  description?: string,
  variant?: snackbarVariant,
  onClose?: unit => unit,
  actionButton?: snackbarActionButtonConfig,
  duration?: float,
  position?: snackbarPosition,
}
type snackbarColorConfig = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarInfoIconConfig = {
  color: snackbarColorConfig,
  height: string,
}
type snackbarColorConfig2 = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarHeaderConfig = {
  color: snackbarColorConfig2,
  fontSize?: string,
  fontWeight?: string,
}
type snackbarTextContainerConfig = {
  gap?: string,
  header: snackbarHeaderConfig,
  description: snackbarHeaderConfig,
}
type snackbarContentConfig = {
  gap?: string,
  textContainer: snackbarTextContainerConfig,
}
type snackbarPrimaryActionConfig = {
  color: snackbarColorConfig,
  fontSize?: string,
  fontWeight?: string,
}
type snackbarCloseButtonConfig = {
  height: string,
  color: snackbarColorConfig,
}
type snackbarActionsConfig = {
  primaryAction: snackbarPrimaryActionConfig,
  closeButton: snackbarCloseButtonConfig,
}
type snackbarSmConfig = {
  backgroundColor?: string,
  borderRadius?: string,
  padding?: string,
  maxWidth?: string,
  boxShadow?: string,
  gap?: string,
  infoIcon: snackbarInfoIconConfig,
  content: snackbarContentConfig,
  actions: snackbarActionsConfig,
}
type responsiveSnackbarTokens = {
  sm: snackbarSmConfig,
  lg: snackbarSmConfig,
}
