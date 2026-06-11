type comboboxItemIndicatorState = {
  selected: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type comboboxItemIndicatorStyle = Style(JsxDOM.style) | Fn(comboboxItemIndicatorState => JsxDOM.style)
@unboxed type comboboxItemIndicatorClassName = Str(string) | Fn(comboboxItemIndicatorState => string)
