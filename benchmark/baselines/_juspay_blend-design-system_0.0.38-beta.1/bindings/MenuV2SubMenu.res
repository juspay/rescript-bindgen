type props = {
  item: ContextSharedTypes.menuV2ItemType,
  index: int,
  maxHeight?: string,
  selectionStyle?: ContextSharedTypes.menuSelectionStyle,
  selectionMode?: ContextSharedTypes.menuSelectionMode,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MenuV2SubMenu"
