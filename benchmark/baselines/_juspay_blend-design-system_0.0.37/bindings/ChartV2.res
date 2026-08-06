type props<'a, 'b, 'c> = {
  allowChartUpdate?: bool,
  constructorType?: HighchartsSharedTypes.chartsBlendChartPropsConstructorType,
  containerProps?: Dict.t<'a>,
  highcharts?: InstanceTypes.highchartsModule,
  immutable?: bool,
  options?: HighchartsSharedTypes.options<'a, 'b, 'c>,
  updateArgs?: array<bool>,
  callback?: HighchartsSharedTypes.chart<'a, 'b, 'c> => unit,
  skeleton?: ChartsV2Types.chartV2SkeletonProps,
  noData?: ChartsV2Types.chartV2NoDataProps,
  ref?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c>> = "ChartV2"
