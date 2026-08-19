type cardV2Variant =
  | @as("outlined") Outlined
  | @as("elevated") Elevated
  | @as("ghost") Ghost
type cardV2Orientation =
  | @as("vertical") Vertical
  | @as("horizontal") Horizontal
type cardV2Padding =
  | @as("none") None
  | @as("compact") Compact
  | @as("comfortable") Comfortable
type cardV2ActionPlacement =
  | @as("body") Body
  | @as("footer") Footer
type cardV2CardV2TokensTypeBorderConfig = {
  outlined: string,
  elevated: string,
  ghost: string,
}
type cardV2CardV2TokensTypeStateHoverConfig = {
  border: string,
  boxShadow: string,
}
type cardV2CardV2TokensTypeStateFocusConfig = {
  outline: string,
  outlineOffset: string,
}
type cardV2CardV2TokensTypeStateConfig = {
  hover: cardV2CardV2TokensTypeStateHoverConfig,
  selected: cardV2CardV2TokensTypeStateHoverConfig,
  focus: cardV2CardV2TokensTypeStateFocusConfig,
}
type cardV2CardV2TokensTypePaddingNoneConfig = {
  x: string,
  y: string,
}
type cardV2CardV2TokensTypePaddingConfig = {
  none: cardV2CardV2TokensTypePaddingNoneConfig,
  compact: cardV2CardV2TokensTypePaddingNoneConfig,
  comfortable: cardV2CardV2TokensTypePaddingNoneConfig,
}
type cardV2CardV2TokensTypeLayoutMediaGapConfig = {
  vertical: string,
  horizontal: string,
}
type cardV2CardV2TokensTypeLayoutConfig = {
  gap: string,
  mediaGap: cardV2CardV2TokensTypeLayoutMediaGapConfig,
}
type cardV2CardV2TokensTypeMediaConfig = {
  width: string,
  height: string,
  minHeight: string,
  borderRadius: string,
  backgroundColor: string,
}
type cardV2CardV2TokensTypeHeaderEyebrowConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type cardV2CardV2TokensTypeHeaderConfig = {
  gap: string,
  eyebrow: cardV2CardV2TokensTypeHeaderEyebrowConfig,
  title: cardV2CardV2TokensTypeHeaderEyebrowConfig,
  subtitle: cardV2CardV2TokensTypeHeaderEyebrowConfig,
}
type cardV2CardV2TokensTypeBodyConfig = {
  gap: string,
  description: cardV2CardV2TokensTypeHeaderEyebrowConfig,
}
type cardV2CardV2TokensTypeFooterConfig = {
  gap: string,
  paddingTop: string,
  borderTop: string,
}
type cardV2CardV2TokensTypeActionsConfig = {
  gap: string,
}
type cardV2TokensType = {
  width: string,
  minWidth: string,
  maxWidth: string,
  borderRadius: string,
  border: cardV2CardV2TokensTypeBorderConfig,
  backgroundColor: cardV2CardV2TokensTypeBorderConfig,
  boxShadow: cardV2CardV2TokensTypeBorderConfig,
  state: cardV2CardV2TokensTypeStateConfig,
  padding: cardV2CardV2TokensTypePaddingConfig,
  layout: cardV2CardV2TokensTypeLayoutConfig,
  media: cardV2CardV2TokensTypeMediaConfig,
  header: cardV2CardV2TokensTypeHeaderConfig,
  body: cardV2CardV2TokensTypeBodyConfig,
  footer: cardV2CardV2TokensTypeFooterConfig,
  actions: cardV2CardV2TokensTypeActionsConfig,
}
type responsiveCardV2Tokens = {
  sm: cardV2TokensType,
  lg: cardV2TokensType,
}
type cardV2SkeletonProps = {
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
  height?: string,
  width?: string,
}
type cardV2SectionProps = {
  children?: React.element,
}
