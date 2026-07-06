@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: EditorSharedTypes.singleSelectV2ItemType,
  ~selected: string,
  ~onSelect: string => unit,
  ~singleSelectTokens: EditorSharedTypes.singleSelectV2TokensType,
) => React.element = "SubMenu"
