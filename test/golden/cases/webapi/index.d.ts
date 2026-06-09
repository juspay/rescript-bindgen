// Web platform types gated on --webapi: File/FileList/FormData -> Webapi.*.t.
// `File | File[]` -> an opaque module (fromFile/fromFiles). `(d: FormData) =>
// void | Promise<void>` exercises both webapi + the polymorphic async return.
// (File, FileList, FormData are lib.dom; generated only with --webapi.)
type JsxElement = { __brand: 'element' }

export declare const Uploader: (props: {
  file?: File                  // -> Webapi.File.t
  files?: FileList             // -> Webapi.FileList.t
  data?: FormData              // -> Webapi.FormData.t
  value?: File | File[]        // -> opaque module { fromFile | fromFiles }
  formAction?: (d: FormData) => void | Promise<void> // -> Webapi.FormData.t => 'a
}) => JsxElement
