type checkboxIndicatorState = {
  transitionStatus: PositionerSharedTypes.transitionStatus,
  checked: bool,
  disabled: bool,
  readOnly: bool,
  required: bool,
  indeterminate: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type radioIndicatorState = {
  checked: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type tabsIndicatorState = {
  activeTabPosition: Nullable.t<PositionerSharedTypes.tabsTabPosition>,
  activeTabSize: Nullable.t<PositionerSharedTypes.tabsTabSize>,
  orientation: PositionerSharedTypes.orientation,
  tabActivationDirection: PositionerSharedTypes.tabsTabActivationDirection,
}
@unboxed type checkboxIndicatorStyle = Style(JsxDOM.style) | Fn(checkboxIndicatorState => JsxDOM.style)
@unboxed type checkboxIndicatorClassName = Str(string) | Fn(checkboxIndicatorState => string)
@unboxed type radioIndicatorStyle = Style(JsxDOM.style) | Fn(radioIndicatorState => JsxDOM.style)
@unboxed type radioIndicatorClassName = Str(string) | Fn(radioIndicatorState => string)
@unboxed type tabsIndicatorStyle = Style(JsxDOM.style) | Fn(tabsIndicatorState => JsxDOM.style)
@unboxed type tabsIndicatorClassName = Str(string) | Fn(tabsIndicatorState => string)
