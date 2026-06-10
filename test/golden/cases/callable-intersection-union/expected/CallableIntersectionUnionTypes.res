type alphaState = {
  @as("open") open_: bool,
}
type betaState = {
  checked: bool,
}
@unboxed type alphaClassName = Str(string) | Fn(alphaState => string)
@unboxed type alphaStyle = Style(JsxDOM.style) | Fn(alphaState => JsxDOM.style)
@unboxed type betaClassName = Str(string) | Fn(betaState => string)
@unboxed type betaStyle = Style(JsxDOM.style) | Fn(betaState => JsxDOM.style)
