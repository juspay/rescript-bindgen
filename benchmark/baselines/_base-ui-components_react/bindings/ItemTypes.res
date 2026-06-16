type accordionItemChangeEventDetails = {
  reason: RootSharedTypes.reason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type accordionItemState = {
  index: int,
  @as("open") open_: bool,
  value: array<string>,
  disabled: bool,
  orientation: PositionerSharedTypes.orientation,
}
type comboboxItemState = {
  disabled: bool,
  selected: bool,
  highlighted: bool,
}
type menuItemState = {
  disabled: bool,
  highlighted: bool,
}
@unboxed type accordionItemStyle = Style(JsxDOM.style) | Fn(accordionItemState => JsxDOM.style)
@unboxed type accordionItemClassName = Str(string) | Fn(accordionItemState => string)
@unboxed type comboboxItemClassName = Str(string) | Fn(comboboxItemState => string)
@unboxed type comboboxItemStyle = Style(JsxDOM.style) | Fn(comboboxItemState => JsxDOM.style)
@unboxed type menuItemStyle = Style(JsxDOM.style) | Fn(menuItemState => JsxDOM.style)
@unboxed type menuItemClassName = Str(string) | Fn(menuItemState => string)
