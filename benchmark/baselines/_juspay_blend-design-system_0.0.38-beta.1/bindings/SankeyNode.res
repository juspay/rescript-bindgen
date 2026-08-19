type props = {
  x?: float,
  y?: float,
  width?: float,
  height?: float,
  index?: int,
  payload?: ChartsSharedTypes.chartsPayloadConfig,
  containerWidth?: float,
  nodeColors?: array<ChartsSharedTypes.stringOrChartsColorsConfig>,
  onMouseEnter?: (ChartsSharedTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit,
  onMouseLeave?: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SankeyNode"
