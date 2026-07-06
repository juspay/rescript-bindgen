@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element=?,
  ~container: Dom.element=?,  // ⓘ was `Element | DocumentFragment` — bound to Dom.element; a DocumentFragment/ShadowRoot target is not supported
  ~forceMount: bool=?,
) => React.element = "DrawerPortal"
