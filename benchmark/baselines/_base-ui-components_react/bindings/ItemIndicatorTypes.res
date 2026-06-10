type comboboxItemIndicatorState = {
  selected: bool,
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
}
@unboxed type comboboxItemIndicatorStyle = Style(JsxDOM.style) | Fn(comboboxItemIndicatorState => JsxDOM.style)
@unboxed type comboboxItemIndicatorClassName = Str(string) | Fn(comboboxItemIndicatorState => string)
