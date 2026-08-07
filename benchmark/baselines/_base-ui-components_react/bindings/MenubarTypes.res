type menubarState = {
  orientation: RootSharedTypes.menuRootOrientation,
  modal: bool,
  hasSubmenuOpen: bool,
}
@unboxed type menubarStyle = Style(JsxDOM.style) | Fn(menubarState => option<JsxDOM.style>)
@unboxed type menubarClassName = Str(string) | Fn(menubarState => option<string>)
