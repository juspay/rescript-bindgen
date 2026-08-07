type props = {
  chartType?: HighchartsSharedTypes.chartType,
  data?: Nullable.t<array<HighchartsSharedTypes.newNestedDataPoint>>,
  colors?: array<HighchartsSharedTypes.chartsColorsConfig>,
  barsize?: float,
  xAxis?: HighchartsSharedTypes.axisConfig,
  yAxis?: HighchartsSharedTypes.axisConfig,
  tooltip?: HighchartsSharedTypes.tooltipConfig,
  height?: CommonTypes.stringOrNumber,
  width?: CommonTypes.stringOrNumber,
  isSmallScreen?: bool,
  hoveredKey?: Nullable.t<string>,
  onHoveredKeyChange?: Nullable.t<string> => unit,
  selectedKeys?: array<string>,
  lineSeriesKeys?: array<string>,
  enableHover?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CoreChart"
