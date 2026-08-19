type props = {
  tokens: ContextSharedTypes.multiSelectV2TokensType,
  primaryAction?: ContextSharedTypes.multiSelectV2PrimaryActionConfig,
  secondaryAction?: ContextSharedTypes.multiSelectV2SecondaryActionConfig,
  selected: array<string>,
  onClose: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuActions"
