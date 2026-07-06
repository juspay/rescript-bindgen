@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~content: React.element,
  @as("open") ~open_: bool=?,
  ~onOpenChange: bool => unit=?,
  ~side: TooltipV2Types.tooltipV2Side=?,
  ~align: TooltipV2Types.tooltipV2Align=?,
  ~showArrow: bool=?,
  ~size: TooltipV2Types.tooltipV2Size=?,
  ~slot: React.element=?,
  ~slotDirection: TooltipV2Types.tooltipV2SlotDirection=?,
  ~delayDuration: float=?,
  ~offset: float=?,
  ~maxWidth: string=?,
  ~fullWidth: bool=?,
  ~disableInteractive: bool=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "TooltipV2"
