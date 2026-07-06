@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~direction: PopoverTypes.popoverSide=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerFooter"
