type toastActionState = {
  @as("type") type_: string,
}
@unboxed type toastActionStyle = Style(JsxDOM.style) | Fn(toastActionState => JsxDOM.style)
@unboxed type toastActionClassName = Str(string) | Fn(toastActionState => string)
