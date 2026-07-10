type forwardrefIndexedPropsChartPropsOptionsConfig = {
  title: string,
}
type chartProps = {
  options?: forwardrefIndexedPropsChartPropsOptionsConfig,
  immutable?: bool,
  onRender?: string => unit,
}
@set_index external chartPropsSet: (chartProps, string, JSON.t) => unit = ""
