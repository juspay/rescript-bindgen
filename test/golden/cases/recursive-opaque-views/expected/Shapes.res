type props = {
  shape?: RecursiveOpaqueViewsTypes.Shape.t,  // ⓘ was `Shape` — opaque; build with Shape.fromRecursiveOpaqueViewsShapeConfig / Shape.fromRecursiveOpaqueViewsShapeNestedConfig
}

@module("demo")
external make: React.component<props> = "Shapes"
