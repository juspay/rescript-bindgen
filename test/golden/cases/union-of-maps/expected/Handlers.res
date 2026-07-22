type props = {
  handlers?: UnionOfMapsTypes.UnionOfMapsHandlers.t,  // ⓘ was `Map<string, OnClick> | Map<string, OnHover>` — opaque; build with UnionOfMapsHandlers.fromMapOnClick / UnionOfMapsHandlers.fromMapOnHover
}

@module("demo")
external make: React.component<props> = "Handlers"
