module WebapiValue = {
  type t
  external fromFile: Webapi.File.t => t = "%identity"
  external asFile: t => (Webapi.File.t) = "%identity"
  external fromFiles: array<Webapi.File.t> => t = "%identity"
  external asFiles: t => (array<Webapi.File.t>) = "%identity"
}
