@module("demo") @react.component
external make: (
  ~preset: OpaqueModulesTypes.OpaqueModulesPreset.t=?,  // ⓘ was `DateRangePreset | CustomConfig | CustomDefinition` — opaque; build with OpaqueModulesPreset.fromDateRangePreset / OpaqueModulesPreset.fromCustomConfig / OpaqueModulesPreset.fromCustomDefinition
  ~boundary: OpaqueModulesTypes.OpaqueModulesBoundary.t=?,  // ⓘ was `Element | Element[]` — opaque; build with OpaqueModulesBoundary.fromElement / OpaqueModulesBoundary.fromElements
) => React.element = "OpaqueModules"
