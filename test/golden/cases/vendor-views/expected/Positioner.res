@module("demo") @react.component
external make: (
  ~collisionBoundary: StubTypes.Boundary.t=?,  // ⓘ was `Boundary` — opaque; build with Boundary.clippingAncestors / Boundary.fromElement / Boundary.fromElements / Boundary.fromRect
  ~anchor: StubTypes.Anchor.t=?,  // ⓘ was `Element | VirtualElement | RefObject<Element> | (() => Element | VirtualElement)` — opaque; build with Anchor.fromElement / Anchor.fromVirtualElement / Anchor.fromRefObject / Anchor.fromType
  ~finalFocus: VendorViewsTypes.finalFocus=?,
  ~tainted: string=?,  // ⚪ loose — was `Tainted`
) => React.element = "Positioner"
