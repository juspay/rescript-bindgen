type menuCheckboxItemIndicatorState = {
  checked: bool,
  disabled: bool,
  highlighted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type menuCheckboxItemIndicatorStyle = Style(JsxDOM.style) | Fn(menuCheckboxItemIndicatorState => option<JsxDOM.style>)
@unboxed type menuCheckboxItemIndicatorClassName = Str(string) | Fn(menuCheckboxItemIndicatorState => option<string>)
