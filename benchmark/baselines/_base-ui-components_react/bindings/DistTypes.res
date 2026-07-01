type distVirtualElementGetBoundingClientRectConfig = {
  x: float,
  y: float,
  height: float,
  width: float,
  left: float,
  right: float,
  bottom: float,
  top: float,
}
module GetClientRectsTarget = {
  type t
  external fromDistVirtualElementGetBoundingClientRectConfigs: array<distVirtualElementGetBoundingClientRectConfig> => t = "%identity"
  external fromDOMRectList: WebTypes.domRectList => t = "%identity"
}
type virtualElement = {
  getBoundingClientRect: unit => distVirtualElementGetBoundingClientRectConfig,
  getClientRects?: unit => GetClientRectsTarget.t,
  contextElement?: Dom.element,
}
type distCollisionBoundaryConfig = {
  x: float,
  y: float,
  height: float,
  width: float,
}
module AnchorTarget = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
module Anchor = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external fromFn: (unit => AnchorTarget.t) => t = "%identity"
}
module Boundary = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromClippingAncestors: [#"clipping-ancestors"] => t = "%identity"
  let clippingAncestors: t = fromClippingAncestors(#"clipping-ancestors")
  external fromElements: array<Dom.element> => t = "%identity"
  external fromDistCollisionBoundaryConfig: distCollisionBoundaryConfig => t = "%identity"
}
