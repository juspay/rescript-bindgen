@module("demo") @react.component
external make: (
  ~toggleFocus: CommonTypes.toggleFocus=?,
  // ⚠️ REVIEW: `finalFocus` is `boolean | RefObject<HTMLElement> | ((closeType: string) => boolean | void | HTMLElement)` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~finalFocus: string=?,
  ~container: RefUnionViewsTypes.Container.t=?,  // ⓘ was `HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>` — opaque; build with Container.fromHTMLElement / Container.fromShadowRoot / Container.fromRefObject
  ~locale: CommonTypes.stringOrStringArray=?,
) => React.element = "Focusable"
