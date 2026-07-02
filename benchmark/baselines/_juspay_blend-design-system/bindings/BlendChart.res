@module("@juspay/blend-design-system") @react.component
external make: (
  ~allowChartUpdate: bool=?,
  ~constructorType: ChartsTypes.constructorType=?,
  ~containerProps: Dict.t<'a>=?,
  ~highcharts: string=?,  // ⚪ loose — was `typeof import("/Users/roshan.chourasiya/work/FE/opensource/rescript-bindgen/benchmark/.work/_juspay_blend-desi`
  ~immutable: bool=?,
  ~options: HighchartsSharedTypes.options<'b>=?,
  ~updateArgs: string=?,  // ⚪ loose — was `[boolean] | [boolean, boolean] | [boolean, boolean, boolean]`
  ~callback: HighchartsSharedTypes.chart => unit=?,
) => React.element = "BlendChart"
