type props = {
  uniqueId: string,
  disabled: bool,
  error: bool,
  required: bool,
  size: SelectorV2Types.selectorV2Size,
  label?: string,
  subLabel?: string,
  slot?: SelectorV2Types.selectorV2SlotConfig,
  tokens: SelectorV2Types.radioV2TokensType,
  labelMaxLength?: float,
  subLabelMaxLength?: float,
  subLabelId?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "RadioV2Content"
