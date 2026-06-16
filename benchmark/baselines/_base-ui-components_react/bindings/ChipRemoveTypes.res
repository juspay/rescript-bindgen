type comboboxChipRemoveState = {
  disabled: bool,
}
@unboxed type comboboxChipRemoveStyle = Style(JsxDOM.style) | Fn(comboboxChipRemoveState => JsxDOM.style)
@unboxed type comboboxChipRemoveClassName = Str(string) | Fn(comboboxChipRemoveState => string)
