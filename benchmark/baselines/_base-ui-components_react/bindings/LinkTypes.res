type navigationMenuLinkState = {
  active: bool,
}
type toolbarLinkState = {
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type navigationMenuLinkStyle = Style(JsxDOM.style) | Fn(navigationMenuLinkState => option<JsxDOM.style>)
@unboxed type navigationMenuLinkClassName = Str(string) | Fn(navigationMenuLinkState => option<string>)
@unboxed type toolbarLinkStyle = Style(JsxDOM.style) | Fn(toolbarLinkState => option<JsxDOM.style>)
@unboxed type toolbarLinkClassName = Str(string) | Fn(toolbarLinkState => option<string>)
