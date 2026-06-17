type numberFieldGroupState = {
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
@unboxed type numberFieldGroupStyle = Style(JsxDOM.style) | Fn(numberFieldGroupState => JsxDOM.style)
@unboxed type numberFieldGroupClassName = Str(string) | Fn(numberFieldGroupState => string)
