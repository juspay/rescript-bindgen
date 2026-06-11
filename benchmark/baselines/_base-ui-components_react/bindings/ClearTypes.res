type comboboxClearState = {
  @as("open") open_: bool,
  disabled: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type comboboxClearStyle = Style(JsxDOM.style) | Fn(comboboxClearState => JsxDOM.style)
@unboxed type comboboxClearClassName = Str(string) | Fn(comboboxClearState => string)
