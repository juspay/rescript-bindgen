type selectValueState = {
  value: string,  // 🛑 BROKEN — contains `any`
}
@unboxed type selectValueClassName = Str(string) | Fn(selectValueState => string)
@unboxed type selectValueStyle = Style(JsxDOM.style) | Fn(selectValueState => JsxDOM.style)
