type checkboxGroupState = {
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
@unboxed type checkboxGroupStyle = Style(JsxDOM.style) | Fn(checkboxGroupState => JsxDOM.style)
@unboxed type checkboxGroupClassName = Str(string) | Fn(checkboxGroupState => string)
