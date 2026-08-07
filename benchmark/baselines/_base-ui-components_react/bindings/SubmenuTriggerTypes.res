type menuSubmenuTriggerState = {
  disabled: bool,
  highlighted: bool,
  @as("open") open_: bool,
}
@unboxed type menuSubmenuTriggerStyle = Style(JsxDOM.style) | Fn(menuSubmenuTriggerState => option<JsxDOM.style>)
@unboxed type menuSubmenuTriggerClassName = Str(string) | Fn(menuSubmenuTriggerState => option<string>)
