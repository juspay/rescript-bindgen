type toggleState = {
  pressed: bool,
  disabled: bool,
}
@unboxed type toggleStyle = Style(JsxDOM.style) | Fn(toggleState => JsxDOM.style)
@unboxed type toggleClassName = Str(string) | Fn(toggleState => string)
