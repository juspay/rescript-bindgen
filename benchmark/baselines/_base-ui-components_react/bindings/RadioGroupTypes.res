type menuRadioGroupState = {
  disabled: bool,
}
type radioGroupState = {
  readOnly?: bool,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
@unboxed type menuRadioGroupStyle = Style(JsxDOM.style) | Fn(menuRadioGroupState => option<JsxDOM.style>)
@unboxed type menuRadioGroupClassName = Str(string) | Fn(menuRadioGroupState => option<string>)
@unboxed type radioGroupClassName = Str(string) | Fn(radioGroupState => option<string>)
@unboxed type radioGroupStyle = Style(JsxDOM.style) | Fn(radioGroupState => option<JsxDOM.style>)
