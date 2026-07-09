module FinalFocusTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external asBool: t => (bool) = "%identity"
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
@unboxed type finalFocusTargetFinalFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(string => FinalFocusTarget.t)
module RefUnionViewsContainer = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromShadowRoot: Dom.shadowRoot => t = "%identity"
  external asShadowRoot: t => (Dom.shadowRoot) = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external asRefObject: t => (React.ref<Nullable.t<Dom.element>>) = "%identity"
}
