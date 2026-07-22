type props = {
  children: React.element,
  content: React.element,
  @as("open") open_?: bool,
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  showArrow?: bool,
  size?: TooltipTypes.tooltipSize,
  slot?: React.element,
  slotDirection?: TooltipTypes.tooltipSlotDirection,
  delayDuration?: float,
  offset?: float,
  maxWidth?: string,
  fullWidth?: bool,
  disableInteractive?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Tooltip"
