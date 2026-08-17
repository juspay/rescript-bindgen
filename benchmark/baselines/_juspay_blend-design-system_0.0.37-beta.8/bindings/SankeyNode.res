type props = {
  x?: float,
  y?: float,
  width?: float,
  height?: float,
  index?: int,
  payload?: ChartsTypes.chartsPayloadConfig,
  containerWidth?: float,
  nodeColors?: array<ChartsTypes.stringOrChartsColorsConfig>,
  onMouseEnter?: (ChartsTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit,
  onMouseLeave?: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SankeyNode"
