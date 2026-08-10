type genericInstantiationDistinctFieldTag =
  | @as("a") A
  | @as("b") B
type genericInstantiationDistinctValueConfigV31qow<'a> = {
  ...JsxDOM.domProps,
  _data: 'a,
  _format: [#"body"],
}
type genericInstantiationDistinctValueConfigVd30b = {
  ...JsxDOM.domProps,
  _data: string,
  _format: [#"text"],
}
type genericInstantiationDistinctValueConfigV3fyyt = {
  ...JsxDOM.domProps,
  _data: unit,
  _format: [#"redirect"],
}
type pairRy8eg<'a> = {
  a: 'a,
  b: 'a,
}
type pairV1spt2 = {
  a: string,  // 🛑 BROKEN — contains `unknown`
  b: string,  // 🛑 BROKEN — contains `unknown`
}
type pairV1o117 = {
  a: string,
  b: string,
}
type boxOf<'a> = {
  v: 'a,
}
type genericInstantiationDistinctFieldConfig = {
  tag: genericInstantiationDistinctFieldTag,
  v: string,
}
type namedArmA = {
  kind: [#"na"],
  v: string,
}
type namedArmB = {
  kind: [#"nb"],
  v: string,
}
module GenericInstantiationDistinctField = {
  type t
  external fromNamedArmA: namedArmA => t = "%identity"
  external asNamedArmA: t => (namedArmA) = "%identity"
  external fromNamedArmB: namedArmB => t = "%identity"
  external asNamedArmB: t => (namedArmB) = "%identity"
}
