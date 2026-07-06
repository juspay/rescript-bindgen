@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: EditorSharedTypes.multiSelectV2ItemType,
  ~onSelect: string => unit,
  ~selected: array<string>,
  ~maxSelections: float=?,
) => React.element = "MultiSelectV2SubMenu"
