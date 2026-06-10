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
type backgroundColorConfig10 = {
  default: string,
  hover: string,
  disabled: string,
}
type borderRadiusConfig9 = {
  default: string,
  focus: string,
}
type colorConfig14 = {
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
type textConfig19 = {
  color: colorConfig14,
  fontSize: colorConfig14,
  fontWeight: colorConfig14,
  lineHeight: lineHeightConfig2,
}
type containerConfig8 = {
  backgroundColor: backgroundColorConfig10,
  border: borderRadiusConfig9,
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
  placeholder: AvatarGroupTypes.textConfig7,
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
type overflowTagConfig = {
  backgroundColor: BreadcrumbTypes.colorConfig3,
  color: BreadcrumbTypes.colorConfig3,
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
type containerConfig9 = {
  borderTop: string,
  paddingTop: string,
}
type headerConfig13 = {
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
type opacityConfig2 = {
  default: string,
  disabled: string,
}
type itemConfig8 = {
  backgroundColor: ButtonSkeletonTypes.defaultConfig,
  color: ButtonSkeletonTypes.defaultConfig,
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
  container: containerConfig9,
  header: headerConfig13,
  scrollContainer: scrollContainerConfig,
  item: itemConfig8,
}
type smConfig11 = {
  backgroundColor: backgroundColorConfig10,
  borderRadius: borderRadiusConfig9,
  border: borderRadiusConfig9,
  minHeight: string,
  maxHeight: string,
  gap: string,
  text: textConfig19,
  resize: string,
  overflow: string,
  paddingLeft: string,
  paddingTop: string,
  paddingBottom: string,
  container: containerConfig8,
  attachmentContainer: attachmentContainerConfig,
  textarea: textareaConfig,
  filesContainer: filesContainerConfig,
  bottomActions: bottomActionsConfig,
  overflowTag: overflowTagConfig,
  topQueries: topQueriesConfig,
}
type responsiveChatInputTokensType = {
  sm: smConfig11,
  lg: smConfig11,
}
