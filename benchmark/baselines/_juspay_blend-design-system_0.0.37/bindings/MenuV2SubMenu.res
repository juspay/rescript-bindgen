type props = {
  item: MenuV2Types.menuV2ItemType,
  index: int,
  maxHeight?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MenuV2SubMenu"
