type props = {
  preset?: OpaqueModulesTypes.OpaqueModulesPreset.t,  // ⓘ was `DateRangePreset | CustomConfig | CustomDefinition` — opaque; build with OpaqueModulesPreset.fromDateRangePreset / OpaqueModulesPreset.fromCustomConfig / OpaqueModulesPreset.fromCustomDefinition
  boundary?: OpaqueModulesTypes.OpaqueModulesBoundary.t,  // ⓘ was `Element | Element[]` — opaque; build with OpaqueModulesBoundary.fromElement / OpaqueModulesBoundary.fromElements
}

@module("demo")
external make: React.component<props> = "OpaqueModules"
