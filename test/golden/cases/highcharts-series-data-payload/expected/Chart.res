type props<'a, 'b> = {
  containerProps?: Dict.t<'a>,
  options?: HighchartsSeriesDataPayloadTypes.options<'b>,
}

@module("demo")
external make: React.component<props<'a, 'b>> = "Chart"
