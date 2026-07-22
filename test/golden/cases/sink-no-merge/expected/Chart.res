type props = {
  data?: ChartTypes.stringOrNumberOrStringOrNumberArrayOrChartPoint,
  size?: CommonTypes.stringOrNumber,
}

@module("demo")
external make: React.component<props> = "Chart"
