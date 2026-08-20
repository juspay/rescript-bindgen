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
type __typeUx2o0 = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type __typeQklzj = {
  width: string,
}
type statCardStatCardTokenTypeTextContainerHeaderConfig = {
  gap: string,
  title: __typeUx2o0,
  titleIcon: __typeQklzj,
  helpIcon: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; color: { default: Color; hover: Color; }; }`
}
type statCardStatCardTokenTypeTextContainerStatsConfig = {
  gap: string,
  title: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; value: { line: { fontSize: FontSize<number | (string & {})>; fontWeight: F`
  subtitle: __typeUx2o0,
}
type statCardStatCardTokenTypeTextContainerConfig = {
  gap: string,
  header: statCardStatCardTokenTypeTextContainerHeaderConfig,
  stats: statCardStatCardTokenTypeTextContainerStatsConfig,
}
type __typeSmi8o = {
  increase: string,
  decrease: string,
}
type __typeV16qvn = {
  end: string,
  startOpacity: float,
  endOpacity: float,
}
type statCardStatCardTokenTypeChartColorsConfig = {
  line: __typeSmi8o,
  area: __typeSmi8o,
  gradient: __typeV16qvn,
}
type __typeV1xaug = {
  width: string,
  fill: string,
}
type statCardStatCardTokenTypeChartLineConfig = {
  strokeWidth: string,
  activeDot: __typeV1xaug,
}
type statCardStatCardTokenTypeChartBarConfig = {
  borderTopRightRadius: string,
  borderTopLeftRadius: string,
  borderBottomRightRadius: string,
  borderBottomLeftRadius: string,
  fill: string,  // ⚪ loose — was `{ default: Fill; hover: Fill; }`
}
type __typeQlu7n = {
  color: string,
  size: string,
}
type __typeHnfo1 = {
  fill: string,
  empty: string,
  pattern: __typeQlu7n,
}
type statCardStatCardTokenTypeChartProgressBarConfig = {
  height: string,
  borderRadius: string,
  gap: string,
  background: __typeHnfo1,
  label: __typeUx2o0,
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
  @as("type") type_?: ChartsSharedTypes.axisType,
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
