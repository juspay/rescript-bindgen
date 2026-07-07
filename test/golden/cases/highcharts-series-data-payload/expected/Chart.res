@module("demo") @react.component
external make: (
  ~containerProps: Dict.t<'a>=?,
  ~options: HighchartsSeriesDataPayloadTypes.options<'b>=?,
) => React.element = "Chart"
