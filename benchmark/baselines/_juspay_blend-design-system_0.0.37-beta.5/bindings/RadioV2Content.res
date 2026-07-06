@module("@juspay/blend-design-system") @react.component
external make: (
  ~uniqueId: string,
  ~disabled: bool,
  ~error: bool,
  ~required: bool,
  ~size: SelectorV2Types.selectorV2Size,
  ~label: string=?,
  ~subLabel: string=?,
  ~slot: SelectorV2Types.selectorV2SlotConfig=?,
  ~tokens: SelectorV2Types.radioV2TokensType,
  ~labelMaxLength: float=?,
  ~subLabelMaxLength: float=?,
  ~subLabelId: string=?,
) => React.element = "RadioV2Content"
