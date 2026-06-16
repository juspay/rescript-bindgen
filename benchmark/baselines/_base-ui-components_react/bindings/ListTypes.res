type comboboxListState = {
  empty: bool,
}
type navigationMenuListState = {
  @as("open") open_: bool,
}
type tabsListState = {
  orientation: PositionerSharedTypes.orientation,
  tabActivationDirection: PositionerSharedTypes.tabsTabActivationDirection,
}
@unboxed type comboboxListClassName = Str(string) | Fn(comboboxListState => string)
@unboxed type comboboxListStyle = Style(JsxDOM.style) | Fn(comboboxListState => JsxDOM.style)
@unboxed type navigationMenuListStyle = Style(JsxDOM.style) | Fn(navigationMenuListState => JsxDOM.style)
@unboxed type navigationMenuListClassName = Str(string) | Fn(navigationMenuListState => string)
@unboxed type tabsListStyle = Style(JsxDOM.style) | Fn(tabsListState => JsxDOM.style)
@unboxed type tabsListClassName = Str(string) | Fn(tabsListState => string)
