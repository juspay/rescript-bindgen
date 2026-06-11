type comboboxInputState = {
  @as("open") open_: bool,
  popupSide: PositionerSharedTypes.side,
  listEmpty: bool,
  readOnly: bool,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
@unboxed type comboboxInputStyle = Style(JsxDOM.style) | Fn(comboboxInputState => JsxDOM.style)
@unboxed type comboboxInputClassName = Str(string) | Fn(comboboxInputState => string)
