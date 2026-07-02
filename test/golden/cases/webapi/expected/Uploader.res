@module("demo") @react.component
external make: (
  ~file: Webapi.File.t=?,
  ~files: Webapi.FileList.t=?,
  ~data: Webapi.FormData.t=?,
  ~value: WebapiTypes.WebapiValue.t=?,  // ⓘ was `File | File[]` — opaque; build with WebapiValue.fromFile / WebapiValue.fromFiles
  ~formAction: Webapi.FormData.t => 'a=?,
) => React.element = "Uploader"
