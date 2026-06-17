type dialogViewportState = {
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  nested: bool,
  nestedDialogOpen: bool,
}
type state = {
  activationDirection?: string,
}
type scrollAreaViewportState = {
  hasOverflowX: bool,
  hasOverflowY: bool,
  overflowXStart: bool,
  overflowXEnd: bool,
  overflowYStart: bool,
  overflowYEnd: bool,
  cornerHidden: bool,
}
type toastViewportState = {
  expanded: bool,
}
@unboxed type dialogViewportStyle = Style(JsxDOM.style) | Fn(dialogViewportState => JsxDOM.style)
@unboxed type dialogViewportClassName = Str(string) | Fn(dialogViewportState => string)
@unboxed type stateStyle = Style(JsxDOM.style) | Fn(state => JsxDOM.style)
@unboxed type stateClassName = Str(string) | Fn(state => string)
@unboxed type scrollAreaViewportStyle = Style(JsxDOM.style) | Fn(scrollAreaViewportState => JsxDOM.style)
@unboxed type scrollAreaViewportClassName = Str(string) | Fn(scrollAreaViewportState => string)
@unboxed type toastViewportStyle = Style(JsxDOM.style) | Fn(toastViewportState => JsxDOM.style)
@unboxed type toastViewportClassName = Str(string) | Fn(toastViewportState => string)
