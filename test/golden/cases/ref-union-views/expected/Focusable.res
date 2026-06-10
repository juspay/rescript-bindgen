@module("demo") @react.component
external make: (
  ~finalFocus: CommonTypes.finalFocus=?,
  ~container: RefUnionViewsTypes.Container.t=?,  // ⓘ was `HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>` — opaque; build with Container.fromHTMLElement / Container.fromShadowRoot / Container.fromRefObject
  ~locale: string=?,  // ⓘ Intl.LocalesArgument — pass a BCP-47 tag ("en-US"); Intl.Locale objects not modelled
) => React.element = "Focusable"
