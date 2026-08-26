type props = {
  flattenedItems: array<HighchartsSharedTypes.flattenedMultiSelectV2Item>,
  itemIndexMap: Map.t<string, float>,
  allItemsFlat: array<HighchartsSharedTypes.multiSelectV2ItemType>,
  selected: array<string>,
  onSelect: string => unit,
  maxSelections?: float,
  tokens: HighchartsSharedTypes.multiSelectV2TokensType,
  height: float,
  itemHeight: float,
  overscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuVirtualList"
