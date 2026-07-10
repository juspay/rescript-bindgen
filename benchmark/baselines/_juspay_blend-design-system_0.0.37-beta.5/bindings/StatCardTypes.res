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
type statCardStatCardTokenTypePaddingConfig = {
  x: string,
  y: string,
}
type statCardStatCardTokenTypeTextContainerHeaderTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type statCardStatCardTokenTypeTextContainerHeaderTitleIconConfig = {
  width: string,
}
type statCardStatCardTokenTypeTextContainerHeaderHelpIconColorConfig = {
  default: string,
  hover: string,
}
type statCardStatCardTokenTypeTextContainerHeaderHelpIconConfig = {
  width: string,
  color: statCardStatCardTokenTypeTextContainerHeaderHelpIconColorConfig,
}
type statCardStatCardTokenTypeTextContainerHeaderConfig = {
  gap: string,
  title: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
  titleIcon: statCardStatCardTokenTypeTextContainerHeaderTitleIconConfig,
  helpIcon: statCardStatCardTokenTypeTextContainerHeaderHelpIconConfig,
}
type statCardStatCardTokenTypeTextContainerStatsTitleValueConfig = {
  line: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
  progress: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
  bar: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
  number: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
}
type statCardStatCardTokenTypeTextContainerStatsTitleChangeConfig = {
  margin: string,
  arrow: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; }`
  text: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: { increase: Color; decrease: Colo`
}
type statCardStatCardTokenTypeTextContainerStatsTitleConfig = {
  gap: string,
  value: statCardStatCardTokenTypeTextContainerStatsTitleValueConfig,
  change: statCardStatCardTokenTypeTextContainerStatsTitleChangeConfig,
}
type statCardStatCardTokenTypeTextContainerStatsConfig = {
  gap: string,
  title: statCardStatCardTokenTypeTextContainerStatsTitleConfig,
  subtitle: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
}
type statCardStatCardTokenTypeTextContainerConfig = {
  gap: string,
  header: statCardStatCardTokenTypeTextContainerHeaderConfig,
  stats: statCardStatCardTokenTypeTextContainerStatsConfig,
}
type statCardStatCardTokenTypeChartColorsLineConfig = {
  increase: string,
  decrease: string,
}
type statCardStatCardTokenTypeChartColorsGradientConfig = {
  end: string,
  startOpacity: float,
  endOpacity: float,
}
type statCardStatCardTokenTypeChartColorsConfig = {
  line: statCardStatCardTokenTypeChartColorsLineConfig,
  area: statCardStatCardTokenTypeChartColorsLineConfig,
  gradient: statCardStatCardTokenTypeChartColorsGradientConfig,
}
type statCardStatCardTokenTypeChartLineActiveDotConfig = {
  width: string,
  fill: string,
}
type statCardStatCardTokenTypeChartLineConfig = {
  strokeWidth: string,
  activeDot: statCardStatCardTokenTypeChartLineActiveDotConfig,
}
type statCardStatCardTokenTypeChartBarConfig = {
  borderTopRightRadius: string,
  borderTopLeftRadius: string,
  borderBottomRightRadius: string,
  borderBottomLeftRadius: string,
  fill: statCardStatCardTokenTypeTextContainerHeaderHelpIconColorConfig,
}
type statCardStatCardTokenTypeChartProgressBarBackgroundPatternConfig = {
  color: string,
  size: string,
}
type statCardStatCardTokenTypeChartProgressBarBackgroundConfig = {
  fill: string,
  empty: string,
  pattern: statCardStatCardTokenTypeChartProgressBarBackgroundPatternConfig,
}
type statCardStatCardTokenTypeChartProgressBarConfig = {
  height: string,
  borderRadius: string,
  gap: string,
  background: statCardStatCardTokenTypeChartProgressBarBackgroundConfig,
  label: statCardStatCardTokenTypeTextContainerHeaderTitleConfig,
}
type statCardStatCardTokenTypeChartTooltipConfig = {
  backgroundColor: string,
  padding: statCardStatCardTokenTypePaddingConfig,
  borderRadius: string,
  color: string,
  fontSize: string,
  fontWeight: string,
}
type statCardStatCardTokenTypeChartConfig = {
  height: string,
  colors: statCardStatCardTokenTypeChartColorsConfig,
  line: statCardStatCardTokenTypeChartLineConfig,
  bar: statCardStatCardTokenTypeChartBarConfig,
  progressBar: statCardStatCardTokenTypeChartProgressBarConfig,
  tooltip: statCardStatCardTokenTypeChartTooltipConfig,
}
type statCardTokenType = {
  height: string,
  maxWidth: string,
  border: string,
  borderRadius: string,
  backgroundColor: string,
  boxShadow: string,
  padding: statCardStatCardTokenTypePaddingConfig,
  textContainer: statCardStatCardTokenTypeTextContainerConfig,
  chart: statCardStatCardTokenTypeChartConfig,
}
type responsiveStatCardTokens = {
  sm: statCardTokenType,
  lg: statCardTokenType,
}
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
  @as("type") type_?: HighchartsSharedTypes.axisType,
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
