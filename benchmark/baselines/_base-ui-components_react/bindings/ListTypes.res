type comboboxListState = {
  empty: bool,
}
@unboxed type comboboxListClassName = Str(string) | Fn(comboboxListState => string)
@unboxed type comboboxListStyle = Style(JsxDOM.style) | Fn(comboboxListState => JsxDOM.style)
