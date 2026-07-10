type props = {
  ...EditorSharedTypes.menuListSharedProps,
  flattenedItems: array<EditorSharedTypes.flattenedItem>,
  virtualViewportHeight: float,
  virtualItems: array<EditorSharedTypes.virtualItemShape>,
  totalSize: float,
  measureElement: Nullable.t<Dom.element> => unit,
  loadingComponent?: React.element,
  hasMore?: bool,
  virtualScrollRef: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2VirtualList"
