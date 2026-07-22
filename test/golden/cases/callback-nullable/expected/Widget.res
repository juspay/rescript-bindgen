type props = {
  onActiveChange?: Nullable.t<string> => unit,
  validate?: CallbackNullableTypes.row => Nullable.t<CallbackNullableTypes.row>,
}

@module("demo")
external make: React.component<props> = "Widget"
