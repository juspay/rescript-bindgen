type toastTitleState = {
  @as("type") type_: string,
}
@unboxed type toastTitleStyle = Style(JsxDOM.style) | Fn(toastTitleState => JsxDOM.style)
@unboxed type toastTitleClassName = Str(string) | Fn(toastTitleState => string)
