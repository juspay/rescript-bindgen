type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  children: React.element,
  className?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Timeline"
