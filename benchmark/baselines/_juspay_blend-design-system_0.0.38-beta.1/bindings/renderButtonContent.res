type props = {
  isLoading: bool,
  isSkeleton: bool,
  disabled?: bool,
  state: ButtonV2Types.buttonV2State,
  buttonType: ButtonV2Types.buttonV2Type,
  subType: ButtonV2Types.buttonV2SubType,
  size: ButtonV2Types.buttonV2Size,
  text?: string,
  leftSlot?: ButtonV2Types.buttonSlot,
  rightSlot?: ButtonV2Types.buttonSlot,
  tokens: ButtonV2Types.buttonV2ResponsiveButtonV2TokensSmConfig,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "renderButtonContent"
