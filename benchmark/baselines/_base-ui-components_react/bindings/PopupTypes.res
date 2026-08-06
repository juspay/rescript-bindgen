type comboboxPopupState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  anchorHidden: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  empty: bool,
}
type dialogPopupState = {
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  nested: bool,
  nestedDialogOpen: bool,
}
type menuPopupState = {
  transitionStatus: PositionerSharedTypes.transitionStatus,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  @as("open") open_: bool,
  nested: bool,
}
type navigationMenuPopupState = {
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type popoverPopupState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type selectPopupState = {
  side: PositionerSharedTypes.positionerSelectPositionerStateSide,
  align: PositionerSharedTypes.align,
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type tooltipPopupState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  instant?: RootSharedTypes.rootTooltipStoreUseSyncedValuesInstantType,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
module InitialFocusTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external asBool: t => (bool) = "%identity"
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
@unboxed type popupInitialFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(PositionerSharedTypes.interactionType => InitialFocusTarget.t)
@unboxed type popupFinalFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(PositionerSharedTypes.interactionType => InitialFocusTarget.t)
@unboxed type comboboxPopupStyle = Style(JsxDOM.style) | Fn(comboboxPopupState => option<JsxDOM.style>)
@unboxed type comboboxPopupClassName = Str(string) | Fn(comboboxPopupState => option<string>)
@unboxed type dialogPopupStyle = Style(JsxDOM.style) | Fn(dialogPopupState => option<JsxDOM.style>)
@unboxed type dialogPopupClassName = Str(string) | Fn(dialogPopupState => option<string>)
@unboxed type menuPopupStyle = Style(JsxDOM.style) | Fn(menuPopupState => option<JsxDOM.style>)
@unboxed type menuPopupClassName = Str(string) | Fn(menuPopupState => option<string>)
@unboxed type navigationMenuPopupStyle = Style(JsxDOM.style) | Fn(navigationMenuPopupState => option<JsxDOM.style>)
@unboxed type navigationMenuPopupClassName = Str(string) | Fn(navigationMenuPopupState => option<string>)
@unboxed type popoverPopupStyle = Style(JsxDOM.style) | Fn(popoverPopupState => option<JsxDOM.style>)
@unboxed type popoverPopupClassName = Str(string) | Fn(popoverPopupState => option<string>)
@unboxed type selectPopupStyle = Style(JsxDOM.style) | Fn(selectPopupState => option<JsxDOM.style>)
@unboxed type selectPopupClassName = Str(string) | Fn(selectPopupState => option<string>)
@unboxed type tooltipPopupStyle = Style(JsxDOM.style) | Fn(tooltipPopupState => option<JsxDOM.style>)
@unboxed type tooltipPopupClassName = Str(string) | Fn(tooltipPopupState => option<string>)
