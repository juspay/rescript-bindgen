type comboboxClearState = {
  @as("open") open_: bool,
  disabled: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type comboboxClearStyle = Style(JsxDOM.style) | Fn(comboboxClearState => option<JsxDOM.style>)
@unboxed type comboboxClearClassName = Str(string) | Fn(comboboxClearState => option<string>)
