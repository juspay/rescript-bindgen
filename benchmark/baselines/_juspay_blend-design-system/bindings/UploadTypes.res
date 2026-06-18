type uploadState =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
type status =
  | @as("success") Success
  | @as("error") Error
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
  status: status,
  error?: string,
}
type uploadErrorsConfig = {
  code: string,
  message: string,
}
type fileRejection = {
  file: Webapi.File.t,
  errors: array<uploadErrorsConfig>,
}
type uploadOnStateChangeConfig = {
  state: uploadState,
  hasError: bool,
  hasSuccess: bool,
  hasUploading: bool,
  errorFiles: array<uploadedFileWithStatus>,
  successfulFiles: array<uploadedFileWithStatus>,
}
type uploadTextConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type uploadLabelConfig = {
  text: uploadTextConfig,
  marginBottom: string,
  gap: string,
}
type uploadTextConfig2 = {
  color: string,
}
type uploadRequiredConfig = {
  text: uploadTextConfig2,
  gap: string,
}
type uploadSubLabelConfig = {
  text: uploadTextConfig,
  gap: string,
}
type uploadHelpIconConfig = {
  width: string,
  color: string,
}
type uploadHeaderConfig = {
  label: uploadLabelConfig,
  required: uploadRequiredConfig,
  subLabel: uploadSubLabelConfig,
  helpIcon: uploadHelpIconConfig,
}
type uploadBorderConfig = {
  idle: string,
  uploading: string,
  success: string,
  error: string,
  dragActive: string,
}
type uploadSlotConfig = {
  width: string,
  gap: string,
}
type uploadTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type uploadTextConfig3 = {
  title: uploadTitleConfig,
  subtitle: uploadTitleConfig,
  gap: string,
}
type uploadActionableConfig = {
  gap: string,
  errorText: uploadTitleConfig,
}
type uploadContentConfig = {
  slot: uploadSlotConfig,
  text: uploadTextConfig3,
  actionable: uploadActionableConfig,
}
type uploadContainerConfig = {
  border: uploadBorderConfig,
  backgroundColor: uploadBorderConfig,
  borderRadius: string,
  padding: string,
  content: uploadContentConfig,
}
type uploadTokenType = {
  header: uploadHeaderConfig,
  container: uploadContainerConfig,
}
type responsiveUploadTokens = {
  sm: uploadTokenType,
  lg: uploadTokenType,
}
module UploadFormValue = {
  type t
  external fromFile: Webapi.File.t => t = "%identity"
  external fromFiles: array<Webapi.File.t> => t = "%identity"
}
