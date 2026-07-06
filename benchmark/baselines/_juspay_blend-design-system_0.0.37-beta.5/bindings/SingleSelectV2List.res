@module("@juspay/blend-design-system") @react.component
external make: (
  ~selected: string,
  ~onSelect: string => unit,
  ~singleSelectTokens: EditorSharedTypes.singleSelectV2TokensType,
  ~size: SelectV2Types.selectV2Size,
  ~variant: SelectV2Types.selectV2Variant,
  ~filteredItems: array<EditorSharedTypes.singleSelectV2GroupType>,
  ~enableSearch: bool=?,
) => React.element = "SingleSelectV2List"
