type numberFieldScrubAreaCursorState = {
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
@unboxed type numberFieldScrubAreaCursorStyle = Style(JsxDOM.style) | Fn(numberFieldScrubAreaCursorState => JsxDOM.style)
@unboxed type numberFieldScrubAreaCursorClassName = Str(string) | Fn(numberFieldScrubAreaCursorState => string)
