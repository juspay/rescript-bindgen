type badgeSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type badgeColor =
  | @as("alert") Alert
  | @as("neutral") Neutral
  | @as("warning") Warning
  | @as("primary") Primary
  | @as("success") Success
type badgePosition =
  | @as("top-right") TopRight
  | @as("top-left") TopLeft
  | @as("bottom-right") BottomRight
  | @as("bottom-left") BottomLeft
type badgeResponsiveBadgeTokensSmDotWidthConfig = {
  sm: string,
  md: string,
  lg: string,
}
type badgeResponsiveBadgeTokensSmDotConfig = {
  width: badgeResponsiveBadgeTokensSmDotWidthConfig,
  height: badgeResponsiveBadgeTokensSmDotWidthConfig,
  borderRadius: string,
}
type badgeResponsiveBadgeTokensSmPillConfig = {
  minWidth: badgeResponsiveBadgeTokensSmDotWidthConfig,
  height: badgeResponsiveBadgeTokensSmDotWidthConfig,
  paddingLeft: badgeResponsiveBadgeTokensSmDotWidthConfig,
  paddingRight: badgeResponsiveBadgeTokensSmDotWidthConfig,
  borderRadius: badgeResponsiveBadgeTokensSmDotWidthConfig,
}
type badgeResponsiveBadgeTokensSmBackgroundColorConfig = {
  alert: string,
  neutral: string,
  warning: string,
  primary: string,
  success: string,
}
type badgeResponsiveBadgeTokensSmTextConfig = {
  color: string,
  fontSize: badgeResponsiveBadgeTokensSmDotWidthConfig,
  fontWeight: string,
  lineHeight: badgeResponsiveBadgeTokensSmDotWidthConfig,
}
type badgeResponsiveBadgeTokensSmPositionConfig = {
  offset: badgeResponsiveBadgeTokensSmDotWidthConfig,
}
type badgeResponsiveBadgeTokensSmConfig = {
  dot: badgeResponsiveBadgeTokensSmDotConfig,
  pill: badgeResponsiveBadgeTokensSmPillConfig,
  backgroundColor: badgeResponsiveBadgeTokensSmBackgroundColorConfig,
  text: badgeResponsiveBadgeTokensSmTextConfig,
  position: badgeResponsiveBadgeTokensSmPositionConfig,
}
type responsiveBadgeTokens = {
  sm: badgeResponsiveBadgeTokensSmConfig,
  lg: badgeResponsiveBadgeTokensSmConfig,
}
