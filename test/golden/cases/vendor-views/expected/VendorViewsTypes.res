type interactionType =
  | @as("mouse") Mouse
  | @as("touch") Touch
  | @as("keyboard") Keyboard
module FinalFocusTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external fromHTMLElement: Dom.element => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
@unboxed type finalFocus = Bool(bool) | Ref(React.ref<Nullable.t<Dom.element>>) | Fn(interactionType => FinalFocusTarget.t)
