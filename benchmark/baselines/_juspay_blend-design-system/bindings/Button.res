type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameDisabledOnClickStyle,
  buttonType?: ButtonTypes.buttonType,
  size?: ButtonTypes.buttonSize,
  subType?: ButtonTypes.buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: ButtonTypes.buttonGroupPosition,
  fullWidth?: bool,
  width?: CommonTypes.stringOrNumber,
  justifyContent?: string,
  state?: ButtonTypes.buttonState,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Button"
