@module("@juspay/blend-design-system") @react.component
external make: (
  ~tokens: EditorSharedTypes.multiSelectV2TokensType,
  ~showSearch: bool,
  ~itemsCount: float,
  ~searchValue: string,
  ~searchPlaceholder: string=?,
  ~searchInputRef: React.ref<Nullable.t<Dom.element>>,
  ~onSearchChange: ReactEvent.Form.t => unit,
  ~onSearchArrowKeyToFirst: unit => unit,
  ~showSelectAll: bool,
  ~selected: array<string>,
  ~availableValues: array<string>,
  ~filteredItems: array<EditorSharedTypes.multiSelectV2GroupType>,
  ~onSelectAll: (bool, array<EditorSharedTypes.multiSelectV2GroupType>) => unit=?,
  ~selectAllText: string=?,
  ~disabled: bool=?,
) => React.element = "MultiSelectV2MenuHeader"
