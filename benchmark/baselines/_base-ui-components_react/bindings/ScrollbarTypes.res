type scrollAreaScrollbarState = {
  hovering: bool,
  scrolling: bool,
  orientation: RootSharedTypes.orientation2,
  hasOverflowX: bool,
  hasOverflowY: bool,
  overflowXStart: bool,
  overflowXEnd: bool,
  overflowYStart: bool,
  overflowYEnd: bool,
  cornerHidden: bool,
}
@unboxed type scrollAreaScrollbarStyle = Style(JsxDOM.style) | Fn(scrollAreaScrollbarState => JsxDOM.style)
@unboxed type scrollAreaScrollbarClassName = Str(string) | Fn(scrollAreaScrollbarState => string)
