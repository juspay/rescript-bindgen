type props = {
  root?: string,  // ⚪ loose — was `Poisoned`
  roots?: array<RecursiveOpaqueViewsTypes.Poisoned.t>,  // ⓘ was `Poisoned` — opaque; build with Poisoned.fromRecursiveOpaqueViewsRootsOkConfig / Poisoned.fromRecursiveOpaqueViewsRootsBadConfig
}

@module("demo")
external make: React.component<props> = "Poison"
