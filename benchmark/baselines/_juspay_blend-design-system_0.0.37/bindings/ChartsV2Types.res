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
type chartsV2ChartV2TokensTypeLegendsLegendItemShapeConfig = {
  width: string,
  height: string,
  borderRadius: string,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemTextNameConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemTextSeparatorConfig = {
  color: string,
  width: string,
  height: string,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemTextConfig = {
  gap: string,
  name: chartsV2ChartV2TokensTypeLegendsLegendItemTextNameConfig,
  value: chartsV2ChartV2TokensTypeLegendsLegendItemTextNameConfig,
  separator: chartsV2ChartV2TokensTypeLegendsLegendItemTextSeparatorConfig,
}
type chartsV2ChartV2TokensTypeLegendsLegendItemConfig = {
  gap: string,
  shape: chartsV2ChartV2TokensTypeLegendsLegendItemShapeConfig,
  text: chartsV2ChartV2TokensTypeLegendsLegendItemTextConfig,
}
type chartsV2ChartV2TokensTypeLegendsConfig = {
  gap: string,
  legendItem: chartsV2ChartV2TokensTypeLegendsLegendItemConfig,
}
type chartsV2ChartV2TokensTypeChartXAxisTitleConfig = {
  fontSize: string,
  color: string,
  fontWeight: string,
  lineHeight: string,
}
type chartsV2ChartV2TokensTypeChartXAxisLineConfig = {
  width: string,
  color: string,
}
type chartsV2ChartV2TokensTypeChartXAxisConfig = {
  title: chartsV2ChartV2TokensTypeChartXAxisTitleConfig,
  labels: chartsV2ChartV2TokensTypeChartXAxisTitleConfig,
  line: chartsV2ChartV2TokensTypeChartXAxisLineConfig,
  gridLine: chartsV2ChartV2TokensTypeChartXAxisLineConfig,
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
  item: HighchartsSharedTypes.ChartV2LegendItem.t,
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
  hoveredItem: HighchartsSharedTypes.ChartV2LegendItem.t,
  setHoveredItem: HighchartsSharedTypes.SetStateAction.t => unit,
  allItems: array<HighchartsSharedTypes.ChartV2LegendItem.t>,
  handleClick: (HighchartsSharedTypes.ChartV2LegendItem.t, float) => unit,
  chart: HighchartsSharedTypes.chart<'a, 'b, 'c>,
  charts: array<HighchartsSharedTypes.chart<'a, 'b, 'c>>,
}
type chartsV2UseChartLegendHoverConfig = {
  hoveredItem: HighchartsSharedTypes.ChartV2LegendItem.t,
  setHoveredItem: HighchartsSharedTypes.SetStateAction.t => unit,
  allItems: array<HighchartsSharedTypes.ChartV2LegendItem.t>,
  handleClick: (HighchartsSharedTypes.ChartV2LegendItem.t, float) => unit,
}
type chartsV2UseChartRefsRefsConfig<'a, 'b, 'c> = {
  chart?: HighchartsSharedTypes.chart<'a, 'b, 'c>,
}
