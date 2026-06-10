type navigationMenuLinkState = {
  active: bool,
}
@unboxed type navigationMenuLinkStyle = Style(JsxDOM.style) | Fn(navigationMenuLinkState => JsxDOM.style)
@unboxed type navigationMenuLinkClassName = Str(string) | Fn(navigationMenuLinkState => string)
