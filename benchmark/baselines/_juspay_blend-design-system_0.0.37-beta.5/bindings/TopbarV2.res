type props = {
  ...TopbarV2Types.topbarV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TopbarV2"
