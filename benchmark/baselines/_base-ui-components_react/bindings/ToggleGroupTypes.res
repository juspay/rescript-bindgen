type toggleGroupState = {
  disabled: bool,
  multiple: bool,
}
@unboxed type toggleGroupStyle = Style(JsxDOM.style) | Fn(toggleGroupState => option<JsxDOM.style>)
@unboxed type toggleGroupClassName = Str(string) | Fn(toggleGroupState => option<string>)
