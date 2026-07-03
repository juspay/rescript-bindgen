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
type snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerHeaderConfig = {
  color: string,  // ⚪ loose — was `{ info: Color; success: Color; warning: Color; error: Color; }`
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
}
type snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerConfig = {
  gap: string,
  header: snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerHeaderConfig,
  description: snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerHeaderConfig,
}
type snackbarV2SnackbarV2TokensTypeMainContainerContentActionContainerConfig = {
  primaryAction: snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerHeaderConfig,
}
type snackbarV2SnackbarV2TokensTypeMainContainerContentConfig = {
  gap: string,
  textContainer: snackbarV2SnackbarV2TokensTypeMainContainerContentTextContainerConfig,
  actionContainer: snackbarV2SnackbarV2TokensTypeMainContainerContentActionContainerConfig,
}
type snackbarV2SnackbarV2TokensTypeMainContainerCloseButtonConfig = {
  height: string,
  color: snackbarV2SnackbarV2TokensTypeSlotColorConfig,
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
