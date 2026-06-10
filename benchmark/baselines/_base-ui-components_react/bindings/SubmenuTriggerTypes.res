type menuSubmenuTriggerState = {
  disabled: bool,
  highlighted: bool,
  @as("open") open_: bool,
}
@unboxed type menuSubmenuTriggerStyle = Style(JsxDOM.style) | Fn(menuSubmenuTriggerState => JsxDOM.style)
@unboxed type menuSubmenuTriggerClassName = Str(string) | Fn(menuSubmenuTriggerState => string)
