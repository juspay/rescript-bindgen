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
type tooltipTooltipTokensTypeBorderRadiusConfig = {
  sm: string,
  lg: string,
}
type tooltipTooltipTokensTypeTextConfig = {
  color: string,
  fontWeight: tooltipTooltipTokensTypeBorderRadiusConfig,
  fontSize: tooltipTooltipTokensTypeBorderRadiusConfig,
  lineHeight: tooltipTooltipTokensTypeBorderRadiusConfig,
}
type tooltipTokensType = {
  background: string,
  borderRadius: tooltipTooltipTokensTypeBorderRadiusConfig,
  maxWidth: tooltipTooltipTokensTypeBorderRadiusConfig,
  padding: tooltipTooltipTokensTypeBorderRadiusConfig,
  gap: tooltipTooltipTokensTypeBorderRadiusConfig,
  text: tooltipTooltipTokensTypeTextConfig,
}
type responsiveTooltipTokens = {
  sm: tooltipTokensType,
  lg: tooltipTokensType,
}
