type rect = {
  x: float,
  y: float,
  width: float,
  height: float,
}
type clientRectObject = {
  x: float,
  y: float,
  width: float,
  height: float,
  top: float,
  right: float,
  bottom: float,
  left: float,
}
module GetClientRectsTarget = {
  type t
  external fromClientRectObjects: array<clientRectObject> => t = "%identity"
  external fromDOMRectList: WebTypes.domRectList => t = "%identity"
}
type virtualElement = {
  getBoundingClientRect: unit => clientRectObject,
  getClientRects?: unit => GetClientRectsTarget.t,
  contextElement?: Dom.element,
}
module Boundary = {
  type t
  external fromClippingAncestors: [#"clipping-ancestors"] => t = "%identity"
  let clippingAncestors: t = fromClippingAncestors(#"clipping-ancestors")
  external fromElement: Dom.element => t = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
  external fromRect: rect => t = "%identity"
}
module AnchorTarget = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
module VendorViewsAnchor = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external fromFn: (unit => AnchorTarget.t) => t = "%identity"
}
