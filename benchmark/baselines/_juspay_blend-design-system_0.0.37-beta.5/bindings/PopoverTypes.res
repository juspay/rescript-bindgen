type popoverSize =
  | @as("small") Small
  | @as("medium") Medium
type popoverShadow =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("xs") Xs
  | @as("md") Md
  | @as("xl") Xl
  | @as("2xl") V2xl
  | @as("full") Full
type popoverPopoverTokenTypeGapConfig = {
  small: string,
  medium: string,
}
type popoverPopoverTokenTypePaddingConfig = {
  left: popoverPopoverTokenTypeGapConfig,
  right: popoverPopoverTokenTypeGapConfig,
  top: popoverPopoverTokenTypeGapConfig,
  bottom: popoverPopoverTokenTypeGapConfig,
}
type popoverPopoverTokenTypeHeaderContainerHeadingConfig = {
  color: string,
  fontSize: popoverPopoverTokenTypeGapConfig,
  fontWeight: popoverPopoverTokenTypeGapConfig,
  lineHeight: popoverPopoverTokenTypeGapConfig,
}
type popoverPopoverTokenTypeHeaderContainerConfig = {
  heading: popoverPopoverTokenTypeHeaderContainerHeadingConfig,
  description: popoverPopoverTokenTypeHeaderContainerHeadingConfig,
}
type popoverPopoverTokenTypeFooterConfig = {
  gap: popoverPopoverTokenTypeGapConfig,
}
type popoverTokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.tokensPopoverTokenTypeShadowConfig,
  gap: popoverPopoverTokenTypeGapConfig,
  zIndex: string,
  borderRadius: popoverPopoverTokenTypeGapConfig,
  padding: popoverPopoverTokenTypePaddingConfig,
  headerContainer: popoverPopoverTokenTypeHeaderContainerConfig,
  footer: popoverPopoverTokenTypeFooterConfig,
}
type responsivePopoverTokens = {
  sm: popoverTokenType,
  lg: popoverTokenType,
}
type popoverActionType = {
  width?: HighchartsSharedTypes.stringOrNumber,
  text?: string,
  disabled?: bool,
  justifyContent?: string,
  size?: HighchartsSharedTypes.buttonSize,
  onClick?: option<ReactEvent.Mouse.t> => unit,
  buttonType?: HighchartsSharedTypes.buttonType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  loading?: bool,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  fullWidth?: bool,
  state?: HighchartsSharedTypes.buttonState,
}
type bodySkeletonPropsPopover = {
  show?: bool,
  width?: string,
  height?: HighchartsSharedTypes.stringOrNumber,
}
type popoverSkeletonProps = {
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonPropsPopover,
}
