type stableStructuralNamesTokensCircleCompletedConfig = {
  outline: string,
}
type stableStructuralNamesTokensCircleConfig = {
  completed: stableStructuralNamesTokensCircleCompletedConfig,
  default: stableStructuralNamesTokensCircleCompletedConfig,
}
type stableStructuralNamesTokensIconCompletedConfig = {
  color: string,
}
type stableStructuralNamesTokensIconConfig = {
  completed: stableStructuralNamesTokensIconCompletedConfig,
  default: stableStructuralNamesTokensIconCompletedConfig,
}
type stableStructuralNamesTokensTextCompletedConfig = {
  color: string,
  weight: string,
}
type stableStructuralNamesTokensTextConfig = {
  completed: stableStructuralNamesTokensTextCompletedConfig,
  default: stableStructuralNamesTokensTextCompletedConfig,
}
type stableStructuralNamesTokensConfig = {
  circle: stableStructuralNamesTokensCircleConfig,
  icon: stableStructuralNamesTokensIconConfig,
  text: stableStructuralNamesTokensTextConfig,
}
type stableStructuralNamesTextColumnCellConfig = {
  value: string,
}
type textColumn = {
  cell: stableStructuralNamesTextColumnCellConfig,
}
type stableStructuralNamesDateColumnCellConfig = {
  value: string,
  format: string,
}
type dateColumn = {
  cell: stableStructuralNamesDateColumnCellConfig,
}
type stableStructuralNamesItemsTextConfig = {
  kind: string,
  label: string,
}
type stableStructuralNamesItemsIconConfig = {
  kind: string,
  glyph: string,
}
module Items = {
  type t
  external fromStableStructuralNamesItemsTextConfig: stableStructuralNamesItemsTextConfig => t = "%identity"
  external fromStableStructuralNamesItemsIconConfig: stableStructuralNamesItemsIconConfig => t = "%identity"
}
