type group<'b> = {
  items: array<'b>,
  label: string,
}
type namedA = {
  a: string,
}
type namedB = {
  b: float,
}
module ViewsModuleReadersFilteredItems = {
  type t
  external fromTypeVar: 'a => t = "%identity"
  external fromGroup: group<'b> => t = "%identity"
  external asGroup: t => (group<'b>) = "%identity"
}
module BorderRadius = {
  type t
  external fromString: string => t = "%identity"
  external asString: t => (string) = "%identity"
  external fromNumber: float => t = "%identity"
  external asNumber: t => (float) = "%identity"
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
}
module PrimArr = {
  type t
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
  external fromArray: array<string> => t = "%identity"
  external asArray: t => (array<string>) = "%identity"
}
module NestArr = {
  type t
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
  external fromArrays: array<array<string>> => t = "%identity"
  external asArrays: t => (array<array<string>>) = "%identity"
}
module NumArm = {
  type t
  external fromNumber: float => t = "%identity"
  external asNumber: t => (float) = "%identity"
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
}
module BoolArm = {
  type t
  external fromBool: bool => t = "%identity"
  external asBool: t => (bool) = "%identity"
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
}
module WithLiterals = {
  type t
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
  external fromAuto: [#"auto"] => t = "%identity"
  let auto: t = fromAuto(#"auto")
  external fromNone: [#"none"] => t = "%identity"
  let none: t = fromNone(#"none")
}
module WithTagRun = {
  type t
  external fromNamedA: namedA => t = "%identity"
  external asNamedA: t => (namedA) = "%identity"
  external fromNamedB: namedB => t = "%identity"
  external asNamedB: t => (namedB) = "%identity"
  external fromTag: [#"aa" | #"bb" | #"cc" | #"dd" | #"ee"] => t = "%identity"
}
