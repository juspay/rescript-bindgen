type uploadState2 =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
type uploadUploadedFileWithStatusStatus =
  | @as("error") Error
  | @as("success") Success
type uploadUploadTokenTypeHeaderLabelConfig = {
  text: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  marginBottom: string,
  gap: string,
}
type uploadUploadTokenTypeHeaderRequiredConfig = {
  text: string,  // ⚪ loose — was `{ color: Color; }`
  gap: string,
}
type uploadUploadTokenTypeHeaderHelpIconConfig = {
  width: string,
  color: string,
}
type uploadUploadTokenTypeHeaderConfig = {
  label: uploadUploadTokenTypeHeaderLabelConfig,
  required: uploadUploadTokenTypeHeaderRequiredConfig,
  subLabel: uploadUploadTokenTypeHeaderRequiredConfig,
  helpIcon: uploadUploadTokenTypeHeaderHelpIconConfig,
}
type uploadUploadTokenTypeContainerBorderConfig = {
  idle: string,
  uploading: string,
  success: string,
  error: string,
  dragActive: string,
}
type uploadUploadTokenTypeContainerContentConfig = {
  slot: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; gap: Gap<number | (string & {})>; }`
  text: string,  // ⚪ loose — was `{ title: { color: Color; fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; }; subtitle: { co`
  actionable: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; errorText: { color: Color; fontSize: FontSize<number | (string & {})>; fon`
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
  status: uploadState2,
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
  state: uploadState2,
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
