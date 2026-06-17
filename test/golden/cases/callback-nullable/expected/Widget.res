@module("demo") @react.component
external make: (
  ~onActiveChange: Nullable.t<string> => unit=?,
  ~validate: CallbackNullableTypes.row => Nullable.t<CallbackNullableTypes.row>=?,
) => React.element = "Widget"
