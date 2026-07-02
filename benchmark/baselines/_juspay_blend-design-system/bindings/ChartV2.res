@module("@juspay/blend-design-system") @react.component
external make: (
  ~highcharts: string=?,  // ⚪ loose — was `typeof import("/Users/roshan.chourasiya/work/FE/opensource/rescript-bindgen/benchmark/.work/_juspay_blend-desi`
  ~skeleton: ChartsV2Types.chartV2SkeletonProps=?,
  ~noData: ChartsV2Types.chartV2NoDataProps=?,
) => React.element = "ChartV2"
