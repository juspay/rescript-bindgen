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
type chartsPrimaryConfig = {
  label: string,
  val: float,
}
type chartsAuxConfig = {
  label: string,
  val: float,
  @as("type") type_?: axisType,
  dateOnly?: bool,
  smart?: bool,
  timeZone?: string,
  hour12?: bool,
}
type chartsErrorDataConfig = {
  label: string,
  value: string,
}
type chartsErrorConfig = {
  title: string,
  errorData?: array<chartsErrorDataConfig>,
}
type dataPoint = {
  primary: chartsPrimaryConfig,
  aux?: array<chartsAuxConfig>,
  error?: chartsErrorConfig,
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
type chartsPayloadConfig = {
  value: CommonTypes.stringOrNumber,
  index?: int,
  coordinate?: float,
}
type tickProps = {
  x?: float,
  y?: float,
  payload?: chartsPayloadConfig,
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
type chartsPositionConfig = {
  x?: float,
  y?: float,
}
type chartsAllowEscapeViewBoxConfig = {
  x?: bool,
  y?: bool,
}
type tooltipConfig = {
  position?: chartsPositionConfig,
  allowEscapeViewBox?: chartsAllowEscapeViewBoxConfig,
}
type noDataProps = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonSharedTypes.buttonProps,
}
type chartsSkeletonProps = {
  show: bool,
  variant: SkeletonTypes.skeletonVariant,
}
type chartsLegendsConfig = {
  title: string,
  total?: string,
}
type chartsPayloadConfig2 = {
  name?: string,
}
type dotItemDotProps = {
  cx?: float,
  cy?: float,
  value?: float,
  payload?: chartsPayloadConfig2,
}
type chartsPayloadConfig3 = {
  name: string,
  id?: string,
  color?: string,
  value?: float,
}
type chartsPayloadConfig4 = {
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
  payload: chartsPayloadConfig4,
}
type sankeyLink = {
  source: CommonTypes.stringOrNumber,
  target: CommonTypes.stringOrNumber,
  value: float,
  color?: string,
  hoverColor?: string,
}
type chartsPaddingConfig = {
  x?: string,
  y?: string,
}
type chartsSlotsConfig = {
  gap?: string,
}
type chartsHeaderConfig = {
  padding: chartsPaddingConfig,
  backgroundColor?: string,
  borderBottom?: string,
  borderRadius?: string,
  slots: chartsSlotsConfig,
}
type chartsDropdownConfig = {
  maxHeight?: string,
}
type chartsColorConfig = {
  default: string,
  hover: string,
  active: string,
  total: string,
}
type chartsItemConfig = {
  gap?: string,
  color: chartsColorConfig,
  fontSize?: string,
  fontWeight?: string,
}
type chartsLegendConfig = {
  gap?: string,
  dropdown: chartsDropdownConfig,
  item: chartsItemConfig,
}
type chartsPaddingConfig2 = {
  top?: string,
  right?: string,
  bottom?: string,
  left?: string,
}
type chartsContentConfig = {
  legend: chartsLegendConfig,
  padding: chartsPaddingConfig2,
  gap?: string,
  backgroundColor?: string,
}
type chartTokensType = {
  border?: string,
  borderRadius?: string,
  header: chartsHeaderConfig,
  content: chartsContentConfig,
}
type responsiveChartTokens = {
  sm: chartTokensType,
  lg: chartTokensType,
}
@unboxed type stringOrChartsColorsConfig = Str(string) | ChartsColorsConfig(chartsColorsConfig)
