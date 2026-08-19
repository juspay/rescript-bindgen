type props = {
  item: ContextSharedTypes.singleSelectV2ItemType,
  selected: string,
  onSelect: string => unit,
  singleSelectTokens: ContextSharedTypes.singleSelectV2TokensType,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SubMenu"
