type props = {
  ...HtmlAttrs.htmlAttributes,
  rootRef?: React.ref<Nullable.t<Dom.element>>,
}

@module("react-day-picker")
external make: React.component<props> = "Root"
