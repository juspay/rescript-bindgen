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
type borderRadiusConfig6 = {
  sm: string,
  lg: string,
}
type textConfig9 = {
  color: string,
  fontWeight: borderRadiusConfig6,
  fontSize: borderRadiusConfig6,
  lineHeight: borderRadiusConfig6,
}
type tooltipTokensType = {
  background: string,
  borderRadius: borderRadiusConfig6,
  maxWidth: borderRadiusConfig6,
  padding: borderRadiusConfig6,
  gap: borderRadiusConfig6,
  text: textConfig9,
}
type responsiveTooltipTokens = {
  sm: tooltipTokensType,
  lg: tooltipTokensType,
}
