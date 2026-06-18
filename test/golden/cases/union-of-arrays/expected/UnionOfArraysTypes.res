type preset =
  | @as("today") Today
  | @as("yesterday") Yesterday
  | @as("last7Days") Last7Days
type rangeConfig = {
  preset: preset,
  label?: string,
  visible?: bool,
}
type unionOfArraysGetRangeConfig = {
  start: string,
  end: string,
}
type rangeDefinition = {
  id: string,
  label: string,
  getRange: unit => unionOfArraysGetRangeConfig,
  visible?: bool,
}
module PresetsConfig = {
  type t
  external fromPreset: preset => t = "%identity"
  external fromRangeConfig: rangeConfig => t = "%identity"
  external fromRangeDefinition: rangeDefinition => t = "%identity"
}
