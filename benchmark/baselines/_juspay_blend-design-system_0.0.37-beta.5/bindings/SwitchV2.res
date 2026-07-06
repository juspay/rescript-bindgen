type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameSlotStyle,
  checked?: bool,
  onCheckedChange?: bool => unit,
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
external make: React.component<props> = "SwitchV2"
