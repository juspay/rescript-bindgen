type reg = {
  cb: unit => unit,
}
@set_index external regSet: (reg, string, JsFn.t) => unit = ""
