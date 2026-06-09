@module("demo") @react.component
external make: (
  ~onClick: ReactEvent.Mouse.t => unit=?,
  ~onChange: ReactEvent.Form.t => unit=?,
  ~onKeyDown: ReactEvent.Keyboard.t => unit=?,
  ~onSelect: (string, float) => unit=?,
  ~onSubmit: unit => 'a=?,
) => React.element = "EventsCallbacks"
