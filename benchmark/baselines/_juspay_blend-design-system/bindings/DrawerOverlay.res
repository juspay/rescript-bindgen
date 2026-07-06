@module("@juspay/blend-design-system") @react.component
external make: (
  ~className: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerOverlay"
