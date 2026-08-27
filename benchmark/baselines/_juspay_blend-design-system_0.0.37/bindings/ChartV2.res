type props<'a, 'b, 'c> = {
  allowChartUpdate?: bool,
  constructorType?: ChartsTypes.chartsBlendChartPropsConstructorType,
  containerProps?: Dict.t<'a>,
  highcharts?: InstanceTypes.highchartsModule,
  immutable?: bool,
  options?: HighchartsSharedTypes.options<'a, 'b, 'c>,
  updateArgs?: array<bool>,
  callback?: HighchartsSharedTypes.chart<'a, 'b, 'c> => unit,
  skeleton?: HighchartsSharedTypes.chartV2SkeletonProps,
  noData?: HighchartsSharedTypes.chartV2NoDataProps,
  ref?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c>> = "ChartV2"
