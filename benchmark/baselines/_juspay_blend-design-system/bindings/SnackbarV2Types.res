type slotConfig7 = {
  height: string,
  width: string,
  color: SnackbarTypes.colorConfig5,
}
type headerConfig16 = {
  color: string,
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
}
type textContainerConfig4 = {
  gap: string,
  header: headerConfig16,
  description: headerConfig16,
}
type actionContainerConfig2 = {
  primaryAction: headerConfig16,
}
type contentConfig10 = {
  gap: string,
  textContainer: textContainerConfig4,
  actionContainer: actionContainerConfig2,
}
type closeButtonConfig3 = {
  height: string,
  color: SnackbarTypes.colorConfig5,
}
type mainContainerConfig2 = {
  gap: string,
  content: contentConfig10,
  closeButton: closeButtonConfig3,
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
  slot: slotConfig7,
  mainContainer: mainContainerConfig2,
}
type responsiveSnackbarV2Tokens = {
  sm: snackbarV2TokensType,
  lg: snackbarV2TokensType,
}
