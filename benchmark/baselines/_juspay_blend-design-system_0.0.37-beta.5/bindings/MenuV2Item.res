type props = {
  ...MenuV2Types.menuV2ItemProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MenuV2Item"
