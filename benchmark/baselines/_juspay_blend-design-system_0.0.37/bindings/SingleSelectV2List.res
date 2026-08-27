type props = {
  ...HighchartsSharedTypes.menuListSharedProps,
  filteredItems: array<HighchartsSharedTypes.singleSelectV2GroupType>,
  enableSearch?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2List"
