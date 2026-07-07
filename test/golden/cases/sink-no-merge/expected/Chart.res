@module("demo") @react.component
external make: (
  ~data: ChartTypes.stringOrNumberOrStringOrNumberArrayOrChartPoint=?,
  ~size: CommonTypes.stringOrNumber=?,
) => React.element = "Chart"
