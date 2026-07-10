@module("@juspay/blend-design-system") @scope("Timeline") @react.component
external make: (
  ~count: int,
  ~label: string=?,
  ~onShowMore: unit => unit=?,
  ~buttonProps: ButtonV2Types.buttonV2ButtonPropsConfig=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "ShowMore"
