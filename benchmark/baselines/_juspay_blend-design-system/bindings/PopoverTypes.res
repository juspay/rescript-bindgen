type side =
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("top") Top
type align =
  | @as("center") Center
  | @as("end") End
  | @as("start") Start
type popoverSize =
  | @as("small") Small
  | @as("medium") Medium
type shadow =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("xs") Xs
  | @as("md") Md
  | @as("xl") Xl
  | @as("2xl") V2xl
  | @as("full") Full
type popoverActionType = {
  ...JsxDOM.domProps,
  justifyContent?: string,
  text?: string,
  buttonType?: ButtonSkeletonTypes.buttonType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  showSkeleton?: bool,
  skeletonVariant?: ButtonSkeletonTypes.skeletonVariant,
  fullWidth?: bool,
  state?: ButtonSkeletonTypes.buttonState,
}
type bodySkeletonProps2 = {
  show?: bool,
  width?: string,
  height?: CommonTypes.stringOrNumber,
}
type popoverSkeletonProps = {
  show?: bool,
  variant?: ButtonSkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonProps2,
}
type gapConfig2 = {
  small: string,
  medium: string,
}
type paddingConfig6 = {
  left: gapConfig2,
  right: gapConfig2,
  top: gapConfig2,
  bottom: gapConfig2,
}
type headingConfig3 = {
  color: string,
  fontSize: gapConfig2,
  fontWeight: gapConfig2,
  lineHeight: gapConfig2,
}
type headerContainerConfig = {
  heading: headingConfig3,
  description: headingConfig3,
}
type footerConfig2 = {
  gap: gapConfig2,
}
type popoverTokenType = {
  background: string,
  border: string,
  shadow: TokensTypes.shadowsConfig,
  gap: gapConfig2,
  zIndex: string,
  borderRadius: gapConfig2,
  padding: paddingConfig6,
  headerContainer: headerContainerConfig,
  footer: footerConfig2,
}
type responsivePopoverTokens = {
  sm: popoverTokenType,
  lg: popoverTokenType,
}
