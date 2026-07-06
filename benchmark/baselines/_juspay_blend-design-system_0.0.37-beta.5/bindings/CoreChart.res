@module("@juspay/blend-design-system") @react.component
external make: (
  ~chartType: ChartsTypes.chartType=?,
  ~data: Nullable.t<array<ChartsTypes.newNestedDataPoint>>=?,
  ~colors: array<ChartsTypes.chartsColorsConfig>=?,
  ~barsize: float=?,
  ~xAxis: ChartsTypes.axisConfig=?,
  ~yAxis: ChartsTypes.axisConfig=?,
  ~tooltip: ChartsTypes.tooltipConfig=?,
  ~height: CommonTypes.stringOrNumber=?,
  ~width: CommonTypes.stringOrNumber=?,
  ~isSmallScreen: bool=?,
  ~hoveredKey: Nullable.t<string>=?,
  ~onHoveredKeyChange: Nullable.t<string> => unit=?,
  ~selectedKeys: array<string>=?,
  ~lineSeriesKeys: array<string>=?,
  ~enableHover: bool=?,
) => React.element = "CoreChart"
