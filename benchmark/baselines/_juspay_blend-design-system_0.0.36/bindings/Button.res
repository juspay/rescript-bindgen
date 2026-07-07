type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameDisabledOnClickStyle,
  buttonType?: HighchartsSharedTypes.buttonType,
  size?: HighchartsSharedTypes.buttonSize,
  subType?: HighchartsSharedTypes.buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: HighchartsSharedTypes.buttonButtonGroupPosition,
  fullWidth?: bool,
  width?: HighchartsSharedTypes.stringOrNumber,
  justifyContent?: string,
  state?: HighchartsSharedTypes.buttonState,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Button"
