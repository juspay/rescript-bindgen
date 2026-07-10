@module("@juspay/blend-design-system") @react.component
external make: (
  ~chartType: HighchartsSharedTypes.chartType=?,
  ~data: array<HighchartsSharedTypes.newNestedDataPoint>,
  ~colors: array<HighchartsSharedTypes.chartsColorsConfig>=?,
  ~barsize: float=?,
  ~xAxis: HighchartsSharedTypes.axisConfig=?,
  ~yAxis: HighchartsSharedTypes.axisConfig=?,
  ~tooltip: HighchartsSharedTypes.tooltipConfig=?,
  ~height: CommonTypes.stringOrNumber=?,
  ~width: CommonTypes.stringOrNumber=?,
  ~isSmallScreen: bool=?,
  ~hoveredKey: Nullable.t<string>=?,
  ~onHoveredKeyChange: Nullable.t<string> => unit=?,
  ~selectedKeys: array<string>=?,
  ~lineSeriesKeys: array<string>=?,
  ~enableHover: bool=?,
) => React.element = "CoreChart"
