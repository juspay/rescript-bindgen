type props = {
  enabled?: bool,
  hasItems: bool,
  backgroundColor: string,
  searchPlaceholder: string,
  searchText: string,
  onSearchTextChange: string => unit,
  searchInputRef: React.ref<Nullable.t<Dom.element>>,
  containerRef?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2Search"
