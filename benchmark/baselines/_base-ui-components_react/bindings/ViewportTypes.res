type state = {
  activationDirection?: string,
}
type toastViewportState = {
  expanded: bool,
}
@unboxed type stateStyle = Style(JsxDOM.style) | Fn(state => JsxDOM.style)
@unboxed type stateClassName = Str(string) | Fn(state => string)
@unboxed type toastViewportStyle = Style(JsxDOM.style) | Fn(toastViewportState => JsxDOM.style)
@unboxed type toastViewportClassName = Str(string) | Fn(toastViewportState => string)
