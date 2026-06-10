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
type borderRadiusConfig5 = {
  sm: string,
  lg: string,
}
type textConfig9 = {
  color: string,
  fontWeight: borderRadiusConfig5,
  fontSize: borderRadiusConfig5,
  lineHeight: borderRadiusConfig5,
}
type tooltipTokensType = {
  background: string,
  borderRadius: borderRadiusConfig5,
  maxWidth: borderRadiusConfig5,
  padding: borderRadiusConfig5,
  gap: borderRadiusConfig5,
  text: textConfig9,
}
type responsiveTooltipTokens = {
  sm: tooltipTokensType,
  lg: tooltipTokensType,
}
