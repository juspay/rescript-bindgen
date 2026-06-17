type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameDisabledOnClickStyle,
  buttonType?: ButtonSharedTypes.buttonType,
  size?: ButtonSharedTypes.buttonSize,
  subType?: ButtonSharedTypes.buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: ButtonSharedTypes.OnClick.t,  // ⓘ was overloaded `function` (2 call signatures) — opaque; view with OnClick.asEvent / OnClick.asEvent2
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  buttonGroupPosition?: ButtonSharedTypes.buttonGroupPosition,
  fullWidth?: bool,
  width?: CommonTypes.stringOrNumber,
  justifyContent?: string,
  state?: ButtonSharedTypes.buttonState,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Button"
