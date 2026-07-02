@module("demo") @react.component
external make: (
  ~handlers: UnionOfMapsTypes.UnionOfMapsHandlers.t=?,  // ⓘ was `Map<string, OnClick> | Map<string, OnHover>` — opaque; build with UnionOfMapsHandlers.fromMapOnClick / UnionOfMapsHandlers.fromMapOnHover
) => React.element = "Handlers"
