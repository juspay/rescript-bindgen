@module("demo") @react.component
external make: (
  ~handlers: UnionOfMapsTypes.Handlers.t=?,  // ⓘ was `Map<string, OnClick> | Map<string, OnHover>` — opaque; build with Handlers.fromMapOnClick / Handlers.fromMapOnHover
) => React.element = "Handlers"
