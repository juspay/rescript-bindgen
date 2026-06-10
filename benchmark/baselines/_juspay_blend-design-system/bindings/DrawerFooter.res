@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~direction: PopoverTypes.side=?,
) => React.element = "DrawerFooter"
