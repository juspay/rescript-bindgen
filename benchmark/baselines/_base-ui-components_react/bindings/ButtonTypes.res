type buttonState = {
  disabled: bool,
}
type toolbarButtonState = {
  disabled: bool,
  focusable: bool,
  orientation: PositionerTabUtilsTypes.orientation,
}
@unboxed type buttonClassName = Str(string) | Fn(buttonState => string)
@unboxed type buttonStyle = Style(JsxDOM.style) | Fn(buttonState => JsxDOM.style)
@unboxed type toolbarButtonStyle = Style(JsxDOM.style) | Fn(toolbarButtonState => JsxDOM.style)
@unboxed type toolbarButtonClassName = Str(string) | Fn(toolbarButtonState => string)
