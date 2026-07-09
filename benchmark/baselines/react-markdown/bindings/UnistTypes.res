type position = {
  ...JsxDOM.domProps,
}
module LibVFileMessagePlace = {
  type t
  external fromPosition: position => t = "%identity"
  external asPosition: t => (position) = "%identity"
  external fromPoint: position => t = "%identity"
  external asPoint: t => (position) = "%identity"
}
