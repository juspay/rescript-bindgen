type uploadState =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
type status =
  | @as("error") Error
  | @as("success") Success
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
type errorsConfig = {
  code: string,
  message: string,
}
type fileRejection = {
  file: Webapi.File.t,
  errors: array<errorsConfig>,
}
type onStateChangeConfig = {
  state: uploadState,
  hasError: bool,
  hasSuccess: bool,
  hasUploading: bool,
  errorFiles: array<uploadedFileWithStatus>,
  successfulFiles: array<uploadedFileWithStatus>,
}
type textConfig18 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type labelConfig7 = {
  text: textConfig18,
  marginBottom: string,
  gap: string,
}
type textConfig19 = {
  color: string,
}
type requiredConfig4 = {
  text: textConfig19,
  gap: string,
}
type subLabelConfig = {
  text: textConfig18,
  gap: string,
}
type helpIconConfig3 = {
  width: string,
  color: string,
}
type headerConfig13 = {
  label: labelConfig7,
  required: requiredConfig4,
  subLabel: subLabelConfig,
  helpIcon: helpIconConfig3,
}
type borderConfig9 = {
  idle: string,
  uploading: string,
  success: string,
  error: string,
  dragActive: string,
}
type slotConfig3 = {
  width: string,
  gap: string,
}
type titleConfig8 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type textConfig20 = {
  title: titleConfig8,
  subtitle: titleConfig8,
  gap: string,
}
type actionableConfig = {
  gap: string,
  errorText: titleConfig8,
}
type contentConfig5 = {
  slot: slotConfig3,
  text: textConfig20,
  actionable: actionableConfig,
}
type containerConfig10 = {
  border: borderConfig9,
  backgroundColor: borderConfig9,
  borderRadius: string,
  padding: string,
  content: contentConfig5,
}
type uploadTokenType = {
  header: headerConfig13,
  container: containerConfig10,
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
