type interactionType =
  | @as("mouse") Mouse
  | @as("touch") Touch
  | @as("keyboard") Keyboard
module FinalFocusTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external asBool: t => (bool) = "%identity"
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
@unboxed type vendorViewsFinalFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(interactionType => FinalFocusTarget.t)
