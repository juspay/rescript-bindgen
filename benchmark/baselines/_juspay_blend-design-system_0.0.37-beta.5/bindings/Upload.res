type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameOnChangeOnDragLeaveOnDragOverOnDrop,
  multiple?: bool,
  accept?: array<string>,
  maxSize?: float,
  maxFiles?: float,
  disabled?: bool,
  required?: bool,
  label?: string,
  subLabel?: string,
  helpIconHintText?: string,
  children?: React.element,
  description?: string,
  className?: string,
  errorText?: string,
  state?: UploadTypes.uploadState,
  uploadingFiles?: array<UploadTypes.uploadFile>,
  uploadedFiles?: array<UploadTypes.uploadedFileWithStatus>,
  failedFiles?: array<UploadTypes.uploadedFileWithStatus>,
  enforceFileTypeConsistency?: bool,
  progressSpeed?: float,
  value?: UploadTypes.UploadFormValue.t,  // ⓘ was `UploadFormValue` — opaque; build with UploadFormValue.fromFile / UploadFormValue.fromFiles
  onChange?: UploadTypes.UploadFormValue.t => unit,  // ⓘ was `UploadFormValue` — opaque; build with UploadFormValue.fromFile / UploadFormValue.fromFiles
  onDrop?: (array<Webapi.File.t>, array<UploadTypes.fileRejection>) => unit,
  onDropAccepted?: array<Webapi.File.t> => unit,
  onDropRejected?: array<UploadTypes.fileRejection> => unit,
  onFileRemove?: string => unit,
  onReplaceFile?: unit => unit,
  onStateChange?: UploadTypes.uploadOnStateChangeConfig => unit,
  isDragActive?: bool,
  isDragAccept?: bool,
  isDragReject?: bool,
  validator?: Webapi.File.t => Nullable.t<UploadTypes.uploadFileRejectionErrorsConfig>,
  actionSlot?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Upload"
