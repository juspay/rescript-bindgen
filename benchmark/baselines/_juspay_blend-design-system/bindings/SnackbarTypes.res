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
type snackbarAddToastOptionsActionButtonConfig = {
  label: string,
  onClick: unit => unit,
  autoDismiss?: bool,
}
type addToastOptions = {
  header: string,
  description?: string,
  variant?: snackbarVariant,
  onClose?: unit => unit,
  actionButton?: snackbarAddToastOptionsActionButtonConfig,
  duration?: float,
  position?: snackbarPosition,
}
type snackbarResponsiveSnackbarTokensSmInfoIconColorConfig = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarResponsiveSnackbarTokensSmInfoIconConfig = {
  color: snackbarResponsiveSnackbarTokensSmInfoIconColorConfig,
  height: string,  // ⚪ loose — was `number | (string & {}) | "-moz-initial" | "inherit" | "initial" | "revert" | "revert-layer" | "unset" | "-moz-`
}
type snackbarResponsiveSnackbarTokensSmContentTextContainerHeaderConfig = {
  color: snackbarResponsiveSnackbarTokensSmInfoIconColorConfig,
  fontSize: string,
  fontWeight: string,
}
type snackbarResponsiveSnackbarTokensSmContentTextContainerConfig = {
  gap: string,
  header: snackbarResponsiveSnackbarTokensSmContentTextContainerHeaderConfig,
  description: snackbarResponsiveSnackbarTokensSmContentTextContainerHeaderConfig,
}
type snackbarResponsiveSnackbarTokensSmContentConfig = {
  gap: string,
  textContainer: snackbarResponsiveSnackbarTokensSmContentTextContainerConfig,
}
type snackbarResponsiveSnackbarTokensSmActionsCloseButtonConfig = {
  height: string,  // ⚪ loose — was `number | (string & {}) | "-moz-initial" | "inherit" | "initial" | "revert" | "revert-layer" | "unset" | "-moz-`
  color: snackbarResponsiveSnackbarTokensSmInfoIconColorConfig,
}
type snackbarResponsiveSnackbarTokensSmActionsConfig = {
  primaryAction: snackbarResponsiveSnackbarTokensSmContentTextContainerHeaderConfig,
  closeButton: snackbarResponsiveSnackbarTokensSmActionsCloseButtonConfig,
}
type snackbarResponsiveSnackbarTokensSmConfig = {
  backgroundColor: string,
  borderRadius: string,
  padding: string,
  maxWidth: string,
  boxShadow: string,
  gap: string,
  infoIcon: snackbarResponsiveSnackbarTokensSmInfoIconConfig,
  content: snackbarResponsiveSnackbarTokensSmContentConfig,
  actions: snackbarResponsiveSnackbarTokensSmActionsConfig,
}
type responsiveSnackbarTokens = {
  sm: snackbarResponsiveSnackbarTokensSmConfig,
  lg: snackbarResponsiveSnackbarTokensSmConfig,
}
