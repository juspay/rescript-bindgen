type comboboxBackdropState = {
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type comboboxBackdropStyle = Style(JsxDOM.style) | Fn(comboboxBackdropState => option<JsxDOM.style>)
@unboxed type comboboxBackdropClassName = Str(string) | Fn(comboboxBackdropState => option<string>)
