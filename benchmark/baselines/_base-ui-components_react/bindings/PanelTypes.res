type accordionPanelState = {
  transitionStatus: PositionerSharedTypes.transitionStatus,
  index: int,
  @as("open") open_: bool,
  value: array<string>,  // 🛑 BROKEN — contains `any`
  disabled: bool,
  orientation: PositionerSharedTypes.orientation,
}
type collapsiblePanelState = {
  transitionStatus: PositionerSharedTypes.transitionStatus,
  disabled: bool,
  @as("open") open_: bool,
}
type tabsPanelState = {
  hidden: bool,
  orientation: PositionerSharedTypes.orientation,
  tabActivationDirection: PositionerSharedTypes.tabsTabActivationDirection,
}
@unboxed type accordionPanelStyle = Style(JsxDOM.style) | Fn(accordionPanelState => option<JsxDOM.style>)
@unboxed type accordionPanelClassName = Str(string) | Fn(accordionPanelState => option<string>)
@unboxed type collapsiblePanelStyle = Style(JsxDOM.style) | Fn(collapsiblePanelState => option<JsxDOM.style>)
@unboxed type collapsiblePanelClassName = Str(string) | Fn(collapsiblePanelState => option<string>)
@unboxed type tabsPanelStyle = Style(JsxDOM.style) | Fn(tabsPanelState => option<JsxDOM.style>)
@unboxed type tabsPanelClassName = Str(string) | Fn(tabsPanelState => option<string>)
