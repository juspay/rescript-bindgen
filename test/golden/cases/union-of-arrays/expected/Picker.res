@module("demo") @react.component
external make: (
  ~presets: array<UnionOfArraysTypes.PresetsConfig.t>=?,  // ⓘ was `PresetsConfig` — opaque; build with PresetsConfig.fromPreset / PresetsConfig.fromRangeConfig / PresetsConfig.fromRangeDefinition
) => React.element = "Picker"
