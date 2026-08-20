type uploadState2 =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
type uploadUploadedFileWithStatusStatus =
  | @as("error") Error
  | @as("success") Success
type __typeUx2o03 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type uploadUploadTokenTypeHeaderLabelConfig = {
  text: __typeUx2o03,
  marginBottom: string,
  gap: string,
}
type __typeV12ovp = {
  color: string,
}
type uploadUploadTokenTypeHeaderRequiredConfig = {
  text: __typeV12ovp,
  gap: string,
}
type uploadUploadTokenTypeHeaderSubLabelConfig = {
  text: __typeUx2o03,
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
type __typeTuyz6 = {
  width: string,
  gap: string,
}
type __typeV1y6we3 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type __typeSdi5z = {
  title: __typeV1y6we3,
  subtitle: __typeV1y6we3,
  gap: string,
}
type __typeV1asz9 = {
  gap: string,
  errorText: __typeV1y6we3,
}
type uploadUploadTokenTypeContainerContentConfig = {
  slot: __typeTuyz6,
  text: __typeSdi5z,
  actionable: __typeV1asz9,
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
