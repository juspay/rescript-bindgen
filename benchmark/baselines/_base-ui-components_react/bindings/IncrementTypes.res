type numberFieldIncrementState = {
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
@unboxed type numberFieldIncrementStyle = Style(JsxDOM.style) | Fn(numberFieldIncrementState => JsxDOM.style)
@unboxed type numberFieldIncrementClassName = Str(string) | Fn(numberFieldIncrementState => string)
