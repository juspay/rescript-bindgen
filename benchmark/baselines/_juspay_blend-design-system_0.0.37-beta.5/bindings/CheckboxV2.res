type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameOnChangeSlotStyle,
  checked?: HighchartsSharedTypes.boolOrIndeterminate,
  onCheckedChange?: HighchartsSharedTypes.boolOrIndeterminate => unit,
  required?: bool,
  error?: bool,
  label?: string,
  subLabel?: string,
  size?: SelectorV2Types.selectorV2Size,
  slot?: SelectorV2Types.selectorV2SlotConfig,
  maxLength?: SelectorV2Types.selectorV2MaxLengthConfig,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CheckboxV2"
