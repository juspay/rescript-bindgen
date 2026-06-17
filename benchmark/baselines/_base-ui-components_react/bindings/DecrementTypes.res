type numberFieldDecrementState = {
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
@unboxed type numberFieldDecrementStyle = Style(JsxDOM.style) | Fn(numberFieldDecrementState => JsxDOM.style)
@unboxed type numberFieldDecrementClassName = Str(string) | Fn(numberFieldDecrementState => string)
