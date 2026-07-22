type props = {
  children?: React.element,
  container?: Dom.element,  // ⓘ was `Element | DocumentFragment` — bound to Dom.element; a DocumentFragment/ShadowRoot target is not supported
  forceMount?: bool,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerV2Portal"
