@module("@juspay/blend-design-system") @react.component
external make: (
  ~flattenedItems: array<EditorSharedTypes.flattenedMultiSelectV2Item>,
  ~itemIndexMap: Map.t<string, float>,
  ~allItemsFlat: array<EditorSharedTypes.multiSelectV2ItemType>,
  ~selected: array<string>,
  ~onSelect: string => unit,
  ~maxSelections: float=?,
  ~tokens: EditorSharedTypes.multiSelectV2TokensType,
  ~height: float,
  ~itemHeight: float,
  ~overscan: float=?,
  ~onEndReached: unit => unit=?,
  ~endReachedThreshold: float=?,
  ~hasMore: bool=?,
) => React.element = "MultiSelectV2MenuVirtualList"
