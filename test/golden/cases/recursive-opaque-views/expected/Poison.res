type props = {
  root?: RecursiveOpaqueViewsTypes.Poisoned.t,  // ⓘ was `Poisoned` — opaque; build with Poisoned.fromRecursiveOpaqueViewsRootConfig / Poisoned.fromRecursiveOpaqueViewsRootChildrenBadConfig
  roots?: array<RecursiveOpaqueViewsTypes.Poisoned.t>,  // ⓘ was `Poisoned` — opaque; build with Poisoned.fromRecursiveOpaqueViewsRootConfig / Poisoned.fromRecursiveOpaqueViewsRootChildrenBadConfig
}

@module("demo")
external make: React.component<props> = "Poison"
