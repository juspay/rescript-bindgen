type forwardrefNestedOmitOptionsConfig = {
  title: string,
}
type skeletonProps = {
  variant?: string,
}
type chartProps = {
  skeleton?: skeletonProps,
  noData?: bool,
}
@set_index external chartPropsSet: (chartProps, string, JSON.t) => unit = ""
type forwardrefNestedOmitChartReactPropsStyleConfig = {
  color: string,
}
type chartReactProps = {
  allowChartUpdate?: bool,
  containerProps?: Dict.t<string>,  // 🛑 BROKEN — contains `any`
  immutable?: bool,
  options?: forwardrefNestedOmitOptionsConfig,
  className?: string,
  style?: forwardrefNestedOmitChartReactPropsStyleConfig,
  callback?: string => unit,
}
@set_index external chartReactPropsSet: (chartReactProps, string, JSON.t) => unit = ""
