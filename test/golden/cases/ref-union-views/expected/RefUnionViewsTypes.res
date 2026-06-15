module FinalFocusTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external fromHTMLElement: Dom.element => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
@unboxed type finalFocusTargetFinalFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(string => FinalFocusTarget.t)
module Container = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external fromShadowRoot: Dom.shadowRoot => t = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
}
