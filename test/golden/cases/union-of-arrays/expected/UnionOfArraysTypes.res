type preset =
  | @as("today") Today
  | @as("yesterday") Yesterday
  | @as("last7Days") Last7Days
type rangeConfig = {
  preset: preset,
  label?: string,
  visible?: bool,
}
type unionOfArraysRangeDefinitionGetRangeConfig = {
  start: string,
  end: string,
}
type rangeDefinition = {
  id: string,
  label: string,
  getRange: unit => unionOfArraysRangeDefinitionGetRangeConfig,
  visible?: bool,
}
module PresetsConfig = {
  type t
  external fromPreset: preset => t = "%identity"
  external asPreset: t => (preset) = "%identity"
  external fromRangeConfig: rangeConfig => t = "%identity"
  external asRangeConfig: t => (rangeConfig) = "%identity"
  external fromRangeDefinition: rangeDefinition => t = "%identity"
  external asRangeDefinition: t => (rangeDefinition) = "%identity"
}
module PresetsConfigSingle = {
  type t
  external fromPreset: preset => t = "%identity"
  external asPreset: t => (preset) = "%identity"
  external fromRangeConfig: rangeConfig => t = "%identity"
  external asRangeConfig: t => (rangeConfig) = "%identity"
  external fromRangeDefinition: rangeDefinition => t = "%identity"
  external asRangeDefinition: t => (rangeDefinition) = "%identity"
}
