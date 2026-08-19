type props = {
  selectedValues: array<string>,
  slot?: React.element,
  variant: SelectV2Types.selectV2Variant,
  size: SelectV2Types.selectV2Size,
  isSmallScreen: bool,
  name: string,
  label: string,
  placeholder: string,
  required: bool,
  selectionTagType: ContextSharedTypes.multiSelectV2SelectionTagType,
  valueLabelMap: Dict.t<string>,
  fallbackToValue?: bool,
  @as("open") open_: bool,
  multiSelectTokens: ContextSharedTypes.multiSelectV2TokensType,
  inline?: bool,
  error?: bool,
  disabled?: bool,
  triggerDimensions?: ContextSharedTypes.selectV2TriggerDimensions,
  borderRadius: string,
  borderRight?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2Trigger"
