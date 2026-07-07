type chartPoint = {
  x: float,
  y: float,
}
@unboxed type stringOrNumberOrStringOrNumberArrayOrChartPoint = Str(string) | Num(float) | Arr(array<CommonTypes.stringOrNumber>) | ChartPoint(chartPoint)
