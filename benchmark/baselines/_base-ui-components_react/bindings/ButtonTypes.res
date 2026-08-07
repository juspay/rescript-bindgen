type buttonState = {
  disabled: bool,
}
type toolbarButtonState = {
  disabled: bool,
  focusable: bool,
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type buttonClassName = Str(string) | Fn(buttonState => option<string>)
@unboxed type buttonStyle = Style(JsxDOM.style) | Fn(buttonState => option<JsxDOM.style>)
@unboxed type toolbarButtonStyle = Style(JsxDOM.style) | Fn(toolbarButtonState => option<JsxDOM.style>)
@unboxed type toolbarButtonClassName = Str(string) | Fn(toolbarButtonState => option<string>)
