module PortalContainer = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromShadowRoot: Dom.shadowRoot => t = "%identity"
  external asShadowRoot: t => (Dom.shadowRoot) = "%identity"
  external fromRefObject: React.ref<Nullable.t<Dom.element>> => t = "%identity"
  external asRefObject: t => (React.ref<Nullable.t<Dom.element>>) = "%identity"
}
