type fieldsetLegendState = {
  disabled: bool,
}
@unboxed type fieldsetLegendStyle = Style(JsxDOM.style) | Fn(fieldsetLegendState => option<JsxDOM.style>)
@unboxed type fieldsetLegendClassName = Str(string) | Fn(fieldsetLegendState => option<string>)
