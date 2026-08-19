type props = {
  selected: array<string>,
  availableValues: array<string>,
  onSelectAll: bool => unit,
  selectAllText: string,
  disabled?: bool,
  asMenuItem?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2SelectAllItem"
