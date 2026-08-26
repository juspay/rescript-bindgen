type props = {
  item: HighchartsSharedTypes.multiSelectV2ItemType,
  onSelect: string => unit,
  selected: array<string>,
  maxSelections?: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2SubMenu"
