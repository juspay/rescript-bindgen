@module("@juspay/blend-design-system") @react.component
external make: (
  ~chartType: ChartsTypes.chartType=?,
  ~data: array<ChartsTypes.newNestedDataPoint>,
  ~colors: array<AvatarGroupTypes.textConfig7>=?,
  ~barsize: float=?,
  ~xAxis: ChartsTypes.axisConfig=?,
  ~yAxis: ChartsTypes.axisConfig=?,
  ~tooltip: ChartsTypes.tooltipConfig=?,
  ~height: CommonTypes.stringOrNumber=?,
  ~width: CommonTypes.stringOrNumber=?,
  ~isSmallScreen: bool=?,
  ~hoveredKey: string=?,
  ~onHoveredKeyChange: string => unit=?,
  ~selectedKeys: array<string>=?,
  ~lineSeriesKeys: array<string>=?,
  ~enableHover: bool=?,
) => React.element = "CoreChart"
