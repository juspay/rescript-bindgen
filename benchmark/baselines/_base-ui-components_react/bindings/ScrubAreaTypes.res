type numberFieldScrubAreaState = {
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
@unboxed type numberFieldScrubAreaStyle = Style(JsxDOM.style) | Fn(numberFieldScrubAreaState => option<JsxDOM.style>)
@unboxed type numberFieldScrubAreaClassName = Str(string) | Fn(numberFieldScrubAreaState => option<string>)
