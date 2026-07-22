type props = {
  items: array<BigintTypes.virtualItemShape>,
  nb?: CommonTypes.numberOrBigInt,
  control?: CommonTypes.stringOrNumber,
}

@module("demo")
external make: React.component<props> = "Widget"
