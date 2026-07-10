@module("@juspay/blend-design-system") @react.component
external make: (
  ~sourceX: float=?,
  ~targetX: float=?,
  ~sourceY: float=?,
  ~targetY: float=?,
  ~sourceControlX: float=?,
  ~targetControlX: float=?,
  ~linkWidth: float=?,
  ~index: int=?,
  ~payload: HighchartsSharedTypes.sankeyLink=?,
  ~linkColors: array<HighchartsSharedTypes.stringOrChartsColorsConfig>=?,
  ~onMouseEnter: (HighchartsSharedTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit=?,
  ~onMouseLeave: unit => unit=?,
) => React.element = "SankeyLink"
