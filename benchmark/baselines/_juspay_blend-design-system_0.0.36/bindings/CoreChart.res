type props = {
  chartType?: ChartsTypes.chartType,
  data: array<ChartsTypes.newNestedDataPoint>,
  colors?: array<ChartsTypes.chartsColorsConfig>,
  barsize?: float,
  xAxis?: ChartsTypes.axisConfig,
  yAxis?: ChartsTypes.axisConfig,
  tooltip?: ChartsTypes.tooltipConfig,
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
