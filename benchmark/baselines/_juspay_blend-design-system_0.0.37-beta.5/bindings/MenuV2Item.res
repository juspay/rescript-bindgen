@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: MenuV2Types.menuV2ItemType,
  ~index: int,
  ~itemTokens: MenuV2Types.menuV2MenuV2TokensTypeGroupItemConfig,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "MenuV2Item"
