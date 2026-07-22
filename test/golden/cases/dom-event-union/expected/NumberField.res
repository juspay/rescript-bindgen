type props = {
  onValueChange?: (float, DomEventUnionTypes.fieldChangeDetails) => unit,
}

@module("demo")
external make: React.component<props> = "NumberField"
