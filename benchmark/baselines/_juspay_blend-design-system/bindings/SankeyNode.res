@module("@juspay/blend-design-system") @react.component
external make: (
  ~x: float=?,
  ~y: float=?,
  ~width: int=?,
  ~height: int=?,
  ~index: int=?,
  ~payload: ChartsTypes.payloadConfig3=?,
  ~containerWidth: float=?,
  ~nodeColors: array<AvatarGroupTypes.stringOrTextConfig7>=?,
  ~onMouseEnter: (ChartsTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit=?,
  ~onMouseLeave: unit => unit=?,
) => React.element = "SankeyNode"
