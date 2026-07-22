type props = {
  children: React.element,
  className?: string,
  direction?: PopoverTypes.popoverSide,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DrawerFooter"
