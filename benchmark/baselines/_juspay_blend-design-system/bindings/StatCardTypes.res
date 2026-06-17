type changeType =
  | @as("increase") Increase
  | @as("decrease") Decrease
type statCardArrowDirection =
  | @as("up") Up
  | @as("down") Down
type statCardVariant =
  | @as("line") Line
  | @as("progress") Progress
  | @as("bar") Bar
  | @as("number") Number
type statCardDirection =
  | @as("vertical") Vertical
  | @as("horizontal") Horizontal
type statCardChange = {
  value?: Nullable.t<float>,
  valueType: changeType,
  arrowDirection?: statCardArrowDirection,
  tooltip?: React.element,
}
type chartDataPoint = {
  value: float,
  name: string,
}
type statCardAxisConfig = {
  @as("type") type_?: ChartsTypes.axisType,
  tickFormatter?: CommonTypes.stringOrNumber => string,
  dateOnly?: bool,
  useUTC?: bool,
  formatString?: string,
  timeOnly?: bool,
  showYear?: bool,
  smartDateTimeFormat?: bool,
}
type statCardSkeletonProps = {
  variant: SkeletonTypes.skeletonVariant,
  show: bool,
  height?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  minWidth?: CommonTypes.stringOrNumber,
}
type statCardPaddingConfig = {
  x: string,
  y: string,
}
type statCardTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type statCardTitleIconConfig = {
  width: string,
}
type statCardColorConfig = {
  default: string,
  hover: string,
}
type statCardHelpIconConfig = {
  width: string,
  color: statCardColorConfig,
}
type statCardHeaderConfig = {
  gap: string,
  title: statCardTitleConfig,
  titleIcon: statCardTitleIconConfig,
  helpIcon: statCardHelpIconConfig,
}
type statCardValueConfig = {
  line: statCardTitleConfig,
  progress: statCardTitleConfig,
  bar: statCardTitleConfig,
  number: statCardTitleConfig,
}
type statCardChangeConfig = {
  margin: string,
  arrow: string,
  text: string,
}
type statCardTitleConfig2 = {
  gap: string,
  value: statCardValueConfig,
  change: statCardChangeConfig,
}
type statCardStatsConfig = {
  gap: string,
  title: statCardTitleConfig2,
  subtitle: statCardTitleConfig,
}
type statCardTextContainerConfig = {
  gap: string,
  header: statCardHeaderConfig,
  stats: statCardStatsConfig,
}
type statCardLineConfig = {
  increase: string,
  decrease: string,
}
type statCardGradientConfig = {
  end: string,
  startOpacity: float,
  endOpacity: float,
}
type statCardColorsConfig = {
  line: statCardLineConfig,
  area: statCardLineConfig,
  gradient: statCardGradientConfig,
}
type statCardActiveDotConfig = {
  width: string,
  fill: string,
}
type statCardLineConfig2 = {
  strokeWidth: string,
  activeDot: statCardActiveDotConfig,
}
type statCardFillConfig = {
  default: string,
  hover: string,
}
type statCardBarConfig = {
  borderTopRightRadius: string,
  borderTopLeftRadius: string,
  borderBottomRightRadius: string,
  borderBottomLeftRadius: string,
  fill: statCardFillConfig,
}
type statCardPatternConfig = {
  color: string,
  size: string,
}
type statCardBackgroundConfig = {
  fill: string,
  empty: string,
  pattern: statCardPatternConfig,
}
type statCardProgressBarConfig = {
  height: string,
  borderRadius: string,
  gap: string,
  background: statCardBackgroundConfig,
  label: statCardTitleConfig,
}
type statCardTooltipConfig = {
  backgroundColor: string,
  padding: statCardPaddingConfig,
  borderRadius: string,
  color: string,
  fontSize: string,
  fontWeight: string,
}
type statCardChartConfig = {
  height: string,
  colors: statCardColorsConfig,
  line: statCardLineConfig2,
  bar: statCardBarConfig,
  progressBar: statCardProgressBarConfig,
  tooltip: statCardTooltipConfig,
}
type statCardTokenType = {
  height: string,
  maxWidth: string,
  border: string,
  borderRadius: string,
  backgroundColor: string,
  boxShadow: string,
  padding: statCardPaddingConfig,
  textContainer: statCardTextContainerConfig,
  chart: statCardChartConfig,
}
type responsiveStatCardTokens = {
  sm: statCardTokenType,
  lg: statCardTokenType,
}
