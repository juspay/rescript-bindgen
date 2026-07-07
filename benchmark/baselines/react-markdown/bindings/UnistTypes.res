type position = {
  ...JsxDOM.domProps,
}
module LibVFileMessagePlace = {
  type t
  external fromPosition: position => t = "%identity"
  external fromPoint: position => t = "%identity"
}
