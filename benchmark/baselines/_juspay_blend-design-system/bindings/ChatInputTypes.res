type type_2 =
  | @as("image") Image
  | @as("text") Text
  | @as("pdf") Pdf
  | @as("csv") Csv
  | @as("other") Other
type attachedFile = {
  id: string,
  name: string,
  @as("type") type_: type_2,
  size?: float,
  url?: string,
  preview?: string,
}
type topQuery = {
  id: string,
  text: string,
}
type backgroundColorConfig11 = {
  default: string,
  hover: string,
  disabled: string,
}
type borderRadiusConfig10 = {
  default: string,
  focus: string,
}
type colorConfig15 = {
  default: string,
  hover: string,
  focus: string,
  disabled: string,
}
type lineHeightConfig2 = {
  default: string,
  hover: string,
  focus: string,
}
type textConfig21 = {
  color: colorConfig15,
  fontSize: colorConfig15,
  fontWeight: colorConfig15,
  lineHeight: lineHeightConfig2,
}
type containerConfig11 = {
  backgroundColor: backgroundColorConfig11,
  border: borderRadiusConfig10,
  borderRadius: string,
  padding: string,
  gap: string,
  minHeight: string,
  transition: string,
  boxShadow: lineHeightConfig2,
}
type attachmentContainerConfig = {
  backgroundColor: string,
  borderRadius: string,
  padding: string,
}
type placeholderConfig4 = {
  color: string,
}
type textareaConfig = {
  backgroundColor: string,
  color: string,
  fontSize: string,
  lineHeight: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  border: string,
  borderRadius: string,
  placeholder: placeholderConfig4,
  resize: string,
  fontFamily: string,
  minHeight: string,
  maxHeight: string,
  overflowY: string,
}
type filesContainerConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
  maxHeight: string,
  overflowY: string,
  margin: string,
}
type bottomActionsConfig = {
  paddingX: string,
  paddingY: string,
  gap: string,
  justifyContent: string,
}
type backgroundColorConfig12 = {
  default: string,
  hover: string,
  active: string,
}
type overflowTagConfig = {
  backgroundColor: backgroundColorConfig12,
  color: backgroundColorConfig12,
  border: string,
  borderRadius: string,
  paddingX: string,
  paddingY: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
  transition: string,
  cursor: string,
}
type containerConfig12 = {
  borderTop: string,
  paddingTop: string,
}
type headerConfig14 = {
  color: string,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  textTransform: string,
  backgroundColor: string,
  flexShrink: string,
}
type scrollContainerConfig = {
  overflowY: string,
  maxHeightOffset: float,
  backgroundColor: string,
  scrollbarColor: string,
}
type backgroundColorConfig13 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type opacityConfig2 = {
  default: string,
  disabled: string,
}
type itemConfig8 = {
  backgroundColor: backgroundColorConfig13,
  color: backgroundColorConfig13,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  border: string,
  transition: string,
  cursor: string,
  opacity: opacityConfig2,
}
type topQueriesConfig = {
  container: containerConfig12,
  header: headerConfig14,
  scrollContainer: scrollContainerConfig,
  item: itemConfig8,
}
type smConfig13 = {
  backgroundColor: backgroundColorConfig11,
  borderRadius: borderRadiusConfig10,
  border: borderRadiusConfig10,
  minHeight: string,
  maxHeight: string,
  gap: string,
  text: textConfig21,
  resize: string,
  overflow: string,
  paddingLeft: string,
  paddingTop: string,
  paddingBottom: string,
  container: containerConfig11,
  attachmentContainer: attachmentContainerConfig,
  textarea: textareaConfig,
  filesContainer: filesContainerConfig,
  bottomActions: bottomActionsConfig,
  overflowTag: overflowTagConfig,
  topQueries: topQueriesConfig,
}
type responsiveChatInputTokensType = {
  sm: smConfig13,
  lg: smConfig13,
}
