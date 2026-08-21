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
type __typeP6m40 = {
  width: string,
  height: string,
  borderRadius: string,
}
type __typeV1xgem = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type __typeV1kdcq = {
  color: string,
  width: string,
  height: string,
}
type __typeTqkig = {
  gap: string,
  name: __typeV1xgem,
  value: __typeV1xgem,
  separator: __typeV1kdcq,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemConfig = {
  gap: string,
  shape: __typeP6m40,
  text: __typeTqkig,
}
type chartsV2ChartV2TokensTypeLegendsConfig = {
  gap: string,
  legendItem: chartsV2ChartV2TokensTypeLegendsLegendItemConfig,
}
type __typeV1vw5b = {
  fontSize: string,
  color: string,
  fontWeight: string,
  lineHeight: string,
}
type __typeV1agq42 = {
  width: string,
  color: string,
}
type chartsV2ChartV2TokensTypeChartXAxisConfig = {
  title: __typeV1vw5b,
  labels: __typeV1vw5b,
  line: __typeV1agq42,
  gridLine: __typeV1agq42,
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
