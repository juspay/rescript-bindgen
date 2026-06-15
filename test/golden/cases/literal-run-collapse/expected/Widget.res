@module("demo") @react.component
external make: (
  ~wrapper: LiteralRunCollapseTypes.WrapperLike.t=?,  // ⓘ was `WrapperLike` — opaque; build with WrapperLike.fromTag / WrapperLike.fromCompClass / WrapperLike.fromCompFn
) => React.element = "Widget"
