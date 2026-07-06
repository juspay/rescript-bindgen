type modalModalTokensTypeOverlayConfig = {
  backgroundColor: string,
}
type modalModalTokensTypeHeaderPaddingConfig = {
  x: string,
  y: string,
}
type modalModalTokensTypeHeaderTextTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type modalModalTokensTypeHeaderTextConfig = {
  title: modalModalTokensTypeHeaderTextTitleConfig,
  subtitle: modalModalTokensTypeHeaderTextTitleConfig,
}
type modalModalTokensTypeHeaderConfig = {
  padding: modalModalTokensTypeHeaderPaddingConfig,
  borderBottom: string,
  backgroundColor: string,
  text: modalModalTokensTypeHeaderTextConfig,
}
type modalModalTokensTypeBodyConfig = {
  padding: string,
  backgroundColor: string,
}
type modalModalTokensTypeFooterConfig = {
  padding: string,
  borderTop: string,
  backgroundColor: string,
  gap: string,
}
type modalModalTokensTypeCloseButtonConfig = {
  color: string,
}
type modalTokensType = {
  boxShadow: string,
  borderRadius: string,
  overlay: modalModalTokensTypeOverlayConfig,
  header: modalModalTokensTypeHeaderConfig,
  body: modalModalTokensTypeBodyConfig,
  footer: modalModalTokensTypeFooterConfig,
  closeButton: modalModalTokensTypeCloseButtonConfig,
}
type responsiveModalTokens = {
  sm: modalTokensType,
  lg: modalTokensType,
}
type modalButtonAction = {
  width?: CommonTypes.stringOrNumber,
  text?: string,
  disabled?: bool,
  justifyContent?: string,
  size?: ButtonTypes.buttonSize,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  buttonType?: ButtonTypes.buttonType,
  subType?: ButtonTypes.buttonSubType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  fullWidth?: bool,
  state?: ButtonTypes.buttonState,
}
type bodySkeletonProps = {
  show?: bool,
  width?: string,
  height?: string,
}
type modalSkeletonProps = {
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonProps,
}
