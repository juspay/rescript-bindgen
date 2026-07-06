type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameStyle,
  chartRef?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject>>,
  chartRefs?: array<React.ref<Nullable.t<DistTypes.highchartsReactRefObject>>>,
  customLegendItems?: array<ChartsV2Types.chartV2CustomLegendItem>,
  renderItem?: ChartsV2Types.chartsV2RenderItemConfig => React.element,
  layout?: TabsTypes.tabsOrientation,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartV2Legend"
