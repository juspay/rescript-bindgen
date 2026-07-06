@module("@juspay/blend-design-system") @react.component
external make: (
  ~filteredItems: array<EditorSharedTypes.multiSelectV2GroupType>,
  ~allItemsFlat: array<EditorSharedTypes.multiSelectV2ItemType>,
  ~selected: array<string>,
  ~onSelect: string => unit,
  ~maxSelections: float=?,
  ~tokens: EditorSharedTypes.multiSelectV2TokensType,
  ~size: SelectV2Types.selectV2Size,
  ~variant: SelectV2Types.selectV2Variant,
) => React.element = "MultiSelectV2MenuItems"
