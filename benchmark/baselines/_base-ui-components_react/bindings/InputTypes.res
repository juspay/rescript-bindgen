type comboboxInputState = {
  @as("open") open_: bool,
  popupSide: Nullable.t<PositionerSharedTypes.side>,
  listEmpty: bool,
  readOnly: bool,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type inputState = {
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type numberFieldInputState = {
  value: Nullable.t<float>,
  inputValue: string,
  required: bool,
  disabled: bool,
  readOnly: bool,
  scrubbing: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type toolbarInputState = {
  disabled: bool,
  focusable: bool,
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type comboboxInputStyle = Style(JsxDOM.style) | Fn(comboboxInputState => option<JsxDOM.style>)
@unboxed type comboboxInputClassName = Str(string) | Fn(comboboxInputState => option<string>)
@unboxed type inputStyle = Style(JsxDOM.style) | Fn(inputState => option<JsxDOM.style>)
@unboxed type inputClassName = Str(string) | Fn(inputState => option<string>)
@unboxed type numberFieldInputStyle = Style(JsxDOM.style) | Fn(numberFieldInputState => option<JsxDOM.style>)
@unboxed type numberFieldInputClassName = Str(string) | Fn(numberFieldInputState => option<string>)
@unboxed type toolbarInputStyle = Style(JsxDOM.style) | Fn(toolbarInputState => option<JsxDOM.style>)
@unboxed type toolbarInputClassName = Str(string) | Fn(toolbarInputState => option<string>)
