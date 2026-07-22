type props<'a, 'b, 'c, 't7> = {
  ref?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>,
  allowChartUpdate?: bool,
  constructorType?: HighchartsSharedTypes.chartsBlendChartPropsConstructorType,
  containerProps?: Dict.t<'t7>,
  highcharts?: InstanceTypes.highchartsModule,
  immutable?: bool,
  options?: HighchartsSharedTypes.options<'a, 'b, 'c>,
  updateArgs?: array<bool>,
  callback?: HighchartsSharedTypes.chart<'a, 'b, 'c> => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c, 't7>> = "BlendChart"
