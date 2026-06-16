type borderRadiusConfig15 = {
  sm: string,
  md: string,
  lg: string,
}
type textConfig30 = {
  color: string,
  fontWeight: borderRadiusConfig15,
  fontSize: borderRadiusConfig15,
  lineHeight: borderRadiusConfig15,
}
type tooltipV2TokensType = {
  background: string,
  borderRadius: borderRadiusConfig15,
  maxWidth: borderRadiusConfig15,
  padding: borderRadiusConfig15,
  gap: borderRadiusConfig15,
  text: textConfig30,
  zIndex: string,
}
type responsiveTooltipV2Tokens = {
  sm: tooltipV2TokensType,
  lg: tooltipV2TokensType,
}
