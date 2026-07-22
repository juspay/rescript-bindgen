type props = {
  selectedValues: array<string>,
  slot: React.element,
  variant: MultiSelectTypes.multiSelectVariant,
  size: MultiSelectTypes.multiSelectMenuSize,
  isSmallScreen: bool,
  onChange: string => unit,
  name: string,
  label: string,
  placeholder: string,
  required: bool,
  selectionTagType: MultiSelectTypes.multiSelectSelectionTagType,
  valueLabelMap: Dict.t<string>,
  @as("open") open_: bool,
  onClick?: unit => unit,
  multiSelectTokens: MultiSelectTypes.multiSelectTokensType,
  inline?: bool,
  error?: bool,
  disabled?: bool,
  maxTriggerWidth?: float,
  minTriggerWidth?: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectTrigger"
