type props = {
  item: EditorSharedTypes.singleSelectV2ItemType,
  selected: string,
  onSelect: string => unit,
  singleSelectTokens: EditorSharedTypes.singleSelectV2TokensType,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SubMenu"
