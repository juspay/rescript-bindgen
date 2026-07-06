type props<'b> = {
  ...HtmlAttrs.htmlAttributesOmitClassNameStyle,
  chartRef?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'b>>>,
  chartRefs?: array<React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'b>>>>,
  customLegendItems?: array<ChartsV2Types.chartV2CustomLegendItem>,
  renderItem?: ChartsV2Types.chartsV2RenderItemConfig => React.element,
  layout?: TabsTypes.tabsOrientation,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'b>> = "ChartV2Legend"
