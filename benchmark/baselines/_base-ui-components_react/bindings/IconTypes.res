type navigationMenuIconState = {
  @as("open") open_: bool,
}
@unboxed type navigationMenuIconStyle = Style(JsxDOM.style) | Fn(navigationMenuIconState => option<JsxDOM.style>)
@unboxed type navigationMenuIconClassName = Str(string) | Fn(navigationMenuIconState => option<string>)
