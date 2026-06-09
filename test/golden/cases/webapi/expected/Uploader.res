@module("demo") @react.component
external make: (
  ~file: Webapi.File.t=?,
  ~files: Webapi.FileList.t=?,
  ~data: Webapi.FormData.t=?,
  ~value: WebapiTypes.Value.t=?,  // ⓘ was `File | File[]` — opaque; build with Value.fromFile / Value.fromFiles
  ~formAction: Webapi.FormData.t => 'a=?,
) => React.element = "Uploader"
