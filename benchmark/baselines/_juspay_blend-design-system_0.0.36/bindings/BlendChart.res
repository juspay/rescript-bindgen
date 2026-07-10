@module("@juspay/blend-design-system") @react.component
external make: (
  ~ref: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>=?,
  ~allowChartUpdate: bool=?,
  ~constructorType: HighchartsSharedTypes.chartsBlendChartPropsConstructorType=?,
  ~containerProps: Dict.t<'t6>=?,
  ~highcharts: InstanceTypes.highchartsModule=?,
  ~immutable: bool=?,
  ~options: HighchartsSharedTypes.options<'a, 'b, 'c>=?,
  ~updateArgs: array<bool>=?,
  ~callback: HighchartsSharedTypes.chart<'a, 'b, 'c> => unit=?,
) => React.element = "BlendChart"
