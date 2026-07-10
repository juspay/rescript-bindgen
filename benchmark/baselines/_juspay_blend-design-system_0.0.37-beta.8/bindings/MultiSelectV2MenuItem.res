@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: EditorSharedTypes.multiSelectV2ItemType,
  ~onSelect: string => unit,
  ~selected: array<string>,
  ~maxSelections: float=?,
  ~allItems: array<EditorSharedTypes.multiSelectV2ItemType>=?,
  ~index: int=?,
) => React.element = "MultiSelectV2MenuItem"
