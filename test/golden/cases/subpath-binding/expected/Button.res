@module("demo") @react.component
external make: (
  ~theme: SubpathBindingTypes.theme=?,
  ~label: string,
) => React.element = "Button"
