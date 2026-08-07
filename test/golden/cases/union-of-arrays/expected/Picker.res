type props = {
  presets?: array<UnionOfArraysTypes.PresetsConfig.t>,  // ⓘ was `PresetsConfig` — opaque; build with PresetsConfig.fromPreset / PresetsConfig.fromRangeConfig / PresetsConfig.fromRangeDefinition
  presetsSingle?: array<UnionOfArraysTypes.PresetsConfig.t>,  // ⓘ was `PresetsConfig` — opaque; build with PresetsConfig.fromPreset / PresetsConfig.fromRangeConfig / PresetsConfig.fromRangeDefinition
}

@module("demo")
external make: React.component<props> = "Picker"
