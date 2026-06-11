type props = {
  ...HtmlAttrs.htmlAttributesOmitClassNameStyle,
  chartRef?: React.ref<Nullable.t<Dom.element>>,
  chartRefs?: array<React.ref<Nullable.t<Dom.element>>>,
  customLegendItems?: array<HighchartsSharedTypes.chartV2CustomLegendItem>,
  renderItem?: HighchartsSharedTypes.renderItemConfig => React.element,
  layout?: TabsTypes.orientation,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartV2Legend"
