type props = {
  x?: float,
  y?: float,
  width?: float,
  height?: float,
  index?: int,
  payload?: HighchartsSharedTypes.chartsPayloadConfig,
  containerWidth?: float,
  nodeColors?: array<HighchartsSharedTypes.stringOrChartsColorsConfig>,
  onMouseEnter?: (HighchartsSharedTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit,
  onMouseLeave?: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SankeyNode"
