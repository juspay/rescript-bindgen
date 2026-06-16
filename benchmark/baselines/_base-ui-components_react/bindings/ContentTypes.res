type activationDirection =
  | @as("left") Left
  | @as("right") Right
  | @as("up") Up
  | @as("down") Down
type navigationMenuContentState = {
  @as("open") open_: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  activationDirection: activationDirection,
}
type scrollAreaContentState = {
  hasOverflowX: bool,
  hasOverflowY: bool,
  overflowXStart: bool,
  overflowXEnd: bool,
  overflowYStart: bool,
  overflowYEnd: bool,
  cornerHidden: bool,
}
type toastContentState = {
  expanded: bool,
  behind: bool,
}
@unboxed type navigationMenuContentStyle = Style(JsxDOM.style) | Fn(navigationMenuContentState => JsxDOM.style)
@unboxed type navigationMenuContentClassName = Str(string) | Fn(navigationMenuContentState => string)
@unboxed type scrollAreaContentStyle = Style(JsxDOM.style) | Fn(scrollAreaContentState => JsxDOM.style)
@unboxed type scrollAreaContentClassName = Str(string) | Fn(scrollAreaContentState => string)
@unboxed type leftOrRightOrUpOrDownOrActivationDirectionArray = @as("left") Left | @as("right") Right | @as("up") Up | @as("down") Down | Arr(array<activationDirection>)
@unboxed type toastContentStyle = Style(JsxDOM.style) | Fn(toastContentState => JsxDOM.style)
@unboxed type toastContentClassName = Str(string) | Fn(toastContentState => string)
