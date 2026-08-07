type selectValueState = {
  value: string,  // 🛑 BROKEN — contains `any`
}
@unboxed type selectValueClassName = Str(string) | Fn(selectValueState => option<string>)
@unboxed type selectValueStyle = Style(JsxDOM.style) | Fn(selectValueState => option<JsxDOM.style>)
