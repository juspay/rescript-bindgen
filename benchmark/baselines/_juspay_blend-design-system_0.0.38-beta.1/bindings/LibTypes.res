type dateTimeFormatOptionsLib = {
  ...JsxDOM.domProps,
}
@unboxed type stringOrDateTimeFormatOptions = Str(string) | DateTimeFormatOptions(dateTimeFormatOptionsLib)
