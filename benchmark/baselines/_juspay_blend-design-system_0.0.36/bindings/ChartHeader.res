type props = {
  id?: string,
  slot1: React.element,
  slot2: React.element,
  slot3: React.element,
  chartHeaderSlot: React.element,
  onFullscreen?: unit => unit,
  onExitFullscreen?: unit => unit,
  isFullscreen?: bool,
  isSmallScreen?: bool,
  isExpanded: bool,
  setIsExpanded: bool => unit,
  showCollapseIcon?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartHeader"
