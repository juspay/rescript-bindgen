type props = {
  item: ContextSharedTypes.multiSelectV2ItemType,
  onSelect: string => unit,
  selected: array<string>,
  maxSelections?: float,
  focusIdentityEnabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2SubMenu"
