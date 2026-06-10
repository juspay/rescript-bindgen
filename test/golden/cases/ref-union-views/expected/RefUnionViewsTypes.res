module Container = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external fromShadowRoot: Dom.shadowRoot => t = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
}
