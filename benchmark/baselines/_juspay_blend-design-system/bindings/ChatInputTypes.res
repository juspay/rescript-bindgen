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
type chatInputResponsiveChatInputTokensTypeSmBackgroundColorConfig = {
  default: string,
  hover: string,
  disabled: string,
}
type chatInputResponsiveChatInputTokensTypeSmBorderRadiusConfig = {
  default: string,
  focus: string,
}
type chatInputResponsiveChatInputTokensTypeSmTextColorConfig = {
  default: string,
  hover: string,
  focus: string,
  disabled: string,
}
type chatInputResponsiveChatInputTokensTypeSmTextLineHeightConfig = {
  default: string,
  hover: string,
  focus: string,
}
type chatInputResponsiveChatInputTokensTypeSmTextConfig = {
  color: chatInputResponsiveChatInputTokensTypeSmTextColorConfig,
  fontSize: chatInputResponsiveChatInputTokensTypeSmTextColorConfig,
  fontWeight: chatInputResponsiveChatInputTokensTypeSmTextColorConfig,
  lineHeight: chatInputResponsiveChatInputTokensTypeSmTextLineHeightConfig,
}
type chatInputResponsiveChatInputTokensTypeSmContainerConfig = {
  backgroundColor: chatInputResponsiveChatInputTokensTypeSmBackgroundColorConfig,
  border: chatInputResponsiveChatInputTokensTypeSmBorderRadiusConfig,
  borderRadius: string,
  padding: string,
  gap: string,
  minHeight: string,
  transition: string,
  boxShadow: chatInputResponsiveChatInputTokensTypeSmTextLineHeightConfig,
}
type chatInputResponsiveChatInputTokensTypeSmAttachmentContainerConfig = {
  backgroundColor: string,
  borderRadius: string,
  padding: string,
}
type chatInputResponsiveChatInputTokensTypeSmTextareaPlaceholderConfig = {
  color: string,
}
type chatInputResponsiveChatInputTokensTypeSmTextareaConfig = {
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
  placeholder: chatInputResponsiveChatInputTokensTypeSmTextareaPlaceholderConfig,
  resize: string,
  fontFamily: string,
  minHeight: string,
  maxHeight: string,
  overflowY: string,
}
type chatInputResponsiveChatInputTokensTypeSmFilesContainerConfig = {
  gap: string,
  paddingX: string,
  paddingY: string,
  maxHeight: string,
  overflowY: string,
  margin: string,
}
type chatInputResponsiveChatInputTokensTypeSmBottomActionsConfig = {
  paddingX: string,
  paddingY: string,
  gap: string,
  justifyContent: string,
}
type chatInputResponsiveChatInputTokensTypeSmOverflowTagBackgroundColorConfig = {
  default: string,
  hover: string,
  active: string,
}
type chatInputResponsiveChatInputTokensTypeSmOverflowTagConfig = {
  backgroundColor: chatInputResponsiveChatInputTokensTypeSmOverflowTagBackgroundColorConfig,
  color: chatInputResponsiveChatInputTokensTypeSmOverflowTagBackgroundColorConfig,
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
type chatInputResponsiveChatInputTokensTypeSmTopQueriesContainerConfig = {
  borderTop: string,
  paddingTop: string,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesHeaderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  textTransform: string,
  backgroundColor: string,
  flexShrink: string,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesScrollContainerConfig = {
  overflowY: string,
  maxHeightOffset: float,
  backgroundColor: string,
  scrollbarColor: string,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesItemBackgroundColorConfig = {
  default: string,
  hover: string,
  active: string,
  disabled: string,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesItemOpacityConfig = {
  default: string,
  disabled: string,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesItemConfig = {
  backgroundColor: chatInputResponsiveChatInputTokensTypeSmTopQueriesItemBackgroundColorConfig,
  color: chatInputResponsiveChatInputTokensTypeSmTopQueriesItemBackgroundColorConfig,
  fontSize: string,
  fontWeight: string,
  paddingX: string,
  paddingY: string,
  border: string,
  transition: string,
  cursor: string,
  opacity: chatInputResponsiveChatInputTokensTypeSmTopQueriesItemOpacityConfig,
}
type chatInputResponsiveChatInputTokensTypeSmTopQueriesConfig = {
  container: chatInputResponsiveChatInputTokensTypeSmTopQueriesContainerConfig,
  header: chatInputResponsiveChatInputTokensTypeSmTopQueriesHeaderConfig,
  scrollContainer: chatInputResponsiveChatInputTokensTypeSmTopQueriesScrollContainerConfig,
  item: chatInputResponsiveChatInputTokensTypeSmTopQueriesItemConfig,
}
type chatInputResponsiveChatInputTokensTypeSmConfig = {
  backgroundColor: chatInputResponsiveChatInputTokensTypeSmBackgroundColorConfig,
  borderRadius: chatInputResponsiveChatInputTokensTypeSmBorderRadiusConfig,
  border: chatInputResponsiveChatInputTokensTypeSmBorderRadiusConfig,
  minHeight: string,
  maxHeight: string,
  gap: string,
  text: chatInputResponsiveChatInputTokensTypeSmTextConfig,
  resize: string,
  overflow: string,
  paddingLeft: string,
  paddingTop: string,
  paddingBottom: string,
  container: chatInputResponsiveChatInputTokensTypeSmContainerConfig,
  attachmentContainer: chatInputResponsiveChatInputTokensTypeSmAttachmentContainerConfig,
  textarea: chatInputResponsiveChatInputTokensTypeSmTextareaConfig,
  filesContainer: chatInputResponsiveChatInputTokensTypeSmFilesContainerConfig,
  bottomActions: chatInputResponsiveChatInputTokensTypeSmBottomActionsConfig,
  overflowTag: chatInputResponsiveChatInputTokensTypeSmOverflowTagConfig,
  topQueries: chatInputResponsiveChatInputTokensTypeSmTopQueriesConfig,
}
type responsiveChatInputTokensType = {
  sm: chatInputResponsiveChatInputTokensTypeSmConfig,
  lg: chatInputResponsiveChatInputTokensTypeSmConfig,
}
