type comboboxChipRemoveState = {
  disabled: bool,
}
@unboxed type comboboxChipRemoveStyle = Style(JsxDOM.style) | Fn(comboboxChipRemoveState => option<JsxDOM.style>)
@unboxed type comboboxChipRemoveClassName = Str(string) | Fn(comboboxChipRemoveState => option<string>)
