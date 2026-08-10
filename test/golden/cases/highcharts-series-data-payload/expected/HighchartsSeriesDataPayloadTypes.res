type seriesLineOptions<'b> = {
  @as("type") type_: [#"line"],
  data?: array<'b>,
  name?: string,
}
type seriesXrangeOptions<'b> = {
  @as("type") type_: [#"xrange"],
  data?: array<'b>,
  depth?: unit,
  name?: string,
}
module SeriesOptionsType = {
  type t<'b>
  external fromSeriesLineOptions: seriesLineOptions<'b> => t<'b> = "%identity"
  external asSeriesLineOptions: t<'b> => (seriesLineOptions<'b>) = "%identity"
  external fromSeriesXrangeOptions: seriesXrangeOptions<'b> => t<'b> = "%identity"
  external asSeriesXrangeOptions: t<'b> => (seriesXrangeOptions<'b>) = "%identity"
}
type options<'b> = {
  series?: array<SeriesOptionsType.t<'b>>,
}
