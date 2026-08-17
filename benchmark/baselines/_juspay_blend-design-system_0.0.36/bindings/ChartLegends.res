type props = {
  chartContainerRef: React.ref<Nullable.t<Dom.element>>,
  keys: array<string>,
  colors: array<ChartsTypes.chartsColorsConfig>,
  handleLegendClick: string => unit,
  handleLegendEnter: string => unit,
  handleLegendLeave: unit => unit,
  selectedKeys: array<string>,
  setSelectedKeys: array<string> => unit,
  hoveredKey: Nullable.t<string>,
  activeKeys: Nullable.t<array<string>>,
  stacked?: bool,
  isSmallScreen?: bool,
  stackedLegendsData?: array<ChartsTypes.stackedLegendsDataPoint>,
  legends?: array<ChartsTypes.chartsLegendsConfig>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartLegends"
