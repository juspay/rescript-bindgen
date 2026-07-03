@module("@juspay/blend-design-system") @react.component
external make: (
  ~allowChartUpdate: bool=?,
  ~constructorType: ChartsTypes.chartsConstructorType=?,
  ~containerProps: Dict.t<'a>=?,
  ~highcharts: InstanceTypes.highchartsModule=?,
  ~immutable: bool=?,
  ~options: HighchartsSharedTypes.options<'b>=?,
  ~updateArgs: array<bool>=?,
  ~callback: HighchartsSharedTypes.chart => unit=?,
  ~skeleton: ChartsV2Types.chartV2SkeletonProps=?,
  ~noData: ChartsV2Types.chartV2NoDataProps=?,
) => React.element = "ChartV2"
