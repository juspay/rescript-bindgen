type snackbarV2ColorConfig = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type snackbarV2SlotConfig = {
  height: string,
  width: string,
  color: snackbarV2ColorConfig,
}
type snackbarV2HeaderConfig = {
  color: snackbarV2ColorConfig,
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
}
type snackbarV2TextContainerConfig = {
  gap: string,
  header: snackbarV2HeaderConfig,
  description: snackbarV2HeaderConfig,
}
type snackbarV2ActionContainerConfig = {
  primaryAction: snackbarV2HeaderConfig,
}
type snackbarV2ContentConfig = {
  gap: string,
  textContainer: snackbarV2TextContainerConfig,
  actionContainer: snackbarV2ActionContainerConfig,
}
type snackbarV2CloseButtonConfig = {
  height: string,
  color: snackbarV2ColorConfig,
}
type snackbarV2MainContainerConfig = {
  gap: string,
  content: snackbarV2ContentConfig,
  closeButton: snackbarV2CloseButtonConfig,
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
  slot: snackbarV2SlotConfig,
  mainContainer: snackbarV2MainContainerConfig,
}
type responsiveSnackbarV2Tokens = {
  sm: snackbarV2TokensType,
  lg: snackbarV2TokensType,
}
