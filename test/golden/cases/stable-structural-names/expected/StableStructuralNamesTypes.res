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
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Text({…}); `kind` is auto-filled by @tag.
@tag("kind")
type stableStructuralNamesItemsConfig =
  | @as("text") Text({label: string})
  | @as("icon") Icon({glyph: string})
