module UnionOfMapsHandlers = {
  type t
  external fromMapOnClick: Map.t<string, string => unit> => t = "%identity"
  external fromMapOnHover: Map.t<string, string => bool> => t = "%identity"
}
