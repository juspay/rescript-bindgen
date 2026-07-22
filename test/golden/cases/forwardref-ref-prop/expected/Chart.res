type props = {
  options?: ForwardrefRefPropTypes.forwardrefRefPropOptionsConfig,
  ref?: React.ref<Nullable.t<ForwardrefRefPropTypes.chartHandle>>,
}

@module("demo")
external make: React.component<props> = "Chart"
