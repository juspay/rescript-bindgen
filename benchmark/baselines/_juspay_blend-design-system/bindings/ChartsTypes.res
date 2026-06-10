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
type primaryConfig5 = {
  label: string,
  val: float,
}
type auxConfig = {
  label: string,
  val: float,
  @as("type") type_?: axisType,
  dateOnly?: bool,
  smart?: bool,
  timeZone?: string,
  hour12?: bool,
}
type errorDataConfig = {
  label: string,
  value: string,
}
type errorConfig = {
  title: string,
  errorData?: array<errorDataConfig>,
}
type dataPoint = {
  primary: primaryConfig5,
  aux?: array<auxConfig>,
  error?: errorConfig,
}
type newNestedDataPoint = {
  name: string,
  data: Dict.t<dataPoint>,
}
type stackedLegendsDataPoint = {
  value: float,
  delta: float,
  changeType: legendsChangeType,
}
type payloadConfig = {
  value: CommonTypes.stringOrNumber,
  index?: int,
  coordinate?: float,
}
type tickProps = {
  x?: float,
  y?: float,
  payload?: payloadConfig,
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
type positionConfig = {
  x?: float,
  y?: float,
}
type allowEscapeViewBoxConfig = {
  x?: bool,
  y?: bool,
}
type tooltipConfig = {
  position?: positionConfig,
  allowEscapeViewBox?: allowEscapeViewBoxConfig,
}
type noDataProps = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonSkeletonTypes.buttonProps,
}
type legendsConfig = {
  title: string,
  total?: string,
}
type payloadConfig2 = {
  name?: string,
}
type dotItemDotProps = {
  cx?: float,
  cy?: float,
  value?: float,
  payload?: payloadConfig2,
}
type payloadConfig3 = {
  name: string,
  id?: string,
  color?: string,
  value?: float,
}
type payloadConfig4 = {
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
  payload: payloadConfig4,
}
type sankeyLink = {
  source: CommonTypes.stringOrNumber,
  target: CommonTypes.stringOrNumber,
  value: float,
  color?: string,
  hoverColor?: string,
}
type slotsConfig = {
  gap: string,
}
type headerConfig3 = {
  padding: ModalTypes.paddingConfig5,
  backgroundColor: string,
  borderBottom: string,
  borderRadius: string,
  slots: slotsConfig,
}
type dropdownConfig = {
  maxHeight: string,
}
type colorConfig7 = {
  default: string,
  hover: string,
  active: string,
  total: string,
}
type itemConfig2 = {
  gap: string,
  color: colorConfig7,
  fontSize: string,
  fontWeight: string,
}
type legendConfig = {
  gap: string,
  dropdown: dropdownConfig,
  item: itemConfig2,
}
type contentConfig2 = {
  legend: legendConfig,
  padding: TabsTypes.boxedConfig2,
  gap: string,
  backgroundColor: string,
}
type chartTokensType = {
  border: string,
  borderRadius: string,
  header: headerConfig3,
  content: contentConfig2,
}
type responsiveChartTokens = {
  sm: chartTokensType,
  lg: chartTokensType,
}
