type props = {
  sourceX?: float,
  targetX?: float,
  sourceY?: float,
  targetY?: float,
  sourceControlX?: float,
  targetControlX?: float,
  linkWidth?: float,
  index?: int,
  payload?: HighchartsSharedTypes.sankeyLink,
  linkColors?: array<HighchartsSharedTypes.stringOrChartsColorsConfig>,
  onMouseEnter?: (HighchartsSharedTypes.sankeyTooltipData, ReactEvent.Mouse.t) => unit,
  onMouseLeave?: unit => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SankeyLink"
