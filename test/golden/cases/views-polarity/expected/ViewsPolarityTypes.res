type virtualBox = {
  x: float,
}
type plainSpot = {
  y: float,
}
module ViewsPolarityMode = {
  type t
  external fromTrue: [#"true"] => t = "%identity"
  let true_: t = fromTrue(#"true")
  external fromLazy: [#"lazy"] => t = "%identity"
  let lazy_: t = fromLazy(#"lazy")
  external fromVirtualBox: virtualBox => t = "%identity"
  external fromPlainSpot: plainSpot => t = "%identity"
}
module ResolveTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external fromVirtualBox: virtualBox => t = "%identity"
  external fromPlainSpot: plainSpot => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
