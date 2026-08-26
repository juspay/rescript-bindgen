type props = {
  item: HighchartsSharedTypes.menuV2ItemType,
  index: int,
  maxHeight?: string,
  selectionStyle?: HighchartsSharedTypes.menuSelectionStyle,
  selectionMode?: HighchartsSharedTypes.menuSelectionMode,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MenuV2SubMenu"
