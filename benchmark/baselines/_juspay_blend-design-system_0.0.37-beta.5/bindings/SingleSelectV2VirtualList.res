@module("@juspay/blend-design-system") @react.component
external make: (
  ~selected: string,
  ~onSelect: string => unit,
  ~singleSelectTokens: EditorSharedTypes.singleSelectV2TokensType,
  ~size: SelectV2Types.selectV2Size,
  ~variant: SelectV2Types.selectV2Variant,
  ~flattenedItems: array<EditorSharedTypes.flattenedItem>,
  ~virtualViewportHeight: float,
  ~virtualItems: array<EditorSharedTypes.virtualItemShape>,
  ~totalSize: float,
  ~measureElement: Nullable.t<Dom.element> => unit,
  ~loadingComponent: React.element=?,
  ~hasMore: bool=?,
  ~virtualScrollRef: React.ref<Nullable.t<Dom.element>>,
) => React.element = "SingleSelectV2VirtualList"
