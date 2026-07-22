type props = {
  presets?: array<UnionOfArraysTypes.PresetsConfig.t>,  // ⓘ was `PresetsConfig` — opaque; build with PresetsConfig.fromPreset / PresetsConfig.fromRangeConfig / PresetsConfig.fromRangeDefinition
  presetsSingle?: array<UnionOfArraysTypes.PresetsConfigSingle.t>,  // ⓘ was `Preset | RangeConfig | RangeDefinition` — opaque; build with PresetsConfigSingle.fromPreset / PresetsConfigSingle.fromRangeConfig / PresetsConfigSingle.fromRangeDefinition
}

@module("demo")
external make: React.component<props> = "Picker"
