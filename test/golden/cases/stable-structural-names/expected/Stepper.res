@module("demo") @react.component
external make: (
  ~tokens: StableStructuralNamesTypes.stableStructuralNamesTokensConfig,
  ~textColumn: StableStructuralNamesTypes.textColumn,
  ~dateColumn: StableStructuralNamesTypes.dateColumn,
  ~items: array<StableStructuralNamesTypes.StableStructuralNamesItems.t>,  // ⓘ was `{ kind: "text"; label: string; } | { kind: "icon"; glyph: string; }` — opaque; build with StableStructuralNamesItems.fromStableStructuralNamesItemsTextConfig / StableStructuralNamesItems.fromStableStructuralNamesItemsIconConfig
) => React.element = "Stepper"
