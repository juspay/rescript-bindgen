@module("demo") @react.component
external make: (
  ~tokens: StableStructuralNamesTypes.stableStructuralNamesTokensConfig,
  ~textColumn: StableStructuralNamesTypes.textColumn,
  ~dateColumn: StableStructuralNamesTypes.dateColumn,
  ~items: array<StableStructuralNamesTypes.Items.t>,  // ⓘ was `{ kind: "text"; label: string; } | { kind: "icon"; glyph: string; }` — opaque; build with Items.fromStableStructuralNamesItemsTextConfig / Items.fromStableStructuralNamesItemsIconConfig
) => React.element = "Stepper"
