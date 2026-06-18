@module("demo") @react.component
external make: (
  ~presets: array<UnionOfArraysTypes.PresetsConfig.t>=?,  // ⓘ was `PresetsConfig` — opaque; build with PresetsConfig.fromPreset / PresetsConfig.fromRangeConfig / PresetsConfig.fromRangeDefinition
  ~presetsSingle: array<UnionOfArraysTypes.PresetsConfigSingle.t>=?,  // ⓘ was `Preset | RangeConfig | RangeDefinition` — opaque; build with PresetsConfigSingle.fromPreset / PresetsConfigSingle.fromRangeConfig / PresetsConfigSingle.fromRangeDefinition
) => React.element = "Picker"
