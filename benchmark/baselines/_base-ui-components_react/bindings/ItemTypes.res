type accordionItemChangeEventDetails = {
  reason: RootSharedTypes.rootAccordionRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type accordionItemState = {
  index: int,
  @as("open") open_: bool,
  value: array<string>,  // 🛑 BROKEN — contains `any`
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
@unboxed type accordionItemStyle = Style(JsxDOM.style) | Fn(accordionItemState => option<JsxDOM.style>)
@unboxed type accordionItemClassName = Str(string) | Fn(accordionItemState => option<string>)
@unboxed type comboboxItemClassName = Str(string) | Fn(comboboxItemState => option<string>)
@unboxed type comboboxItemStyle = Style(JsxDOM.style) | Fn(comboboxItemState => option<JsxDOM.style>)
@unboxed type menuItemStyle = Style(JsxDOM.style) | Fn(menuItemState => option<JsxDOM.style>)
@unboxed type menuItemClassName = Str(string) | Fn(menuItemState => option<string>)
