@@warning("-30")

type poisoned_t
type rec recursiveOpaqueViewsRootsBadConfig = {
  kind: string,  // ⚪ loose — was `"bad"`
  children: array<poisoned_t>,
  payload: string,  // 🛑 BROKEN — contains `any`
}
and recursiveOpaqueViewsRootsOkConfig = {
  kind: string,  // ⚪ loose — was `"ok"`
  children: array<poisoned_t>,
}
module Poisoned = {
  type t = poisoned_t
  external fromRecursiveOpaqueViewsRootsOkConfig: recursiveOpaqueViewsRootsOkConfig => t = "%identity"
  external asRecursiveOpaqueViewsRootsOkConfig: t => (recursiveOpaqueViewsRootsOkConfig) = "%identity"
  external fromRecursiveOpaqueViewsRootsBadConfig: recursiveOpaqueViewsRootsBadConfig => t = "%identity"
  external asRecursiveOpaqueViewsRootsBadConfig: t => (recursiveOpaqueViewsRootsBadConfig) = "%identity"
}
type shape_t
type rec recursiveOpaqueViewsListConfigF3432 = {
  sides: string,  // ⚪ loose — was `4`
  side: float,
  nested: array<shape_t>,
}
and recursiveOpaqueViewsListConfigV1nk3d = {
  sides: string,  // ⚪ loose — was `0`
  radius: float,
  nested: array<shape_t>,
}
module Shape = {
  type t = shape_t
  external fromRecursiveOpaqueViewsListConfig: recursiveOpaqueViewsListConfigV1nk3d => t = "%identity"
  external asRecursiveOpaqueViewsListConfig: t => (recursiveOpaqueViewsListConfigV1nk3d) = "%identity"
  external fromRecursiveOpaqueViewsListConfig2: recursiveOpaqueViewsListConfigF3432 => t = "%identity"
  external asRecursiveOpaqueViewsListConfig2: t => (recursiveOpaqueViewsListConfigF3432) = "%identity"
}
