type props = {
  other?: RecursiveOpaqueViewsTypes.Shape.t,  // ⓘ was `Shape` — opaque; build with Shape.fromRecursiveOpaqueViewsShapeConfig / Shape.fromRecursiveOpaqueViewsShapeNestedConfig
  list?: array<RecursiveOpaqueViewsTypes.Shape.t>,  // ⓘ was `Shape` — opaque; build with Shape.fromRecursiveOpaqueViewsShapeConfig / Shape.fromRecursiveOpaqueViewsShapeNestedConfig
}

@module("demo")
external make: React.component<props> = "ShapesToo"
