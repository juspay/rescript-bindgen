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
type snackbarResponsiveSnackbarTokensSmInfoIconColorConfig = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarResponsiveSnackbarTokensSmInfoIconConfig = {
  color: snackbarResponsiveSnackbarTokensSmInfoIconColorConfig,
  height: string,
}
type snackbarResponsiveSnackbarTokensSmContentTextContainerConfig = {
  gap: string,
  header: string,  // ⚪ loose — was `{ color: { info: Color; success: Color; warning: Color; error: Color; }; fontSize: FontSize<number | (string &`
  description: string,  // ⚪ loose — was `{ color: { info: Color; success: Color; warning: Color; error: Color; }; fontSize: FontSize<number | (string &`
}
type snackbarResponsiveSnackbarTokensSmContentConfig = {
  gap: string,
  textContainer: snackbarResponsiveSnackbarTokensSmContentTextContainerConfig,
}
type snackbarResponsiveSnackbarTokensSmActionsPrimaryActionConfig = {
  color: string,  // ⚪ loose — was `{ info: Color; success: Color; warning: Color; error: Color; }`
  fontSize: string,
  fontWeight: string,
}
type snackbarResponsiveSnackbarTokensSmActionsCloseButtonConfig = {
  height: string,
  color: string,  // ⚪ loose — was `{ info: Color; success: Color; warning: Color; error: Color; }`
}
type snackbarResponsiveSnackbarTokensSmActionsConfig = {
  primaryAction: snackbarResponsiveSnackbarTokensSmActionsPrimaryActionConfig,
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
  wrap?: bool,
}
