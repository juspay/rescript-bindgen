@module("demo") @react.component
external make: (
  ~options: ForwardrefRefPropTypes.forwardrefRefPropOptionsConfig=?,
  ~ref: React.ref<Nullable.t<ForwardrefRefPropTypes.chartHandle>>=?,
) => React.element = "Chart"
