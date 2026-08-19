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
type statCardStatCardTokenTypeTextContainerHeaderConfig = {
  gap: string,
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  titleIcon: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; }`
  helpIcon: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; color: { default: Color; hover: Color; }; }`
}
type statCardStatCardTokenTypeTextContainerStatsConfig = {
  gap: string,
  title: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; value: { line: { fontSize: FontSize<number | (string & {})>; fontWeight: F`
  subtitle: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
}
type statCardStatCardTokenTypeTextContainerConfig = {
  gap: string,
  header: statCardStatCardTokenTypeTextContainerHeaderConfig,
  stats: statCardStatCardTokenTypeTextContainerStatsConfig,
}
type statCardStatCardTokenTypeChartColorsConfig = {
  line: string,  // ⚪ loose — was `{ increase: Color; decrease: Color; }`
  area: string,  // ⚪ loose — was `{ increase: Color; decrease: Color; }`
  gradient: string,  // ⚪ loose — was `{ end: Color; startOpacity: number; endOpacity: number; }`
}
type statCardStatCardTokenTypeChartLineConfig = {
  strokeWidth: string,
  activeDot: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; fill: Fill; }`
}
type statCardStatCardTokenTypeChartBarConfig = {
  borderTopRightRadius: string,
  borderTopLeftRadius: string,
  borderBottomRightRadius: string,
  borderBottomLeftRadius: string,
  fill: string,  // ⚪ loose — was `{ default: Fill; hover: Fill; }`
}
type statCardStatCardTokenTypeChartProgressBarConfig = {
  height: string,
  borderRadius: string,
  gap: string,
  background: string,  // ⚪ loose — was `{ fill: BackgroundColor; empty: BackgroundColor; pattern: { color: Color; size: BackgroundSize<number | (strin`
  label: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
}
type statCardStatCardTokenTypeChartTooltipConfig = {
  backgroundColor: string,
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
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
