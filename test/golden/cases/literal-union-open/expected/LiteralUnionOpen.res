type props = {
  position: CommonTypes.toastPositionOrString,
  anchor: LiteralUnionOpenTypes.toastPosition,
}

@module("demo")
external make: React.component<props> = "LiteralUnionOpen"
