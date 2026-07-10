type props<'a, 'b, 'c> = {
  ...HtmlAttrs.htmlAttributesOmitClassNameStyle,
  chartRef?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>,
  chartRefs?: array<React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>>,
  customLegendItems?: array<ChartsV2Types.chartV2CustomLegendItem>,
  renderItem?: ChartsV2Types.chartsV2RenderItemConfig => React.element,
  layout?: TabsTypes.tabsOrientation,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c>> = "ChartV2Legend"
