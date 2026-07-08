type cssObject = {
  backgroundColor?: string,
  color?: string,
}
@set_index external cssObjectSet: (cssObject, string, CommonTypes.boolOrStringOrNumber) => unit = ""
