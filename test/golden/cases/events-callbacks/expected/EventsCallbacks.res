type props<'a> = {
  onClick?: ReactEvent.Mouse.t => unit,
  onChange?: ReactEvent.Form.t => unit,
  onKeyDown?: ReactEvent.Keyboard.t => unit,
  onSelect?: (string, float) => unit,
  onSubmit?: unit => 'a,
  onImageError?: JsError.t => unit,
}

@module("demo")
external make: React.component<props<'a>> = "EventsCallbacks"
