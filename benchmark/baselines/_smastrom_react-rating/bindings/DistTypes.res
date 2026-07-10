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
type distInputPropsPreventDefault =
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
  itemShapes: string,  // 🛑 BROKEN — declared type does not resolve (broken import in the package's .d.ts)
  itemStrokeWidth?: float,
  boxBorderWidth?: float,
}
type sharedProps = {
  value: float,
  items?: CommonTypes.v1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10,
  readOnly?: bool,
  highlightOnlySelected?: bool,
  orientation?: orientation,
  spaceInside?: spacings,
  spaceBetween?: spacings,
  radius?: sizes,
  itemStyles?: itemStyles,
  id?: string,
  className?: string,
  style?: JsxDOM.style,
}
type readOnlyProps = {
  halfFillMode?: hF,
}
type inputProps<'a> = {
  onChange?: float => 'a,
  onHoverChange?: float => unit => unit,
  onBlur?: option<option<option<option<option<option<option<string> => unit> => unit> => unit> => unit> => unit> => unit> => unit,  // ⚪ loose — was `FocusEvent_2`
  onFocus?: option<option<option<option<option<option<option<string> => unit> => unit> => unit> => unit> => unit> => unit> => unit,  // ⚪ loose — was `FocusEvent_2`
  isDisabled?: bool,
  resetOnSecondClick?: bool,
  transition?: transitions,
  isRequired?: bool,
  invisibleLabel?: string,
  invisibleItemLabels?: array<string>,
  visibleLabelId?: string,
  visibleItemLabelIds?: array<string>,
  resetLabel?: string,
  preventDefault?: distInputPropsPreventDefault,
}
