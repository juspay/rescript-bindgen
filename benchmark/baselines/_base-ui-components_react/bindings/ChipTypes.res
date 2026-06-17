type comboboxChipState = {
  disabled: bool,
}
@unboxed type comboboxChipStyle = Style(JsxDOM.style) | Fn(comboboxChipState => JsxDOM.style)
@unboxed type comboboxChipClassName = Str(string) | Fn(comboboxChipState => string)
