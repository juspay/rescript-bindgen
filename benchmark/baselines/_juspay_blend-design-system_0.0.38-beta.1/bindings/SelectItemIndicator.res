type props = {
  checked: CommonTypes.boolOrIndeterminate,
  disabled?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SelectItemIndicator"
