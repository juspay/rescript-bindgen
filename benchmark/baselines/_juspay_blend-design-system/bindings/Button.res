type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameDisabledOnClickStyle,
  buttonType?: ButtonSkeletonTypes.buttonType,
  size?: ButtonSkeletonTypes.buttonSize,
  subType?: ButtonSkeletonTypes.buttonSubType,
  text?: string,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: bool,
  onClick?: ButtonSkeletonTypes.OnClick.t,  // ⓘ was overloaded `function` (2 call signatures) — opaque; view with OnClick.asEvent / OnClick.asEvent2
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: ButtonSkeletonTypes.skeletonVariant,
  buttonGroupPosition?: ButtonSkeletonTypes.buttonGroupPosition,
  fullWidth?: bool,
  width?: CommonTypes.stringOrNumber,
  justifyContent?: string,
  state?: ButtonSkeletonTypes.buttonState,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Button"
