type seed =
  | @as("a|b") AB
  | @as("a") A
  | @as("c") C
  | @as("b|c") BC
  | @as("d") D
  | @as("e") E
type alpha = {
  a: string,
}
type beta = {
  b: float,
}
module SetOne = {
  type t
  external fromTag: [#"a|b" | #"c" | #"d" | #"e"] => t = "%identity"
  external fromAlpha: alpha => t = "%identity"
  external asAlpha: t => (alpha) = "%identity"
  external fromBeta: beta => t = "%identity"
  external asBeta: t => (beta) = "%identity"
}
module SetTwo = {
  type t
  external fromTag: [#"a" | #"b|c" | #"d" | #"e"] => t = "%identity"
  external fromAlpha: alpha => t = "%identity"
  external asAlpha: t => (alpha) = "%identity"
  external fromBeta: beta => t = "%identity"
  external asBeta: t => (beta) = "%identity"
}
