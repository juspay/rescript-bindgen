module WebapiValue = {
  type t
  external fromFile: Webapi.File.t => t = "%identity"
  external fromFiles: array<Webapi.File.t> => t = "%identity"
}
