type accordionPanelState = {
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
  index: int,
  @as("open") open_: bool,
  value: array<string>,
  disabled: bool,
  orientation: PositionerTabUtilsTypes.orientation,
}
type collapsiblePanelState = {
  transitionStatus: PositionerTabUtilsTypes.transitionStatus,
  disabled: bool,
  @as("open") open_: bool,
}
type tabsPanelState = {
  hidden: bool,
  orientation: PositionerTabUtilsTypes.orientation,
  tabActivationDirection: PositionerTabUtilsTypes.tabsTabActivationDirection,
}
@unboxed type accordionPanelStyle = Style(JsxDOM.style) | Fn(accordionPanelState => JsxDOM.style)
@unboxed type accordionPanelClassName = Str(string) | Fn(accordionPanelState => string)
@unboxed type collapsiblePanelStyle = Style(JsxDOM.style) | Fn(collapsiblePanelState => JsxDOM.style)
@unboxed type collapsiblePanelClassName = Str(string) | Fn(collapsiblePanelState => string)
@unboxed type tabsPanelStyle = Style(JsxDOM.style) | Fn(tabsPanelState => JsxDOM.style)
@unboxed type tabsPanelClassName = Str(string) | Fn(tabsPanelState => string)
