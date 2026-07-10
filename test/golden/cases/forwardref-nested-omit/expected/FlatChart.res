type props = {
  ...ForwardrefNestedOmitTypes.chartReactProps,
}

@module("demo")
external make: React.component<props> = "FlatChart"
