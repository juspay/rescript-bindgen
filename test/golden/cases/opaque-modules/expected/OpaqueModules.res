@module("demo") @react.component
external make: (
  ~preset: OpaqueModulesTypes.Preset.t=?,  // ⓘ was `DateRangePreset | CustomConfig | CustomDefinition` — opaque; build with Preset.fromDateRangePreset / Preset.fromCustomConfig / Preset.fromCustomDefinition
  ~boundary: OpaqueModulesTypes.Boundary.t=?,  // ⓘ was `Element | Element[]` — opaque; build with Boundary.fromElement / Boundary.fromElements
) => React.element = "OpaqueModules"
