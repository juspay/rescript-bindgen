type props = {
  toggleFocus?: CommonTypes.refUnionViewsToggleFocus,
  finalFocus?: RefUnionViewsTypes.finalFocusTargetFinalFocus,
  container?: RefUnionViewsTypes.RefUnionViewsContainer.t,  // ⓘ was `HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>` — opaque; build with RefUnionViewsContainer.fromHTMLElement / RefUnionViewsContainer.fromShadowRoot / RefUnionViewsContainer.fromRefObject
  locale?: CommonTypes.stringOrStringArray,
}

@module("demo")
external make: React.component<props> = "Focusable"
