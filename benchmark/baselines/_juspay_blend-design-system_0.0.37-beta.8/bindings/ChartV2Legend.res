type props<'a, 'b, 'c> = {
  ...HtmlAttrs.htmlAttributesOmitClassNameStyle,
  chartRef?: React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>,
  chartRefs?: array<React.ref<Nullable.t<DistTypes.highchartsReactRefObject<'a, 'b, 'c>>>>,
  customLegendItems?: array<HighchartsSharedTypes.chartV2CustomLegendItem>,
  renderItem?: HighchartsSharedTypes.chartsV2RenderItemConfig => React.element,
  layout?: SliderTypes.sliderOrientation,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a, 'b, 'c>> = "ChartV2Legend"
