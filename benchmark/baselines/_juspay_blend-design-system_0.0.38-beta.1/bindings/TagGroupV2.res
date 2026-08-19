type props = {
  ...TagGroupV2Types.tagGroupV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TagGroupV2"
