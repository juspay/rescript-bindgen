type props = {
  filteredItems: array<HighchartsSharedTypes.multiSelectV2GroupType>,
  allItemsFlat: array<HighchartsSharedTypes.multiSelectV2ItemType>,
  selected: array<string>,
  onSelect: string => unit,
  maxSelections?: float,
  tokens: HighchartsSharedTypes.multiSelectV2TokensType,
  size: SelectV2Types.selectV2Size,
  variant: SelectV2Types.selectV2Variant,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuItems"
