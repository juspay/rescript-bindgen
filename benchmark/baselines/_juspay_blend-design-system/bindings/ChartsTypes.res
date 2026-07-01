type chartType =
  | @as("line") Line
  | @as("bar") Bar
  | @as("lineBar") LineBar
  | @as("pie") Pie
  | @as("scatter") Scatter
  | @as("area") Area
  | @as("sankey") Sankey
type axisType =
  | @as("dateTime") DateTime
  | @as("currency") Currency
  | @as("percentage") Percentage
  | @as("number") Number
type chartLegendPosition =
  | @as("top") Top
  | @as("right") Right
type legendsChangeType =
  | @as("increase") Increase
  | @as("decrease") Decrease
type chartsDataPointPrimaryConfig = {
  label: string,
  val: float,
}
type chartsDataPointAuxConfig = {
  label: string,
  val: float,
  @as("type") type_?: axisType,
  dateOnly?: bool,
  smart?: bool,
  timeZone?: string,
  hour12?: bool,
}
type chartsDataPointErrorErrorDataConfig = {
  label: string,
  value: string,
}
type chartsDataPointErrorConfig = {
  title: string,
  errorData?: array<chartsDataPointErrorErrorDataConfig>,
}
type dataPoint = {
  primary: chartsDataPointPrimaryConfig,
  aux?: array<chartsDataPointAuxConfig>,
  error?: chartsDataPointErrorConfig,
}
type newNestedDataPoint = {
  name: string,
  data: Dict.t<dataPoint>,
}
type chartsColorsConfig = {
  key: string,
  color: string,
}
type stackedLegendsDataPoint = {
  value: float,
  delta: float,
  changeType: legendsChangeType,
}
type chartsTickPropsPayloadConfig = {
  value: CommonTypes.stringOrNumber,
  index?: int,
  coordinate?: float,
}
type tickProps = {
  x?: float,
  y?: float,
  payload?: chartsTickPropsPayloadConfig,
}
type axisConfig = {
  label?: string,
  showLabel?: bool,
  interval?: CommonTypes.preserveStartOrPreserveEndOrPreserveStartEndOrNumber,
  show?: bool,
  @as("type") type_?: axisType,
  tickFormatter?: CommonTypes.stringOrNumber => string,
  customTick?: React.component<tickProps>,
  dateOnly?: bool,
  useUTC?: bool,
  formatString?: string,
  timeOnly?: bool,
  showYear?: bool,
  ticks?: array<CommonTypes.stringOrNumber>,
  autoConsistentTicks?: bool,
  maxTicks?: float,
  smartDateTimeFormat?: bool,
}
type chartsTooltipConfigPositionConfig = {
  x?: float,
  y?: float,
}
type chartsTooltipConfigAllowEscapeViewBoxConfig = {
  x?: bool,
  y?: bool,
}
type tooltipConfig = {
  position?: chartsTooltipConfigPositionConfig,
  allowEscapeViewBox?: chartsTooltipConfigAllowEscapeViewBoxConfig,
}
type noDataProps = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonTypes.buttonProps,
}
type chartsSkeletonProps = {
  show: bool,
  variant: SkeletonTypes.skeletonVariant,
}
type chartsLegendsConfig = {
  title: string,
  total?: string,
}
type chartsDotItemDotPropsPayloadConfig = {
  name?: string,
}
type dotItemDotProps = {
  cx?: float,
  cy?: float,
  value?: float,
  payload?: chartsDotItemDotPropsPayloadConfig,
}
type chartsPayloadConfig = {
  name: string,
  id?: string,
  color?: string,
  value?: float,
}
type chartsSankeyTooltipDataPayloadConfig = {
  name?: string,
  value?: float,
  source?: CommonTypes.stringOrNumber,
  target?: CommonTypes.stringOrNumber,
  sourceName?: string,
  targetName?: string,
  color?: string,
  hoverColor?: string,
}
type sankeyTooltipData = {
  payload: chartsSankeyTooltipDataPayloadConfig,
}
type sankeyLink = {
  source: CommonTypes.stringOrNumber,
  target: CommonTypes.stringOrNumber,
  value: float,
  color?: string,
  hoverColor?: string,
}
type chartsChartTokensTypeHeaderPaddingConfig = {
  x: string,
  y: string,
}
type chartsChartTokensTypeHeaderSlotsConfig = {
  gap: string,
}
type chartsChartTokensTypeHeaderConfig = {
  padding: chartsChartTokensTypeHeaderPaddingConfig,
  backgroundColor: string,
  borderBottom: string,
  borderRadius: string,
  slots: chartsChartTokensTypeHeaderSlotsConfig,
}
type chartsChartTokensTypeContentLegendDropdownConfig = {
  maxHeight: string,
}
type chartsChartTokensTypeContentLegendItemColorConfig = {
  default: string,
  hover: string,
  active: string,
  total: string,
}
type chartsChartTokensTypeContentLegendItemConfig = {
  gap: string,
  color: chartsChartTokensTypeContentLegendItemColorConfig,
  fontSize: string,
  fontWeight: string,
}
type chartsChartTokensTypeContentLegendConfig = {
  gap: string,
  dropdown: chartsChartTokensTypeContentLegendDropdownConfig,
  item: chartsChartTokensTypeContentLegendItemConfig,
}
type chartsChartTokensTypeContentPaddingConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type chartsChartTokensTypeContentConfig = {
  legend: chartsChartTokensTypeContentLegendConfig,
  padding: chartsChartTokensTypeContentPaddingConfig,
  gap: string,
  backgroundColor: string,
}
type chartTokensType = {
  border: string,
  borderRadius: string,
  header: chartsChartTokensTypeHeaderConfig,
  content: chartsChartTokensTypeContentConfig,
}
type responsiveChartTokens = {
  sm: chartTokensType,
  lg: chartTokensType,
}
@unboxed type stringOrChartsColorsConfig = Str(string) | ChartsColorsConfig(chartsColorsConfig)
