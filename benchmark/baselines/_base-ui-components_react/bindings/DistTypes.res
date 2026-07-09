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
  external asDistVirtualElementGetBoundingClientRectConfigs: t => (array<distVirtualElementGetBoundingClientRectConfig>) = "%identity"
  external fromDOMRectList: WebTypes.domRectList => t = "%identity"
  external asDOMRectList: t => (WebTypes.domRectList) = "%identity"
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
  external asElement: t => (Dom.element) = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external asVirtualElement: t => (virtualElement) = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
module PositionerAnchor = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external asElement: t => (Dom.element) = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external asRefObject: t => (React.ref<Nullable.t<Dom.element>>) = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external asVirtualElement: t => (virtualElement) = "%identity"
  external fromFn: (unit => AnchorTarget.t) => t = "%identity"
  external asFn: t => (unit => AnchorTarget.t) = "%identity"
}
module Boundary = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external asElement: t => (Dom.element) = "%identity"
  external fromClippingAncestors: [#"clipping-ancestors"] => t = "%identity"
  let clippingAncestors: t = fromClippingAncestors(#"clipping-ancestors")
  external fromElements: array<Dom.element> => t = "%identity"
  external asElements: t => (array<Dom.element>) = "%identity"
  external fromDistCollisionBoundaryConfig: distCollisionBoundaryConfig => t = "%identity"
  external asDistCollisionBoundaryConfig: t => (distCollisionBoundaryConfig) = "%identity"
}
