type props = {
  item: HighchartsSharedTypes.singleSelectV2ItemType,
  selected: string,
  onSelect: string => unit,
  singleSelectTokens: HighchartsSharedTypes.singleSelectV2TokensType,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SubMenu"
