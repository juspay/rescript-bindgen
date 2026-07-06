type orientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type transitionStatus =
  | @as("starting") Starting
  | @as("ending") Ending
  | @as("idle") Idle
type interactionType =
  | @as("") Value
  | @as("keyboard") Keyboard
  | @as("touch") Touch
  | @as("mouse") Mouse
  | @as("pen") Pen
type side =
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("top") Top
  | @as("inline-end") InlineEnd
  | @as("inline-start") InlineStart
type align =
  | @as("center") Center
  | @as("end") End
  | @as("start") Start
type positionerPositionMethod =
  | @as("fixed") Fixed
  | @as("absolute") Absolute
type positionerSideFlipModeSide =
  | @as("none") None
  | @as("flip") Flip
type positionerSideFlipModeAlign =
  | @as("none") None
  | @as("flip") Flip
  | @as("shift") Shift
type positionerSideFlipModeFallbackAxisSide =
  | @as("none") None
  | @as("end") End
  | @as("start") Start
type positionerSideShiftModeSide =
  | @as("none") None
  | @as("shift") Shift
type positionerSelectPositionerStateSide =
  | @as("none") None
  | @as("left") Left
  | @as("right") Right
  | @as("bottom") Bottom
  | @as("top") Top
  | @as("inline-end") InlineEnd
  | @as("inline-start") InlineStart
type tabsTabActivationDirection =
  | @as("none") None
  | @as("left") Left
  | @as("right") Right
  | @as("up") Up
  | @as("down") Down
type baseUIEvent = {
  ...JsxDOM.domProps,
  preventBaseUIHandler: unit => unit,
  baseUIHandlerPrevented?: bool,
}
type htmlProps = {
  ref?: React.ref<Nullable.t<Dom.element>>,
}
type utilsFloatingRootStoreSetOpenConfig = {
  reason: string,
  event: string,  // ⚪ loose — was `Event`
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: string,  // ⚪ loose — was `Element`
}
type group<'f> = {
  value: JSON.t,
  items: array<'f>,
}
type utilsOnCheckedChangeConfig = {
  reason: string,  // ⚪ loose — was `"none"`
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type utilsSideOffsetAnchorConfig = {
  width: float,
  height: float,
}
type utilsSideOffsetConfig = {
  side: side,
  align: align,
  anchor: utilsSideOffsetAnchorConfig,
  positioner: utilsSideOffsetAnchorConfig,
}
type sideFlipMode = {
  side?: positionerSideFlipModeSide,
  align?: positionerSideFlipModeAlign,
  fallbackAxisSide?: positionerSideFlipModeFallbackAxisSide,
}
type sideShiftMode = {
  side?: positionerSideShiftModeSide,
  align?: positionerSideShiftModeSide,
  fallbackAxisSide?: positionerSideFlipModeFallbackAxisSide,
}
type comboboxPositionerState = {
  @as("open") open_: bool,
  side: side,
  align: align,
  anchorHidden: bool,
  empty: bool,
}
type utilsOnFormSubmitConfig = {
  reason: string,  // ⚪ loose — was `"none"`
  event: Dom.event,
}
type menuPositionerState = {
  @as("open") open_: bool,
  side: side,
  align: align,
  anchorHidden: bool,
  nested: bool,
}
type navigationMenuPositionerState = {
  @as("open") open_: bool,
  side: side,
  align: align,
  anchorHidden: bool,
  instant: bool,
}
type timeout = {
  currentId: float,
  start: (float, string) => unit,  // ⚪ loose — was `Function`
  isStarted: unit => bool,
  clear: unit => unit,
  disposeEffect: unit => unit => unit,
}
type popoverPositionerState = {
  @as("open") open_: bool,
  side: side,
  align: align,
  anchorHidden: bool,
  instant?: string,
}
type previewCardPositionerState = {
  @as("open") open_: bool,
  side: side,
  align: align,
  anchorHidden: bool,
}
type selectPositionerState = {
  @as("open") open_: bool,
  side: positionerSelectPositionerStateSide,
  align: align,
  anchorHidden: bool,
}
type baseUIChangeEventDetail = {
  reason: string,  // ⚪ loose — was `"none"`
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  activationDirection: tabsTabActivationDirection,
}
type tabsTabPosition = {
  left: float,
  right: float,
  top: float,
  bottom: float,
}
type tabsTabSize = {
  width: float,
  height: float,
}
type tabsTabState = {
  disabled: bool,
  active: bool,
  orientation: orientation,
}
type toastPositionerState = {
  side: side,
  align: align,
  anchorHidden: bool,
}
@unboxed type utilsSideOffsetConfigSideOffset = Num(float) | Fn(utilsSideOffsetConfig => float)
@unboxed type utilsSideOffsetConfigAlignOffset = Num(float) | Fn(utilsSideOffsetConfig => float)
@unboxed type comboboxPositionerStyle = Style(JsxDOM.style) | Fn(comboboxPositionerState => JsxDOM.style)
@unboxed type comboboxPositionerClassName = Str(string) | Fn(comboboxPositionerState => string)
@unboxed type menuPositionerStyle = Style(JsxDOM.style) | Fn(menuPositionerState => JsxDOM.style)
@unboxed type menuPositionerClassName = Str(string) | Fn(menuPositionerState => string)
@unboxed type navigationMenuPositionerStyle = Style(JsxDOM.style) | Fn(navigationMenuPositionerState => JsxDOM.style)
@unboxed type navigationMenuPositionerClassName = Str(string) | Fn(navigationMenuPositionerState => string)
@unboxed type popoverPositionerStyle = Style(JsxDOM.style) | Fn(popoverPositionerState => JsxDOM.style)
@unboxed type popoverPositionerClassName = Str(string) | Fn(popoverPositionerState => string)
@unboxed type previewCardPositionerStyle = Style(JsxDOM.style) | Fn(previewCardPositionerState => JsxDOM.style)
@unboxed type previewCardPositionerClassName = Str(string) | Fn(previewCardPositionerState => string)
@unboxed type selectPositionerStyle = Style(JsxDOM.style) | Fn(selectPositionerState => JsxDOM.style)
@unboxed type selectPositionerClassName = Str(string) | Fn(selectPositionerState => string)
@unboxed type tabsTabStyle = Style(JsxDOM.style) | Fn(tabsTabState => JsxDOM.style)
@unboxed type tabsTabClassName = Str(string) | Fn(tabsTabState => string)
@unboxed type toastPositionerClassName = Str(string) | Fn(toastPositionerState => string)
@unboxed type toastPositionerStyle = Style(JsxDOM.style) | Fn(toastPositionerState => JsxDOM.style)
module RootFilteredItems = {
  type t
  external fromTypeVar: 'e => t = "%identity"
  external fromGroup: group<'f> => t = "%identity"
}
module CollisionAvoidance = {
  type t
  external fromSideFlipMode: sideFlipMode => t = "%identity"
  external fromSideShiftMode: sideShiftMode => t = "%identity"
}
