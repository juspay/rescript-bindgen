type props = {
  filteredItems: array<ContextSharedTypes.multiSelectV2GroupType>,
  allItemsFlat: array<ContextSharedTypes.multiSelectV2ItemType>,
  selected: array<string>,
  onSelect: string => unit,
  maxSelections?: float,
  tokens: ContextSharedTypes.multiSelectV2TokensType,
  size: SelectV2Types.selectV2Size,
  variant: SelectV2Types.selectV2Variant,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuItems"
