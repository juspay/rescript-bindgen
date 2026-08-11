@@warning("-30")

type poisoned_t
type rec recursiveOpaqueViewsRootChildrenBadConfig = {
  kind: [#"bad"],
  children: array<poisoned_t>,
  payload: string,  // 🛑 BROKEN — contains `any`
}
and recursiveOpaqueViewsRootConfig = {
  kind: [#"ok"],
  children: array<poisoned_t>,
}
module Poisoned = {
  type t = poisoned_t
  external fromRecursiveOpaqueViewsRootConfig: recursiveOpaqueViewsRootConfig => t = "%identity"
  external asRecursiveOpaqueViewsRootConfig: t => (recursiveOpaqueViewsRootConfig) = "%identity"
  external fromRecursiveOpaqueViewsRootChildrenBadConfig: recursiveOpaqueViewsRootChildrenBadConfig => t = "%identity"
  external asRecursiveOpaqueViewsRootChildrenBadConfig: t => (recursiveOpaqueViewsRootChildrenBadConfig) = "%identity"
}
type shape_t
type rec recursiveOpaqueViewsShapeNestedConfig = {
  sides: string,  // ⚪ loose — was `4`
  side: float,
  nested: array<shape_t>,
}
and recursiveOpaqueViewsShapeConfig = {
  sides: string,  // ⚪ loose — was `0`
  radius: float,
  nested: array<shape_t>,
}
module Shape = {
  type t = shape_t
  external fromRecursiveOpaqueViewsShapeConfig: recursiveOpaqueViewsShapeConfig => t = "%identity"
  external asRecursiveOpaqueViewsShapeConfig: t => (recursiveOpaqueViewsShapeConfig) = "%identity"
  external fromRecursiveOpaqueViewsShapeNestedConfig: recursiveOpaqueViewsShapeNestedConfig => t = "%identity"
  external asRecursiveOpaqueViewsShapeNestedConfig: t => (recursiveOpaqueViewsShapeNestedConfig) = "%identity"
}
