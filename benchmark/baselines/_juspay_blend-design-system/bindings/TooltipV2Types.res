type tooltipV2BorderRadiusConfig = {
  sm: string,
  md: string,
  lg: string,
}
type tooltipV2TextConfig = {
  color?: string,
  fontWeight: tooltipV2BorderRadiusConfig,
  fontSize: tooltipV2BorderRadiusConfig,
  lineHeight: tooltipV2BorderRadiusConfig,
}
type tooltipV2TokensType = {
  background?: string,
  borderRadius: tooltipV2BorderRadiusConfig,
  maxWidth: tooltipV2BorderRadiusConfig,
  padding: tooltipV2BorderRadiusConfig,
  gap: tooltipV2BorderRadiusConfig,
  text: tooltipV2TextConfig,
  zIndex?: string,
}
type responsiveTooltipV2Tokens = {
  sm: tooltipV2TokensType,
  lg: tooltipV2TokensType,
}
