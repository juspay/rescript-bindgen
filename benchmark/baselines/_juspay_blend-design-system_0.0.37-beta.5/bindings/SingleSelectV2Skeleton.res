@module("@juspay/blend-design-system") @react.component
external make: (
  ~singleSelectTokens: EditorSharedTypes.singleSelectV2TokensType,
  ~skeleton: SelectV2Types.selectV2SkeletonProps,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SingleSelectV2Skeleton"
