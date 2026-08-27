type props = {
  item: HighchartsSharedTypes.singleSelectV2ItemType,
  selected: string,
  onSelect: string => unit,
  singleSelectTokens?: HighchartsSharedTypes.singleSelectV2TokensType,
  index?: int,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MenuItem"
