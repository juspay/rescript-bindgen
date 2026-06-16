type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameDisabledOnClickStyle,
  buttonType?: ButtonTypes.buttonType,
  size?: ButtonTypes.buttonSize,
  subType?: ButtonTypes.buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: ButtonTypes.OnClick.t,  // ⓘ was overloaded `function` (2 call signatures) — opaque; view with OnClick.asEvent / OnClick.asEvent2
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
