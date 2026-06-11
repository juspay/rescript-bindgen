type scrollAreaThumbState = {
  orientation?: RootSharedTypes.orientation2,
}
@unboxed type scrollAreaThumbStyle = Style(JsxDOM.style) | Fn(scrollAreaThumbState => JsxDOM.style)
@unboxed type scrollAreaThumbClassName = Str(string) | Fn(scrollAreaThumbState => string)
