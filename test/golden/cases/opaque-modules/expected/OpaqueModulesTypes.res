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
  external fromCustomConfig: customConfig => t = "%identity"
  external fromCustomDefinition: customDefinition => t = "%identity"
}
module OpaqueModulesBoundary = {
  type t
  external fromElement: Dom.element => t = "%identity"
  external fromElements: array<Dom.element> => t = "%identity"
}
