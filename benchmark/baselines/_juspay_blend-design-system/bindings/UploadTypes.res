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
type labelConfig4 = {
  text: StatCardTypes.titleConfig3,
  marginBottom: string,
  gap: string,
}
type requiredConfig = {
  text: AvatarGroupTypes.textConfig7,
  gap: string,
}
type subLabelConfig = {
  text: StatCardTypes.titleConfig3,
  gap: string,
}
type headerConfig12 = {
  label: labelConfig4,
  required: requiredConfig,
  subLabel: subLabelConfig,
  helpIcon: AvatarGroupTypes.borderConfig3,
}
type borderConfig7 = {
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
type textConfig18 = {
  title: DateRangePickerTypes.labelConfig,
  subtitle: DateRangePickerTypes.labelConfig,
  gap: string,
}
type actionableConfig = {
  gap: string,
  errorText: DateRangePickerTypes.labelConfig,
}
type contentConfig4 = {
  slot: slotConfig3,
  text: textConfig18,
  actionable: actionableConfig,
}
type containerConfig7 = {
  border: borderConfig7,
  backgroundColor: borderConfig7,
  borderRadius: string,
  padding: string,
  content: contentConfig4,
}
type uploadTokenType = {
  header: headerConfig12,
  container: containerConfig7,
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
