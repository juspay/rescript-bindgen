type type_3 =
  | @as("image") Image
  | @as("text") Text
  | @as("pdf") Pdf
  | @as("csv") Csv
  | @as("other") Other
type attachedFile = {
  id: string,
  name: string,
  @as("type") type_: type_3,
  size?: float,
  url?: string,
  preview?: string,
}
type topQuery = {
  id: string,
  text: string,
}
type chatInputBackgroundColorConfig = {
  default: string,
  hover: string,
  disabled: string,
}
type chatInputBorderRadiusConfig = {
  default: string,
  focus: string,
}
type chatInputColorConfig = {
  default: string,
  hover: string,
  focus: string,
  disabled: string,
}
type chatInputLineHeightConfig = {
  default: string,
  hover: string,
  focus: string,
}
type chatInputTextConfig = {
  color: chatInputColorConfig,
  fontSize: chatInputColorConfig,
  fontWeight: chatInputColorConfig,
  lineHeight: chatInputLineHeightConfig,
}
type chatInputContainerConfig = {
  backgroundColor: chatInputBackgroundColorConfig,
  border: chatInputBorderRadiusConfig,
  borderRadius: string,
  padding: string,
  gap: string,
  minHeight: string,
  transition: string,
  boxShadow: chatInputLineHeightConfig,
}
type chatInputAttachmentContainerConfig = {
  backgroundColor: string,
  borderRadius: string,
  padding: string,
}
type chatInputPlaceholderConfig = {
  color: string,
}
type chatInputTextareaConfig = {
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
  placeholder: chatInputPlaceholderConfig,
  resize: string,
  fontFamily: string,
  minHeight: string,
  maxHeight: string,
  overflowY: string,
}
type chatInputFilesContainerConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
  maxHeight: string,
  overflowY: string,
  margin: string,
}
type chatInputBottomActionsConfig = {
  paddingX: string,
  paddingY: string,
  gap: string,
  justifyContent: string,
}
type chatInputBackgroundColorConfig2 = {
  default: string,
  hover: string,
  active: string,
}
type chatInputOverflowTagConfig = {
  backgroundColor: chatInputBackgroundColorConfig2,
  color: chatInputBackgroundColorConfig2,
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
type chatInputContainerConfig2 = {
  borderTop: string,
  paddingTop: string,
}
type chatInputHeaderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  textTransform: string,
  backgroundColor: string,
  flexShrink: string,
}
type chatInputScrollContainerConfig = {
  overflowY: string,
  maxHeightOffset: float,
  backgroundColor: string,
  scrollbarColor: string,
}
type chatInputBackgroundColorConfig3 = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type chatInputOpacityConfig = {
  default: string,
  disabled: string,
}
type chatInputItemConfig = {
  backgroundColor: chatInputBackgroundColorConfig3,
  color: chatInputBackgroundColorConfig3,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  border: string,
  transition: string,
  cursor: string,
  opacity: chatInputOpacityConfig,
}
type chatInputTopQueriesConfig = {
  container: chatInputContainerConfig2,
  header: chatInputHeaderConfig,
  scrollContainer: chatInputScrollContainerConfig,
  item: chatInputItemConfig,
}
type chatInputSmConfig = {
  backgroundColor: chatInputBackgroundColorConfig,
  borderRadius: chatInputBorderRadiusConfig,
  border: chatInputBorderRadiusConfig,
  minHeight: string,
  maxHeight: string,
  gap: string,
  text: chatInputTextConfig,
  resize: string,
  overflow: string,
  paddingLeft: string,
  paddingTop: string,
  paddingBottom: string,
  container: chatInputContainerConfig,
  attachmentContainer: chatInputAttachmentContainerConfig,
  textarea: chatInputTextareaConfig,
  filesContainer: chatInputFilesContainerConfig,
  bottomActions: chatInputBottomActionsConfig,
  overflowTag: chatInputOverflowTagConfig,
  topQueries: chatInputTopQueriesConfig,
}
type responsiveChatInputTokensType = {
  sm: chatInputSmConfig,
  lg: chatInputSmConfig,
}
