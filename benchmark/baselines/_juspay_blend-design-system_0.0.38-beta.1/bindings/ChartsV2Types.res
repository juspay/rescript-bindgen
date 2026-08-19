type chartsV2ChartV2TokensTypeHeaderPaddingConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type chartsV2ChartV2TokensTypeHeaderConfig = {
  padding: chartsV2ChartV2TokensTypeHeaderPaddingConfig,
  backgroundColor: string,
  borderBottom: string,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemConfig = {
  gap: string,
  shape: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; height: Height<number | (string & {})>; borderRadius: BorderRadius<num`
  text: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; name: { fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight`
}
type chartsV2ChartV2TokensTypeLegendsConfig = {
  gap: string,
  legendItem: chartsV2ChartV2TokensTypeLegendsLegendItemConfig,
}
type chartsV2ChartV2TokensTypeChartXAxisConfig = {
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; color: Color; fontWeight: FontWeight; lineHeight: LineHeight<num`
  labels: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; color: Color; fontWeight: FontWeight; lineHeight: LineHeight<num`
  line: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; color: Color; }`
  gridLine: string,  // ⚪ loose — was `{ width: Width<number | (string & {})>; color: Color; }`
}
type chartsV2ChartV2TokensTypeChartConfig = {
  backgroundColor: string,
  xAxis: chartsV2ChartV2TokensTypeChartXAxisConfig,
  yAxis: chartsV2ChartV2TokensTypeChartXAxisConfig,
}
type chartV2TokensType = {
  border: string,
  borderRadius: string,
  boxShadow: string,
  backgroundColor: string,
  header: chartsV2ChartV2TokensTypeHeaderConfig,
  legends: chartsV2ChartV2TokensTypeLegendsConfig,
  chart: chartsV2ChartV2TokensTypeChartConfig,
}
type responsiveChartV2Tokens = {
  sm: chartV2TokensType,
  lg: chartV2TokensType,
}
type chartV2SkeletonProps = {
  show: bool,
  variant?: SkeletonTypes.skeletonVariant,
  height?: float,
}
type chartV2NoDataProps = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonTypes.buttonProps,
}
type chartV2CustomLegendItem = {
  key: string,
  name: string,
  color?: string,
  value?: CommonTypes.stringOrNumber,
}
type chartsV2RenderItemConfig = {
  item: HighchartsSharedTypes.ChartsLegendAllItems.t,
  name: string,
  visible: bool,
  color: string,
  value?: CommonTypes.stringOrNumber,
  onClick: unit => unit,
}
type chartV2FullscreenControls = {
  isFullscreen: bool,
  enterFullscreen: unit => unit,
  exitFullscreen: unit => unit,
}
type chartsV2UseChartLegendConfig<'a, 'b, 'c> = {
  hoveredItem: HighchartsSharedTypes.ChartsLegendAllItems.t,
  setHoveredItem: HighchartsSharedTypes.SetStateAction.t => unit,
  allItems: array<HighchartsSharedTypes.ChartsLegendAllItems.t>,
  handleClick: (HighchartsSharedTypes.ChartsLegendAllItems.t, float) => unit,
  chart: HighchartsSharedTypes.chart<'a, 'b, 'c>,
  charts: array<HighchartsSharedTypes.chart<'a, 'b, 'c>>,
}
type chartsV2UseChartLegendHoverConfig = {
  hoveredItem: HighchartsSharedTypes.ChartsLegendAllItems.t,
  setHoveredItem: HighchartsSharedTypes.SetStateAction.t => unit,
  allItems: array<HighchartsSharedTypes.ChartsLegendAllItems.t>,
  handleClick: (HighchartsSharedTypes.ChartsLegendAllItems.t, float) => unit,
}
type chartsV2UseChartRefsRefsConfig<'a, 'b, 'c> = {
  chart?: HighchartsSharedTypes.chart<'a, 'b, 'c>,
}
