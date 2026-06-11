type separatorState = {
  orientation: PositionerSharedTypes.orientation,
}
@unboxed type separatorStyle = Style(JsxDOM.style) | Fn(separatorState => JsxDOM.style)
@unboxed type separatorClassName = Str(string) | Fn(separatorState => string)
