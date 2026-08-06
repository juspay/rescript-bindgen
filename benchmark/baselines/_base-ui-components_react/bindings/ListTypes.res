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
@unboxed type comboboxListClassName = Str(string) | Fn(comboboxListState => option<string>)
@unboxed type comboboxListStyle = Style(JsxDOM.style) | Fn(comboboxListState => option<JsxDOM.style>)
@unboxed type navigationMenuListStyle = Style(JsxDOM.style) | Fn(navigationMenuListState => option<JsxDOM.style>)
@unboxed type navigationMenuListClassName = Str(string) | Fn(navigationMenuListState => option<string>)
@unboxed type tabsListStyle = Style(JsxDOM.style) | Fn(tabsListState => option<JsxDOM.style>)
@unboxed type tabsListClassName = Str(string) | Fn(tabsListState => option<string>)
