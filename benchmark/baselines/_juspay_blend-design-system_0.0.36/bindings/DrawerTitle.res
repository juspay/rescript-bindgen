@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~id: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerTitle"
