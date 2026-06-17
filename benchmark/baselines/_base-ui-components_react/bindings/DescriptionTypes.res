type toastDescriptionState = {
  @as("type") type_?: string,
}
@unboxed type toastDescriptionStyle = Style(JsxDOM.style) | Fn(toastDescriptionState => JsxDOM.style)
@unboxed type toastDescriptionClassName = Str(string) | Fn(toastDescriptionState => string)
