@module("@juspay/blend-design-system") @react.component
external make: (
  ~id: string=?,
  ~slot1: React.element,
  ~slot2: React.element,
  ~slot3: React.element,
  ~chartHeaderSlot: React.element,
  ~onFullscreen: unit => unit=?,
  ~onExitFullscreen: unit => unit=?,
  ~isFullscreen: bool=?,
  ~isSmallScreen: bool=?,
  ~isExpanded: bool,
  ~setIsExpanded: bool => unit,
  ~showCollapseIcon: bool=?,
) => React.element = "ChartHeader"
