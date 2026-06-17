type tooltipSide =
  | @as("top") Top
  | @as("right") Right
  | @as("left") Left
  | @as("bottom") Bottom
type tooltipAlign =
  | @as("start") Start
  | @as("end") End
  | @as("center") Center
type tooltipSize =
  | @as("sm") Sm
  | @as("lg") Lg
type tooltipSlotDirection =
  | @as("left") Left
  | @as("right") Right
type tooltipBorderRadiusConfig = {
  sm: string,
  lg: string,
}
type tooltipTextConfig = {
  color: string,
  fontWeight: tooltipBorderRadiusConfig,
  fontSize: tooltipBorderRadiusConfig,
  lineHeight: tooltipBorderRadiusConfig,
}
type tooltipTokensType = {
  background: string,
  borderRadius: tooltipBorderRadiusConfig,
  maxWidth: tooltipBorderRadiusConfig,
  padding: tooltipBorderRadiusConfig,
  gap: tooltipBorderRadiusConfig,
  text: tooltipTextConfig,
}
type responsiveTooltipTokens = {
  sm: tooltipTokensType,
  lg: tooltipTokensType,
}
