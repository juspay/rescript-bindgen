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
type inputState = {
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type numberFieldInputState = {
  value: float,
  inputValue: string,
  required: bool,
  disabled: bool,
  readOnly: bool,
  scrubbing: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type toolbarInputState = {
  disabled: bool,
  focusable: bool,
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type comboboxInputStyle = Style(JsxDOM.style) | Fn(comboboxInputState => JsxDOM.style)
@unboxed type comboboxInputClassName = Str(string) | Fn(comboboxInputState => string)
@unboxed type inputStyle = Style(JsxDOM.style) | Fn(inputState => JsxDOM.style)
@unboxed type inputClassName = Str(string) | Fn(inputState => string)
@unboxed type numberFieldInputStyle = Style(JsxDOM.style) | Fn(numberFieldInputState => JsxDOM.style)
@unboxed type numberFieldInputClassName = Str(string) | Fn(numberFieldInputState => string)
@unboxed type toolbarInputStyle = Style(JsxDOM.style) | Fn(toolbarInputState => JsxDOM.style)
@unboxed type toolbarInputClassName = Str(string) | Fn(toolbarInputState => string)
