type navigationMenuIconState = {
  @as("open") open_: bool,
}
@unboxed type navigationMenuIconStyle = Style(JsxDOM.style) | Fn(navigationMenuIconState => JsxDOM.style)
@unboxed type navigationMenuIconClassName = Str(string) | Fn(navigationMenuIconState => string)
