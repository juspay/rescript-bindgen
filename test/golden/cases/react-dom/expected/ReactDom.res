type props = {
  children?: React.element,
  icon?: React.element,
  filterComponent?: React.component<ReactDomTypes.filterProps>,
  container?: Dom.element,
  node?: Dom.node,
  divRef?: Dom.htmlDivElement,
  inputRef?: React.ref<Nullable.t<Dom.element>>,
  boundary?: Dom.element,  // ⓘ was `Element | DocumentFragment` — bound to Dom.element; a DocumentFragment/ShadowRoot target is not supported
}

@module("demo")
external make: React.component<props> = "ReactDom"
