type props = {
  chartContainerRef: React.ref<Nullable.t<Dom.element>>,
  keys: array<string>,
  colors: array<HighchartsSharedTypes.chartsColorsConfig>,
  handleLegendClick: string => unit,
  handleLegendEnter: string => unit,
  handleLegendLeave: unit => unit,
  selectedKeys: array<string>,
  setSelectedKeys: array<string> => unit,
  hoveredKey: Nullable.t<string>,
  activeKeys: Nullable.t<array<string>>,
  stacked?: bool,
  isSmallScreen?: bool,
  stackedLegendsData?: array<HighchartsSharedTypes.stackedLegendsDataPoint>,
  legends?: array<HighchartsSharedTypes.chartsLegendsConfig>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartLegends"
