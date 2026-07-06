type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameOnChangeSlotStyle,
  keyString: string,
  size?: KeyValuePairV2Types.keyValuePairV2Size,
  value?: string,
  slots?: KeyValuePairV2Types.keyValuePairV2SlotsConfig,
  keyValuePairState?: KeyValuePairV2Types.keyValuePairV2StateType,
  maxWidth?: string,
  textOverflow?: KeyValuePairV2Types.keyValuePairV2TextOverflowMode,
  maxLines?: float,
  showTooltipOnTruncate?: bool,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "KeyValuePairV2"
