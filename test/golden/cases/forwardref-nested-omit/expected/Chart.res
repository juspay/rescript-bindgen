type props<'a> = {
  ...ForwardrefNestedOmitTypes.chartProps,
  allowChartUpdate?: bool,
  containerProps?: Dict.t<'a>,
  immutable?: bool,
  options?: ForwardrefNestedOmitTypes.forwardrefNestedOmitOptionsConfig,
  callback?: string => unit,
}

@module("demo")
external make: React.component<props<'a>> = "Chart"
