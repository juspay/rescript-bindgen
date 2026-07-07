type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle,
  buttonType?: ButtonV2Types.buttonV2Type,
  size?: ButtonV2Types.buttonV2Size,
  subType?: ButtonV2Types.buttonV2SubType,
  text?: string,
  leftSlot?: ButtonV2Types.buttonSlot,
  rightSlot?: ButtonV2Types.buttonSlot,
  loading?: bool,
  skeleton?: ButtonV2Types.buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  width?: CommonTypes.stringOrNumber,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  state?: ButtonV2Types.buttonV2State,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ButtonV2"
