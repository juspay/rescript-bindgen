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
  value: float,
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
type paddingConfig11 = {
  x: string,
  y: string,
}
type titleConfig3 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type titleIconConfig = {
  width: string,
}
type colorConfig8 = {
  default: string,
  hover: string,
}
type helpIconConfig = {
  width: string,
  color: colorConfig8,
}
type headerConfig6 = {
  gap: string,
  title: titleConfig3,
  titleIcon: titleIconConfig,
  helpIcon: helpIconConfig,
}
type valueConfig = {
  line: titleConfig3,
  progress: titleConfig3,
  bar: titleConfig3,
  number: titleConfig3,
}
type changeConfig = {
  margin: string,
  arrow: string,
  text: string,
}
type titleConfig4 = {
  gap: string,
  value: valueConfig,
  change: changeConfig,
}
type statsConfig = {
  gap: string,
  title: titleConfig4,
  subtitle: titleConfig3,
}
type textContainerConfig2 = {
  gap: string,
  header: headerConfig6,
  stats: statsConfig,
}
type lineConfig = {
  increase: string,
  decrease: string,
}
type gradientConfig = {
  end: string,
  startOpacity: float,
  endOpacity: float,
}
type colorsConfig2 = {
  line: lineConfig,
  area: lineConfig,
  gradient: gradientConfig,
}
type activeDotConfig = {
  width: string,
  fill: string,
}
type lineConfig2 = {
  strokeWidth: string,
  activeDot: activeDotConfig,
}
type fillConfig = {
  default: string,
  hover: string,
}
type barConfig = {
  borderTopRightRadius: string,
  borderTopLeftRadius: string,
  borderBottomRightRadius: string,
  borderBottomLeftRadius: string,
  fill: fillConfig,
}
type patternConfig = {
  color: string,
  size: string,
}
type backgroundConfig3 = {
  fill: string,
  empty: string,
  pattern: patternConfig,
}
type progressBarConfig = {
  height: string,
  borderRadius: string,
  gap: string,
  background: backgroundConfig3,
  label: titleConfig3,
}
type tooltipConfig2 = {
  backgroundColor: string,
  padding: paddingConfig11,
  borderRadius: string,
  color: string,
  fontSize: string,
  fontWeight: string,
}
type chartConfig = {
  height: string,
  colors: colorsConfig2,
  line: lineConfig2,
  bar: barConfig,
  progressBar: progressBarConfig,
  tooltip: tooltipConfig2,
}
type statCardTokenType = {
  height: string,
  maxWidth: string,
  border: string,
  borderRadius: string,
  backgroundColor: string,
  boxShadow: string,
  padding: paddingConfig11,
  textContainer: textContainerConfig2,
  chart: chartConfig,
}
type responsiveStatCardTokens = {
  sm: statCardTokenType,
  lg: statCardTokenType,
}
