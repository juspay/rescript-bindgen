type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameOnSelectSlotStyle,
  ...HighchartsSharedTypes.singleSelectV2Props,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2"
