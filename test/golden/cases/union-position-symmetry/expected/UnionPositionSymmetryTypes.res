type unionPositionSymmetryPropConfigV1wsd3 = {
  a: string,
}
type unionPositionSymmetryPropConfigY1clz = {
  b: float,
}
module Anon = {
  type t
  external fromUnionPositionSymmetryPropConfig: unionPositionSymmetryPropConfigV1wsd3 => t = "%identity"
  external asUnionPositionSymmetryPropConfig: t => (unionPositionSymmetryPropConfigV1wsd3) = "%identity"
  external fromUnionPositionSymmetryPropConfig2: unionPositionSymmetryPropConfigY1clz => t = "%identity"
  external asUnionPositionSymmetryPropConfig2: t => (unionPositionSymmetryPropConfigY1clz) = "%identity"
}
type holder = {
  one: Anon.t,
  many: array<Anon.t>,
}
type unionPositionSymmetrySingleObjConfig = {
  top: float,
}
@unboxed type numberOrUnionPositionSymmetrySingleObjConfig = Num(float) | UnionPositionSymmetrySingleObjConfig(unionPositionSymmetrySingleObjConfig)
module ConstructOnly = {
  type t
  external fromUnionPositionSymmetryPropConfig: unionPositionSymmetryPropConfigV1wsd3 => t = "%identity"
  external asUnionPositionSymmetryPropConfig: t => (unionPositionSymmetryPropConfigV1wsd3) = "%identity"
  external fromUnionPositionSymmetryPropConfig2: unionPositionSymmetryPropConfigY1clz => t = "%identity"
  external asUnionPositionSymmetryPropConfig2: t => (unionPositionSymmetryPropConfigY1clz) = "%identity"
  external fromAuto: [#"auto"] => t = "%identity"
  let auto: t = fromAuto(#"auto")
}
