type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameOnSelectSlotStyle,
  ...ContextSharedTypes.singleSelectV2Props,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MobileSingleSelectV2"
