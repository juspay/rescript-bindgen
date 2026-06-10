type radioGroupState = {
  readOnly: bool,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
@unboxed type radioGroupClassName = Str(string) | Fn(radioGroupState => string)
@unboxed type radioGroupStyle = Style(JsxDOM.style) | Fn(radioGroupState => JsxDOM.style)
