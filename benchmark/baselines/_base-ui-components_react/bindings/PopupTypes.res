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
type popoverPopupState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type selectPopupState = {
  side: PositionerSharedTypes.side4,
  align: PositionerSharedTypes.align,
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
type tooltipPopupState = {
  @as("open") open_: bool,
  side: PositionerSharedTypes.side,
  align: PositionerSharedTypes.align,
  instant: RootSharedTypes.instantType3,
  transitionStatus: PositionerSharedTypes.transitionStatus,
}
@unboxed type comboboxPopupStyle = Style(JsxDOM.style) | Fn(comboboxPopupState => JsxDOM.style)
@unboxed type comboboxPopupClassName = Str(string) | Fn(comboboxPopupState => string)
@unboxed type dialogPopupStyle = Style(JsxDOM.style) | Fn(dialogPopupState => JsxDOM.style)
@unboxed type dialogPopupClassName = Str(string) | Fn(dialogPopupState => string)
@unboxed type menuPopupStyle = Style(JsxDOM.style) | Fn(menuPopupState => JsxDOM.style)
@unboxed type menuPopupClassName = Str(string) | Fn(menuPopupState => string)
@unboxed type popoverPopupStyle = Style(JsxDOM.style) | Fn(popoverPopupState => JsxDOM.style)
@unboxed type popoverPopupClassName = Str(string) | Fn(popoverPopupState => string)
@unboxed type selectPopupStyle = Style(JsxDOM.style) | Fn(selectPopupState => JsxDOM.style)
@unboxed type selectPopupClassName = Str(string) | Fn(selectPopupState => string)
@unboxed type tooltipPopupStyle = Style(JsxDOM.style) | Fn(tooltipPopupState => JsxDOM.style)
@unboxed type tooltipPopupClassName = Str(string) | Fn(tooltipPopupState => string)
