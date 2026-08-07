type toggleState = {
  pressed: bool,
  disabled: bool,
}
@unboxed type toggleStyle = Style(JsxDOM.style) | Fn(toggleState => option<JsxDOM.style>)
@unboxed type toggleClassName = Str(string) | Fn(toggleState => option<string>)
