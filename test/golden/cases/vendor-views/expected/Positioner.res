@module("demo") @react.component
external make: (
  ~collisionBoundary: StubTypes.Boundary.t=?,  // ⓘ was `Boundary` — opaque; build with Boundary.clippingAncestors / Boundary.fromElement / Boundary.fromElements / Boundary.fromRect
  ~anchor: StubTypes.VendorViewsAnchor.t=?,  // ⓘ was `Element | VirtualElement | RefObject<Element> | (() => Element | VirtualElement)` — opaque; build with VendorViewsAnchor.fromElement / VendorViewsAnchor.fromVirtualElement / VendorViewsAnchor.fromRefObject / VendorViewsAnchor.fromFn
  ~finalFocus: VendorViewsTypes.vendorViewsFinalFocus=?,
  ~tainted: string=?,  // ⚪ loose — was `Tainted`
) => React.element = "Positioner"
