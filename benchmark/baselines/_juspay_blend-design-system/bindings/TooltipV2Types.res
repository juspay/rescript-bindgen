type tooltipV2TooltipV2TokensTypeBorderRadiusConfig = {
  sm: string,
  md: string,
  lg: string,
}
type tooltipV2TooltipV2TokensTypeTextConfig = {
  color: string,
  fontWeight: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  fontSize: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  lineHeight: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
}
type tooltipV2TokensType = {
  background: string,
  borderRadius: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  maxWidth: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  padding: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  gap: tooltipV2TooltipV2TokensTypeBorderRadiusConfig,
  text: tooltipV2TooltipV2TokensTypeTextConfig,
  zIndex: string,
}
type responsiveTooltipV2Tokens = {
  sm: tooltipV2TokensType,
  lg: tooltipV2TokensType,
}
