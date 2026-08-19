type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitAriaLabelClassNameStyle,
  width?: CommonTypes.stringOrNumber,
  size?: ButtonV2Types.buttonV2Size,
  @as("aria-label") ariaLabel: string,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  icon: React.element,
  justifyContent?: string,
  state?: ButtonV2Types.buttonV2State,
  skeleton?: ButtonV2Types.buttonSkeleton,
  buttonGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  buttonType?: ButtonV2Types.buttonV2Type,
  loading?: bool,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "IconButton"
