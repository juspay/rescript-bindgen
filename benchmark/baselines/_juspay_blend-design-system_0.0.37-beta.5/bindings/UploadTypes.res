type uploadState =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
type uploadUploadedFileWithStatusStatus =
  | @as("error") Error
  | @as("success") Success
type uploadUploadTokenTypeHeaderLabelTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type uploadUploadTokenTypeHeaderLabelConfig = {
  text: uploadUploadTokenTypeHeaderLabelTextConfig,
  marginBottom: string,
  gap: string,
}
type uploadUploadTokenTypeHeaderRequiredTextConfig = {
  color: string,
}
type uploadUploadTokenTypeHeaderRequiredConfig = {
  text: uploadUploadTokenTypeHeaderRequiredTextConfig,
  gap: string,
}
type uploadUploadTokenTypeHeaderSubLabelConfig = {
  text: uploadUploadTokenTypeHeaderLabelTextConfig,
  gap: string,
}
type uploadUploadTokenTypeHeaderHelpIconConfig = {
  width: string,
  color: string,
}
type uploadUploadTokenTypeHeaderConfig = {
  label: uploadUploadTokenTypeHeaderLabelConfig,
  required: uploadUploadTokenTypeHeaderRequiredConfig,
  subLabel: uploadUploadTokenTypeHeaderSubLabelConfig,
  helpIcon: uploadUploadTokenTypeHeaderHelpIconConfig,
}
type uploadUploadTokenTypeContainerBorderConfig = {
  idle: string,
  uploading: string,
  success: string,
  error: string,
  dragActive: string,
}
type uploadUploadTokenTypeContainerContentSlotConfig = {
  width: string,
  gap: string,
}
type uploadUploadTokenTypeContainerContentTextTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type uploadUploadTokenTypeContainerContentTextConfig = {
  title: uploadUploadTokenTypeContainerContentTextTitleConfig,
  subtitle: uploadUploadTokenTypeContainerContentTextTitleConfig,
  gap: string,
}
type uploadUploadTokenTypeContainerContentActionableConfig = {
  gap: string,
  errorText: uploadUploadTokenTypeContainerContentTextTitleConfig,
}
type uploadUploadTokenTypeContainerContentConfig = {
  slot: uploadUploadTokenTypeContainerContentSlotConfig,
  text: uploadUploadTokenTypeContainerContentTextConfig,
  actionable: uploadUploadTokenTypeContainerContentActionableConfig,
}
type uploadUploadTokenTypeContainerConfig = {
  border: uploadUploadTokenTypeContainerBorderConfig,
  backgroundColor: uploadUploadTokenTypeContainerBorderConfig,
  borderRadius: string,
  padding: string,
  content: uploadUploadTokenTypeContainerContentConfig,
}
type uploadTokenType = {
  header: uploadUploadTokenTypeHeaderConfig,
  container: uploadUploadTokenTypeContainerConfig,
}
type responsiveUploadTokens = {
  sm: uploadTokenType,
  lg: uploadTokenType,
}
type uploadFile = {
  file: Webapi.File.t,
  progress: float,
  status: uploadState,
  id: string,
  error?: string,
}
type uploadedFileWithStatus = {
  file: Webapi.File.t,
  id: string,
  status: uploadUploadedFileWithStatusStatus,
  error?: string,
}
type uploadFileRejectionErrorsConfig = {
  code: string,
  message: string,
}
type fileRejection = {
  file: Webapi.File.t,
  errors: array<uploadFileRejectionErrorsConfig>,
}
type uploadOnStateChangeConfig = {
  state: uploadState,
  hasError: bool,
  hasSuccess: bool,
  hasUploading: bool,
  errorFiles: array<uploadedFileWithStatus>,
  successfulFiles: array<uploadedFileWithStatus>,
}
module UploadFormValue = {
  type t
  external fromFile: Webapi.File.t => t = "%identity"
  external asFile: t => (Webapi.File.t) = "%identity"
  external fromFiles: array<Webapi.File.t> => t = "%identity"
  external asFiles: t => (array<Webapi.File.t>) = "%identity"
}
