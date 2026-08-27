type props = {
  tokens: HighchartsSharedTypes.multiSelectV2TokensType,
  primaryAction?: HighchartsSharedTypes.multiSelectV2PrimaryActionConfig,
  secondaryAction?: HighchartsSharedTypes.multiSelectV2SecondaryActionConfig,
  selected: array<string>,
  onClose: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuActions"
