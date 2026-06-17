type menuRadioItemState = {
  disabled: bool,
  highlighted: bool,
  checked: bool,
}
@unboxed type menuRadioItemStyle = Style(JsxDOM.style) | Fn(menuRadioItemState => JsxDOM.style)
@unboxed type menuRadioItemClassName = Str(string) | Fn(menuRadioItemState => string)
