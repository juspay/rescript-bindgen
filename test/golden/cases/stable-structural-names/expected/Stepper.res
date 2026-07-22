type props = {
  tokens: StableStructuralNamesTypes.stableStructuralNamesTokensConfig,
  textColumn: StableStructuralNamesTypes.textColumn,
  dateColumn: StableStructuralNamesTypes.dateColumn,
  items: array<StableStructuralNamesTypes.StableStructuralNamesItems.t>,  // ⓘ was `{ kind: "text"; label: string; } | { kind: "icon"; glyph: string; }` — opaque; build with StableStructuralNamesItems.fromStableStructuralNamesItemsTextConfig / StableStructuralNamesItems.fromStableStructuralNamesItemsIconConfig
}

@module("demo")
external make: React.component<props> = "Stepper"
