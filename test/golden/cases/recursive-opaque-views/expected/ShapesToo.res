type props = {
  other?: string,  // ⚪ loose — was `Shape`
  list?: array<RecursiveOpaqueViewsTypes.Shape.t>,  // ⓘ was `Shape` — opaque; build with Shape.fromRecursiveOpaqueViewsShapeConfig / Shape.fromRecursiveOpaqueViewsShapeNestedConfig
}

@module("demo")
external make: React.component<props> = "ShapesToo"
