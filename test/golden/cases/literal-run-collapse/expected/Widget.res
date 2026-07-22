type props = {
  wrapper?: LiteralRunCollapseTypes.WrapperLike.t,  // ⓘ was `WrapperLike` — opaque; build with WrapperLike.fromTag / WrapperLike.fromCompClass / WrapperLike.fromCompFn
}

@module("demo")
external make: React.component<props> = "Widget"
