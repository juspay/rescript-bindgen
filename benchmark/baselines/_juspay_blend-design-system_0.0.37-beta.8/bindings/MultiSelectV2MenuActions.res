type props = {
  tokens: EditorSharedTypes.multiSelectV2TokensType,
  primaryAction?: EditorSharedTypes.multiSelectV2PrimaryActionConfig,
  secondaryAction?: EditorSharedTypes.multiSelectV2SecondaryActionConfig,
  selected: array<string>,
  onClose: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuActions"
