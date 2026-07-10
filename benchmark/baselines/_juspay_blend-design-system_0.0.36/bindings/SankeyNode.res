@module("@juspay/blend-design-system") @react.component
external make: (
  ~x: float=?,
  ~y: float=?,
  ~width: float=?,
  ~height: float=?,
  ~index: int=?,
  ~payload: HighchartsSharedTypes.chartsPayloadConfig=?,
  ~containerWidth: float=?,
  ~nodeColors: array<HighchartsSharedTypes.stringOrChartsColorsConfig>=?,
  ~onMouseEnter: (HighchartsSharedTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit=?,
  ~onMouseLeave: unit => unit=?,
) => React.element = "SankeyNode"
