type props = {
  ...ContextSharedTypes.menuListSharedProps,
  filteredItems: array<ContextSharedTypes.singleSelectV2GroupType>,
  enableSearch?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2List"
