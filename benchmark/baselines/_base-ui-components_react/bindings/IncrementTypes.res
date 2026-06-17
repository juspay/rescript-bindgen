type numberFieldIncrementState = {
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
@unboxed type numberFieldIncrementStyle = Style(JsxDOM.style) | Fn(numberFieldIncrementState => JsxDOM.style)
@unboxed type numberFieldIncrementClassName = Str(string) | Fn(numberFieldIncrementState => string)
