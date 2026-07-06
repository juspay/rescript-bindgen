@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerHeader"
