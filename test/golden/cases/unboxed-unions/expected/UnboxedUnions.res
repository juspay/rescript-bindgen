type props = {
  width?: CommonTypes.stringOrNumber,
  tags?: CommonTypes.stringOrStringArray,
  checked?: CommonTypes.boolOrIndeterminate,
  itemHeight?: CommonTypes.unboxedUnionsItemHeight,
}

@module("demo")
external make: React.component<props> = "UnboxedUnions"
