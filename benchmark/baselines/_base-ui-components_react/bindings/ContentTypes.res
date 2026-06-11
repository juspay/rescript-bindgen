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
type toastContentState = {
  expanded: bool,
  behind: bool,
}
@unboxed type navigationMenuContentStyle = Style(JsxDOM.style) | Fn(navigationMenuContentState => JsxDOM.style)
@unboxed type navigationMenuContentClassName = Str(string) | Fn(navigationMenuContentState => string)
@unboxed type leftOrRightOrUpOrDownOrActivationDirectionArray = @as("left") Left | @as("right") Right | @as("up") Up | @as("down") Down | Arr(array<activationDirection>)
@unboxed type toastContentStyle = Style(JsxDOM.style) | Fn(toastContentState => JsxDOM.style)
@unboxed type toastContentClassName = Str(string) | Fn(toastContentState => string)
