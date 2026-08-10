type genericInstantiationDistinctFieldTag =
  | @as("a") A
  | @as("b") B
type genericInstantiationDistinctTakeFnArmsXsConfigV1euep = {
  on: string => unit,
}
type genericInstantiationDistinctTakeFnArmsXsConfigV1tjzn = {
  on: float => unit,
}
type genericInstantiationDistinctTakeSharedArmsXsConfigV1hnll = {
  v: string,
}
type genericInstantiationDistinctTakeSharedArmsXsConfigTj2n3 = {
  v: float,
}
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
type boxOf = {
  v: string,  // 🛑 BROKEN — contains `unknown`
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
module FnArms = {
  type t
  external fromGenericInstantiationDistinctTakeFnArmsXsConfig: genericInstantiationDistinctTakeFnArmsXsConfigV1euep => t = "%identity"
  external asGenericInstantiationDistinctTakeFnArmsXsConfig: t => (genericInstantiationDistinctTakeFnArmsXsConfigV1euep) = "%identity"
  external fromGenericInstantiationDistinctTakeFnArmsXsConfig2: genericInstantiationDistinctTakeFnArmsXsConfigV1tjzn => t = "%identity"
  external asGenericInstantiationDistinctTakeFnArmsXsConfig2: t => (genericInstantiationDistinctTakeFnArmsXsConfigV1tjzn) = "%identity"
}
module SharedArms = {
  type t
  external fromGenericInstantiationDistinctTakeSharedArmsXsConfig: genericInstantiationDistinctTakeSharedArmsXsConfigV1hnll => t = "%identity"
  external asGenericInstantiationDistinctTakeSharedArmsXsConfig: t => (genericInstantiationDistinctTakeSharedArmsXsConfigV1hnll) = "%identity"
  external fromGenericInstantiationDistinctTakeSharedArmsXsConfig2: genericInstantiationDistinctTakeSharedArmsXsConfigTj2n3 => t = "%identity"
  external asGenericInstantiationDistinctTakeSharedArmsXsConfig2: t => (genericInstantiationDistinctTakeSharedArmsXsConfigTj2n3) = "%identity"
}
module GenericInstantiationDistinctField = {
  type t
  external fromNamedArmA: namedArmA => t = "%identity"
  external asNamedArmA: t => (namedArmA) = "%identity"
  external fromNamedArmB: namedArmB => t = "%identity"
  external asNamedArmB: t => (namedArmB) = "%identity"
}
