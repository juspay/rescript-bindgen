@module("@juspay/blend-design-system") @scope("Timeline") @react.component
external make: (
  ~text: string,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Label"
