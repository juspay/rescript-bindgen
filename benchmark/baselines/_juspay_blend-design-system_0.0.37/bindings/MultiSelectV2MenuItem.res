type props = {
  item: HighchartsSharedTypes.multiSelectV2ItemType,
  onSelect: string => unit,
  selected: array<string>,
  maxSelections?: float,
  allItems?: array<HighchartsSharedTypes.multiSelectV2ItemType>,
  index?: int,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuItem"
