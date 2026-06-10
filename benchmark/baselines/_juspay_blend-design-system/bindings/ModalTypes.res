type modalButtonAction = {
  ...JsxDOM.domProps,
  justifyContent?: string,
  text?: string,
  buttonType?: ButtonSkeletonTypes.buttonType,
  subType?: ButtonSkeletonTypes.buttonSubType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  showSkeleton?: bool,
  skeletonVariant?: ButtonSkeletonTypes.skeletonVariant,
  fullWidth?: bool,
  state?: ButtonSkeletonTypes.buttonState,
}
type bodySkeletonProps = {
  show?: bool,
  width?: string,
  height?: string,
}
type modalSkeletonProps = {
  show?: bool,
  variant?: ButtonSkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonProps,
}
type paddingConfig5 = {
  x: string,
  y: string,
}
type titleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type textConfig8 = {
  title: titleConfig,
  subtitle: titleConfig,
}
type headerConfig = {
  padding: paddingConfig5,
  borderBottom: string,
  backgroundColor: string,
  text: textConfig8,
}
type bodyConfig2 = {
  padding: string,
  backgroundColor: string,
}
type footerConfig = {
  padding: string,
  borderTop: string,
  backgroundColor: string,
  gap: string,
}
type modalTokensType = {
  boxShadow: string,
  borderRadius: string,
  header: headerConfig,
  body: bodyConfig2,
  footer: footerConfig,
  closeButton: AvatarGroupTypes.textConfig7,
}
type responsiveModalTokens = {
  sm: modalTokensType,
  lg: modalTokensType,
}
