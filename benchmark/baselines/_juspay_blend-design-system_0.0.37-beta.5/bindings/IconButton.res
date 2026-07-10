type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitAriaLabelClassNameStyle,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  width?: CommonTypes.stringOrNumber,
  size?: ButtonV2Types.buttonV2Size,
  icon: React.element,
  @as("aria-label") ariaLabel: string,
  skeleton?: ButtonV2Types.buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  buttonType?: ButtonV2Types.buttonV2Type,
  loading?: bool,
  state?: ButtonV2Types.buttonV2State,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "IconButton"
