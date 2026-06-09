@unboxed type boolOrString = Bool(bool) | Str(string)
module CloseToastFunc = {
  type t
  external asReason: t => (option<boolOrString> => unit) = "%identity"
  external asMouse: t => (ReactEvent.Mouse.t => unit) = "%identity"
}
