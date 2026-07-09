type dateRangePreset = {
  id: string,
  label: string,
}
type customConfig = {
  from: string,
  @as("to") to_: string,
}
type customDefinition = {
  compute: string,
}
module OpaqueModulesPreset = {
  type t
  external fromDateRangePreset: dateRangePreset => t = "%identity"
  external asDateRangePreset: t => (dateRangePreset) = "%identity"
  external fromCustomConfig: customConfig => t = "%identity"
  external asCustomConfig: t => (customConfig) = "%identity"
  external fromCustomDefinition: customDefinition => t = "%identity"
  external asCustomDefinition: t => (customDefinition) = "%identity"
}
module OpaqueModulesBoundary = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external asElement: t => (Dom.element) = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
  external asElements: t => (array<Dom.element>) = "%identity"
}
