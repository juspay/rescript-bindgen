type props = {
  tokens: StableStructuralNamesTypes.stableStructuralNamesTokensConfig,
  textColumn: StableStructuralNamesTypes.textColumn,
  dateColumn: StableStructuralNamesTypes.dateColumn,
  items: array<StableStructuralNamesTypes.stableStructuralNamesItemsConfig>,
}

@module("demo")
external make: React.component<props> = "Stepper"
