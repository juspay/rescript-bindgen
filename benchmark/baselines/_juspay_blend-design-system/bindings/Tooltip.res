@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~content: React.element,
  @as("open") ~open_: bool=?,
  ~side: TooltipTypes.tooltipSide=?,
  ~align: TooltipTypes.tooltipAlign=?,
  ~showArrow: bool=?,
  ~size: TooltipTypes.tooltipSize=?,
  ~slot: React.element=?,
  ~slotDirection: TooltipTypes.tooltipSlotDirection=?,
  ~delayDuration: float=?,
  ~offset: int=?,
  ~maxWidth: string=?,
  ~fullWidth: bool=?,
  ~disableInteractive: bool=?,
) => React.element = "Tooltip"
