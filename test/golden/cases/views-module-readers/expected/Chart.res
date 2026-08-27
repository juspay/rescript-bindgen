type props = {
  filteredItems?: array<ViewsModuleReadersTypes.ViewsModuleReadersFilteredItems.t>,  // ⓘ was `readonly any[] | readonly Group<any>[]` — opaque; build with ViewsModuleReadersFilteredItems.fromTypeVar / ViewsModuleReadersFilteredItems.fromGroup
  borderRadius?: ViewsModuleReadersTypes.BorderRadius.t,  // ⓘ was `BorderRadius` — opaque; build with BorderRadius.fromString / BorderRadius.fromNumber / BorderRadius.fromNamedA / BorderRadius.fromNamedB
  primArr?: ViewsModuleReadersTypes.PrimArr.t,  // ⓘ was `PrimArr` — opaque; build with PrimArr.fromNamedA / PrimArr.fromNamedB / PrimArr.fromArray
  nestArr?: ViewsModuleReadersTypes.NestArr.t,  // ⓘ was `NestArr` — opaque; build with NestArr.fromNamedA / NestArr.fromNamedB / NestArr.fromArrays
  numArm?: ViewsModuleReadersTypes.NumArm.t,  // ⓘ was `NumArm` — opaque; build with NumArm.fromNumber / NumArm.fromNamedA / NumArm.fromNamedB
  boolArm?: ViewsModuleReadersTypes.BoolArm.t,  // ⓘ was `BoolArm` — opaque; build with BoolArm.fromBool / BoolArm.fromNamedA / BoolArm.fromNamedB
  withLiterals?: ViewsModuleReadersTypes.WithLiterals.t,  // ⓘ was `WithLiterals` — opaque; build with WithLiterals.fromNamedA / WithLiterals.fromNamedB / WithLiterals.auto / WithLiterals.none
  withTagRun?: ViewsModuleReadersTypes.WithTagRun.t,  // ⓘ was `WithTagRun` — opaque; build with WithTagRun.fromNamedA / WithTagRun.fromNamedB / WithTagRun.fromTag
  onBorderRadius?: ViewsModuleReadersTypes.BorderRadius.t => unit,  // ⓘ was `BorderRadius` — opaque; build with BorderRadius.fromString / BorderRadius.fromNumber / BorderRadius.fromNamedA / BorderRadius.fromNamedB
  onPrimArr?: ViewsModuleReadersTypes.PrimArr.t => unit,  // ⓘ was `PrimArr` — opaque; build with PrimArr.fromNamedA / PrimArr.fromNamedB / PrimArr.fromArray
}

@module("demo")
external make: React.component<props> = "Chart"
