module UnionOfMapsHandlers = {
  type t
  external fromMapOnClick: Map.t<string, string => unit> => t = "%identity"
  external asMapOnClick: t => (Map.t<string, string => unit>) = "%identity"
  external fromMapOnHover: Map.t<string, string => bool> => t = "%identity"
  external asMapOnHover: t => (Map.t<string, string => bool>) = "%identity"
}
