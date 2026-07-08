@module("demo") @react.component
external make: (
  ~events: ComponentsTypes.eventsObj=?,
) => React.element = "Shallow"
