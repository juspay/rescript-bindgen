@module("demo") @react.component
external make: (
  ~toggleFocus: CommonTypes.toggleFocus=?,
  ~finalFocus: RefUnionViewsTypes.finalFocusTargetFinalFocus=?,
  ~container: RefUnionViewsTypes.Container.t=?,  // ⓘ was `HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>` — opaque; build with Container.fromHTMLElement / Container.fromShadowRoot / Container.fromRefObject
  ~locale: CommonTypes.stringOrStringArray=?,
) => React.element = "Focusable"
