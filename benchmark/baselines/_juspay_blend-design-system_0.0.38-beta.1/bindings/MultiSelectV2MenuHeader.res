type props = {
  tokens: ContextSharedTypes.multiSelectV2TokensType,
  showSearch: bool,
  showSearchWhenEmpty?: bool,
  itemsCount: float,
  searchValue: string,
  searchPlaceholder?: string,
  searchInputRef: React.ref<Nullable.t<Dom.element>>,
  onSearchChange: ReactEvent.Form.t => unit,
  onSearchArrowKeyToFirst: unit => unit,
  showSelectAll: bool,
  selected: array<string>,
  availableValues: array<string>,
  filteredItems: array<ContextSharedTypes.multiSelectV2GroupType>,
  onSelectAll?: (bool, array<ContextSharedTypes.multiSelectV2GroupType>) => unit,
  selectAllText?: string,
  disabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2MenuHeader"
