type checkboxIndicatorState = {
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
  checked: bool,
  disabled: bool,
  readOnly: bool,
  required: bool,
  indeterminate: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type radioIndicatorState = {
  checked: bool,
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
}
type tabsIndicatorState = {
  activeTabPosition: PositionerTabUtilsTypes.tabsTabPosition,
  activeTabSize: PositionerTabUtilsTypes.anchorConfig,
  orientation: PositionerTabUtilsTypes.orientation,
  tabActivationDirection: PositionerTabUtilsTypes.tabsTabActivationDirection,
}
@unboxed type checkboxIndicatorStyle = Style(JsxDOM.style) | Fn(checkboxIndicatorState => JsxDOM.style)
@unboxed type checkboxIndicatorClassName = Str(string) | Fn(checkboxIndicatorState => string)
@unboxed type radioIndicatorStyle = Style(JsxDOM.style) | Fn(radioIndicatorState => JsxDOM.style)
@unboxed type radioIndicatorClassName = Str(string) | Fn(radioIndicatorState => string)
@unboxed type tabsIndicatorStyle = Style(JsxDOM.style) | Fn(tabsIndicatorState => JsxDOM.style)
@unboxed type tabsIndicatorClassName = Str(string) | Fn(tabsIndicatorState => string)
