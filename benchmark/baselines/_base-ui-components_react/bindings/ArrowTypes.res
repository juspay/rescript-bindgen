type comboboxArrowState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  uncentered: bool,
}
type selectArrowState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.positionerSelectPositionerStateSide,
  align: PositionerSharedTypes.align,
  uncentered: bool,
}
type toastArrowState = {
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  uncentered: bool,
}
@unboxed type comboboxArrowStyle = Style(JsxDOM.style) | Fn(comboboxArrowState => option<JsxDOM.style>)
@unboxed type comboboxArrowClassName = Str(string) | Fn(comboboxArrowState => option<string>)
@unboxed type selectArrowStyle = Style(JsxDOM.style) | Fn(selectArrowState => option<JsxDOM.style>)
@unboxed type selectArrowClassName = Str(string) | Fn(selectArrowState => option<string>)
@unboxed type toastArrowStyle = Style(JsxDOM.style) | Fn(toastArrowState => option<JsxDOM.style>)
@unboxed type toastArrowClassName = Str(string) | Fn(toastArrowState => option<string>)
