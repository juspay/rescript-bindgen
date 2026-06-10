type comboboxArrowState = {
  @as("open") open_: bool,
  side: PositionerTabUtilsTypes.side,
  align: PositionerTabUtilsTypes.align,
  uncentered: bool,
}
type selectArrowState = {
  @as("open") open_: bool,
  side: PositionerTabUtilsTypes.side4,
  align: PositionerTabUtilsTypes.align,
  uncentered: bool,
}
type toastArrowState = {
  side: PositionerTabUtilsTypes.side,
  align: PositionerTabUtilsTypes.align,
  uncentered: bool,
}
@unboxed type comboboxArrowStyle = Style(JsxDOM.style) | Fn(comboboxArrowState => JsxDOM.style)
@unboxed type comboboxArrowClassName = Str(string) | Fn(comboboxArrowState => string)
@unboxed type selectArrowStyle = Style(JsxDOM.style) | Fn(selectArrowState => JsxDOM.style)
@unboxed type selectArrowClassName = Str(string) | Fn(selectArrowState => string)
@unboxed type toastArrowStyle = Style(JsxDOM.style) | Fn(toastArrowState => JsxDOM.style)
@unboxed type toastArrowClassName = Str(string) | Fn(toastArrowState => string)
