type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle,
  ...ButtonV2Types.buttonBaseProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ButtonV2"
