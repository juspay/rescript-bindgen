type props = {
  filteredItems: array<EditorSharedTypes.multiSelectV2GroupType>,
  allItemsFlat: array<EditorSharedTypes.multiSelectV2ItemType>,
  selected: array<string>,
  onSelect: string => unit,
  maxSelections?: float,
  tokens: EditorSharedTypes.multiSelectV2TokensType,
  size: SelectV2Types.selectV2Size,
  variant: SelectV2Types.selectV2Variant,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuItems"
