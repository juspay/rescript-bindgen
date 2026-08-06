type scrollAreaThumbState = {
  orientation?: RootSharedTypes.rootOrientation,
}
type sliderThumbState = {
  activeThumbIndex: float,
  disabled: bool,
  dragging: bool,
  max: float,
  min: float,
  minStepsBetweenValues: float,
  orientation: PositionerSharedTypes.orientation,
  step: float,
  values: array<float>,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type switchThumbState = {
  checked: bool,
  disabled: bool,
  readOnly: bool,
  required: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
@unboxed type scrollAreaThumbStyle = Style(JsxDOM.style) | Fn(scrollAreaThumbState => option<JsxDOM.style>)
@unboxed type scrollAreaThumbClassName = Str(string) | Fn(scrollAreaThumbState => option<string>)
@unboxed type sliderThumbClassName = Str(string) | Fn(sliderThumbState => option<string>)
@unboxed type sliderThumbStyle = Style(JsxDOM.style) | Fn(sliderThumbState => option<JsxDOM.style>)
@unboxed type switchThumbStyle = Style(JsxDOM.style) | Fn(switchThumbState => option<JsxDOM.style>)
@unboxed type switchThumbClassName = Str(string) | Fn(switchThumbState => option<string>)
