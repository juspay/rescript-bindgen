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
  external asClientRectObjects: t => (array<clientRectObject>) = "%identity"
  external fromDOMRectList: WebTypes.domRectList => t = "%identity"
  external asDOMRectList: t => (WebTypes.domRectList) = "%identity"
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
  external asElement: t => (Dom.element) = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
  external asElements: t => (array<Dom.element>) = "%identity"
  external fromRect: rect => t = "%identity"
  external asRect: t => (rect) = "%identity"
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
module VendorViewsAnchor = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external asElement: t => (Dom.element) = "%identity"
  external fromVirtualElement: virtualElement => t = "%identity"
  external asVirtualElement: t => (virtualElement) = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external asRefObject: t => (React.ref<Nullable.t<Dom.element>>) = "%identity"
  external fromFn: (unit => AnchorTarget.t) => t = "%identity"
  external asFn: t => (unit => AnchorTarget.t) = "%identity"
}
