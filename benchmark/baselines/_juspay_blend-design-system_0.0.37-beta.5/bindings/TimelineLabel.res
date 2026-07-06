@module("@juspay/blend-design-system") @react.component
external make: (
  ~text: string,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "TimelineLabel"
