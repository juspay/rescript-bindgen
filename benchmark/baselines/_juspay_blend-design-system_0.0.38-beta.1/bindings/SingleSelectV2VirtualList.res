type props = {
  ...HighchartsSharedTypes.menuListSharedProps,
  flattenedItems: array<HighchartsSharedTypes.flattenedItem>,
  virtualViewportHeight: float,
  virtualItems: array<HighchartsSharedTypes.virtualItemShape>,
  totalSize: float,
  measureElement: Nullable.t<Dom.element> => unit,
  loadingComponent?: React.element,
  hasMore?: bool,
  virtualScrollRef: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2VirtualList"
