type dialogCloseState = {
  disabled: bool,
}
type toastCloseState = {
  @as("type") type_: string,
}
@unboxed type dialogCloseStyle = Style(JsxDOM.style) | Fn(dialogCloseState => JsxDOM.style)
@unboxed type dialogCloseClassName = Str(string) | Fn(dialogCloseState => string)
@unboxed type toastCloseStyle = Style(JsxDOM.style) | Fn(toastCloseState => JsxDOM.style)
@unboxed type toastCloseClassName = Str(string) | Fn(toastCloseState => string)
