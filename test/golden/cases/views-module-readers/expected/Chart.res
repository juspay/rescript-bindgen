type props = {
  filteredItems?: array<ViewsModuleReadersTypes.ViewsModuleReadersFilteredItems.t>,
  borderRadius?: ViewsModuleReadersTypes.BorderRadius.t,
  primArr?: ViewsModuleReadersTypes.PrimArr.t,
  nestArr?: ViewsModuleReadersTypes.NestArr.t,  // ⓘ was `NestArr` — opaque; build with NestArr.fromNamedA / NestArr.fromNamedB / NestArr.fromArrays
  numArm?: ViewsModuleReadersTypes.NumArm.t,
  boolArm?: ViewsModuleReadersTypes.BoolArm.t,  // ⓘ was `BoolArm` — opaque; build with BoolArm.fromBool / BoolArm.fromNamedA / BoolArm.fromNamedB
  withLiterals?: ViewsModuleReadersTypes.WithLiterals.t,  // ⓘ was `WithLiterals` — opaque; build with WithLiterals.fromNamedA / WithLiterals.fromNamedB / WithLiterals.auto / WithLiterals.none
  withTagRun?: ViewsModuleReadersTypes.WithTagRun.t,  // ⓘ was `WithTagRun` — opaque; build with WithTagRun.fromNamedA / WithTagRun.fromNamedB / WithTagRun.fromTag
  onBorderRadius?: ViewsModuleReadersTypes.BorderRadius.t => unit,
  onPrimArr?: ViewsModuleReadersTypes.PrimArr.t => unit,
}

@module("demo")
external make: React.component<props> = "Chart"
