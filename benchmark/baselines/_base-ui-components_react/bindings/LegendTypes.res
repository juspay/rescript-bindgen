type fieldsetLegendState = {
  disabled: bool,
}
@unboxed type fieldsetLegendStyle = Style(JsxDOM.style) | Fn(fieldsetLegendState => JsxDOM.style)
@unboxed type fieldsetLegendClassName = Str(string) | Fn(fieldsetLegendState => string)
