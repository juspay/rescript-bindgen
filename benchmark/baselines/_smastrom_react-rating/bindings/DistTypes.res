type orientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type sizes =
  | @as("none") None
  | @as("small") Small
  | @as("medium") Medium
  | @as("large") Large
  | @as("full") Full
type hF =
  | @as("svg") Svg
  | @as("box") Box
type transitions =
  | @as("none") None
  | @as("zoom") Zoom
  | @as("position") Position
  | @as("opacity") Opacity
  | @as("colors") Colors
type distPreventDefault =
  | @as("none") None
  | @as("click") Click
  | @as("keydown") Keydown
  | @as("all") All
type spacings = {
  ...JsxDOM.domProps,
}
type itemStyles = {
  activeFillColor?: CommonTypes.stringOrStringArray,
  activeStrokeColor?: CommonTypes.stringOrStringArray,
  activeBoxColor?: CommonTypes.stringOrStringArray,
  activeBoxBorderColor?: CommonTypes.stringOrStringArray,
  inactiveFillColor?: string,
  inactiveStrokeColor?: string,
  inactiveBoxColor?: string,
  inactiveBoxBorderColor?: string,
  itemShapes: string,
  itemStrokeWidth?: float,
  boxBorderWidth?: float,
}
