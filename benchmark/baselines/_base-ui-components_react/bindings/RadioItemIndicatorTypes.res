type menuRadioItemIndicatorState = {
  checked: bool,
  disabled: bool,
  highlighted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type menuRadioItemIndicatorStyle = Style(JsxDOM.style) | Fn(menuRadioItemIndicatorState => JsxDOM.style)
@unboxed type menuRadioItemIndicatorClassName = Str(string) | Fn(menuRadioItemIndicatorState => string)
