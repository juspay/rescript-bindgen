type modalButtonAction = {
  disabled?: bool,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  justifyContent?: string,
  width?: CommonTypes.stringOrNumber,
  size?: ButtonTypes.buttonSize,
  text?: string,
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
type modalPaddingConfig = {
  x: string,
  y: string,
}
type modalTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type modalTextConfig = {
  title: modalTitleConfig,
  subtitle: modalTitleConfig,
}
type modalHeaderConfig = {
  padding: modalPaddingConfig,
  borderBottom: string,
  backgroundColor: string,
  text: modalTextConfig,
}
type modalBodyConfig = {
  padding: string,
  backgroundColor: string,
}
type modalFooterConfig = {
  padding: string,
  borderTop: string,
  backgroundColor: string,
  gap: string,
}
type modalCloseButtonConfig = {
  color: string,
}
type modalTokensType = {
  boxShadow: string,
  borderRadius: string,
  header: modalHeaderConfig,
  body: modalBodyConfig,
  footer: modalFooterConfig,
  closeButton: modalCloseButtonConfig,
}
type responsiveModalTokens = {
  sm: modalTokensType,
  lg: modalTokensType,
}
