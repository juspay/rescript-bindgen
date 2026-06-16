@module("@juspay/blend-design-system") @react.component
external make: (
  ~x: float=?,
  ~y: float=?,
  ~width: float=?,
  ~height: float=?,
  ~index: int=?,
  ~payload: ChartsTypes.payloadConfig3=?,
  ~containerWidth: float=?,
  ~nodeColors: array<ChartsTypes.stringOrColorsConfig>=?,
  ~onMouseEnter: (ChartsTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit=?,
  ~onMouseLeave: unit => unit=?,
) => React.element = "SankeyNode"
