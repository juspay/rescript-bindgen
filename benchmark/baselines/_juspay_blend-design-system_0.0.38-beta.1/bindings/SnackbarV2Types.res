type snackbarV2Position =
  | @as("top-left") TopLeft
  | @as("top-right") TopRight
  | @as("bottom-left") BottomLeft
  | @as("bottom-right") BottomRight
  | @as("top-center") TopCenter
  | @as("bottom-center") BottomCenter
type snackbarV2Variant =
  | @as("info") Info
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
type snackbarV2SnackbarV2TokensTypeSlotColorConfig = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarV2SnackbarV2TokensTypeSlotConfig = {
  height: string,
  width: string,
  color: snackbarV2SnackbarV2TokensTypeSlotColorConfig,
}
type snackbarV2SnackbarV2TokensTypeMainContainerContentConfig = {
  gap: string,
  textContainer: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; header: { color: { info: Color; success: Color; warning: Color; error: Col`
  actionContainer: string,  // ⚪ loose — was `{ primaryAction: { color: { info: Color; success: Color; warning: Color; error: Color; }; fontSize: FontSize<n`
}
type snackbarV2SnackbarV2TokensTypeMainContainerCloseButtonConfig = {
  height: string,
  color: string,  // ⚪ loose — was `{ info: Color; success: Color; warning: Color; error: Color; }`
}
type snackbarV2SnackbarV2TokensTypeMainContainerConfig = {
  gap: string,
  content: snackbarV2SnackbarV2TokensTypeMainContainerContentConfig,
  closeButton: snackbarV2SnackbarV2TokensTypeMainContainerCloseButtonConfig,
}
type snackbarV2TokensType = {
  width: string,
  maxWidth: string,
  minWidth: string,
  backgroundColor: string,
  borderRadius: string,
  padding: string,
  boxShadow: string,
  gap: string,
  slot: snackbarV2SnackbarV2TokensTypeSlotConfig,
  mainContainer: snackbarV2SnackbarV2TokensTypeMainContainerConfig,
}
type responsiveSnackbarV2Tokens = {
  sm: snackbarV2TokensType,
  lg: snackbarV2TokensType,
}
type snackbarV2Props = {
  position?: snackbarV2Position,
  dismissOnClickAway?: bool,
  visibleToasts?: float,
  containerAriaLabel?: string,
  hotkey?: array<string>,
  maxWidth?: CommonTypes.stringOrNumber,
}
type snackbarV2Action = {
  label: string,
  onClick: unit => unit,
  autoDismiss?: bool,
}
type snackbarV2ToastOptions = {
  header: string,
  description?: string,
  variant?: snackbarV2Variant,
  slot?: React.element,
  onClose?: unit => unit,
  actionButton?: snackbarV2Action,
  duration?: float,
  position?: snackbarV2Position,
  maxWidth?: CommonTypes.stringOrNumber,
  width?: CommonTypes.stringOrNumber,
  minWidth?: CommonTypes.stringOrNumber,
}
type snackbarV2Dimensions = {
  width?: string,
  maxWidth?: string,
  minWidth?: string,
}
