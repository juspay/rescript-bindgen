type colorConfig21 = {
  info: string,
  success: string,
  warning: string,
  error: string,
}
type slotConfig8 = {
  height: string,
  width: string,
  color: colorConfig21,
}
type headerConfig17 = {
  color: colorConfig21,
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
}
type textContainerConfig4 = {
  gap: string,
  header: headerConfig17,
  description: headerConfig17,
}
type actionContainerConfig2 = {
  primaryAction: headerConfig17,
}
type contentConfig12 = {
  gap: string,
  textContainer: textContainerConfig4,
  actionContainer: actionContainerConfig2,
}
type closeButtonConfig4 = {
  height: string,
  color: colorConfig21,
}
type mainContainerConfig2 = {
  gap: string,
  content: contentConfig12,
  closeButton: closeButtonConfig4,
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
  slot: slotConfig8,
  mainContainer: mainContainerConfig2,
}
type responsiveSnackbarV2Tokens = {
  sm: snackbarV2TokensType,
  lg: snackbarV2TokensType,
}
