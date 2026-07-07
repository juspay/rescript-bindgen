@module("@juspay/blend-design-system") @react.component
external make: (
  ~items: array<'a>,
  ~renderItem: VirtualListTypes.virtualListRenderParams<'a> => React.element,
  ~height: CommonTypes.stringOrNumber=?,
  ~itemHeight: float=?,
  ~overscan: float=?,
  ~onScroll: float => unit=?,
  ~onEndReached: unit => unit=?,
  ~endReachedThreshold: float=?,
  ~isLoading: bool=?,
  ~hasMore: bool=?,
  ~className: string=?,
  ~style: JsxDOM.style=?,
  ~ref: React.ref<Nullable.t<VirtualListTypes.virtualListRef>>=?,
) => React.element = "VirtualList"
