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
) => React.element = "BlendChart"
