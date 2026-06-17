type navigationMenuLinkState = {
  active: bool,
}
type toolbarLinkState = {
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type navigationMenuLinkStyle = Style(JsxDOM.style) | Fn(navigationMenuLinkState => JsxDOM.style)
@unboxed type navigationMenuLinkClassName = Str(string) | Fn(navigationMenuLinkState => string)
@unboxed type toolbarLinkStyle = Style(JsxDOM.style) | Fn(toolbarLinkState => JsxDOM.style)
@unboxed type toolbarLinkClassName = Str(string) | Fn(toolbarLinkState => string)
