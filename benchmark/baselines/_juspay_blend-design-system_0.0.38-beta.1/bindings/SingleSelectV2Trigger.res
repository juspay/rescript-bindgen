type props = {
  size: SelectV2Types.selectV2Size,
  selected: string,
  label: string,
  name: string,
  placeholder: string,
  required: bool,
  valueLabelMap: Dict.t<string>,
  @as("open") open_: bool,
  slot?: React.element,
  variant: SelectV2Types.selectV2Variant,
  isSmallScreenWithLargeSize: bool,
  isItemSelected: bool,
  singleSelectTokens: ContextSharedTypes.singleSelectV2TokensType,
  inline?: bool,
  error?: bool,
  disabled?: bool,
  triggerDimensions?: ContextSharedTypes.selectV2TriggerDimensions,
  singleSelectGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  borderRadius?: string,
  borderRight?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2Trigger"
