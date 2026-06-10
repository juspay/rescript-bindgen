type menuCheckboxItemIndicatorState = {
  checked: bool,
  disabled: bool,
  highlighted: bool,
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
}
@unboxed type menuCheckboxItemIndicatorStyle = Style(JsxDOM.style) | Fn(menuCheckboxItemIndicatorState => JsxDOM.style)
@unboxed type menuCheckboxItemIndicatorClassName = Str(string) | Fn(menuCheckboxItemIndicatorState => string)
