type toggleGroupState = {
  disabled: bool,
  multiple: bool,
}
@unboxed type toggleGroupStyle = Style(JsxDOM.style) | Fn(toggleGroupState => JsxDOM.style)
@unboxed type toggleGroupClassName = Str(string) | Fn(toggleGroupState => string)
