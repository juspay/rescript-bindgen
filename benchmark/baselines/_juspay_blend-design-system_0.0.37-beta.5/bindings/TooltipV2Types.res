type tooltipV2Side =
  | @as("top") Top
  | @as("right") Right
  | @as("left") Left
  | @as("bottom") Bottom
type tooltipV2Align =
  | @as("start") Start
  | @as("end") End
  | @as("center") Center
type tooltipV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type tooltipV2SlotDirection =
  | @as("left") Left
  | @as("right") Right
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
type tooltipV2Props = {
  children: React.element,
  content: React.element,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  side?: tooltipV2Side,
  align?: tooltipV2Align,
  showArrow?: bool,
  size?: tooltipV2Size,
  slot?: React.element,
  slotDirection?: tooltipV2SlotDirection,
  delayDuration?: float,
  offset?: float,
  maxWidth?: string,
  fullWidth?: bool,
  disableInteractive?: bool,
}
