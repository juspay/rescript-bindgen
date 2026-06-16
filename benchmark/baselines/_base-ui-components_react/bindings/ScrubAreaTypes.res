type numberFieldScrubAreaState = {
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
@unboxed type numberFieldScrubAreaStyle = Style(JsxDOM.style) | Fn(numberFieldScrubAreaState => JsxDOM.style)
@unboxed type numberFieldScrubAreaClassName = Str(string) | Fn(numberFieldScrubAreaState => string)
