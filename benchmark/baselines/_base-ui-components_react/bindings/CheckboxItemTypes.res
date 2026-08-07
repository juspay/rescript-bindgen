type menuCheckboxItemState = {
  disabled: bool,
  highlighted: bool,
  checked: bool,
}
@unboxed type menuCheckboxItemStyle = Style(JsxDOM.style) | Fn(menuCheckboxItemState => option<JsxDOM.style>)
@unboxed type menuCheckboxItemClassName = Str(string) | Fn(menuCheckboxItemState => option<string>)
