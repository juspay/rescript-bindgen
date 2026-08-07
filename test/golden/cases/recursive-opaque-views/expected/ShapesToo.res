type props = {
  other?: string,  // ⚪ loose — was `Shape`
  list?: array<RecursiveOpaqueViewsTypes.Shape.t>,  // ⓘ was `Shape` — opaque; build with Shape.fromRecursiveOpaqueViewsListConfig / Shape.fromRecursiveOpaqueViewsListConfig2
}

@module("demo")
external make: React.component<props> = "ShapesToo"
