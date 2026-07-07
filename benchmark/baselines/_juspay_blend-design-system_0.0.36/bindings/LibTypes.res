type event = {
  ...JsxDOM.domProps,
}
@unboxed type stringOrEvent = Str(string) | Event(event)
