@module("@juspay/blend-design-system") @react.component
external make: (
  ~allowChartUpdate: bool=?,
  ~constructorType: HighchartsSharedTypes.chartsConstructorType=?,
  ~containerProps: Dict.t<'a>=?,
  ~highcharts: InstanceTypes.highchartsModule=?,
  ~immutable: bool=?,
  ~options: HighchartsSharedTypes.options<'b>=?,
  ~updateArgs: array<bool>=?,
  ~callback: HighchartsSharedTypes.chart<'b> => unit=?,
  ~ref: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'b>>>=?,
) => React.element = "BlendChart"
