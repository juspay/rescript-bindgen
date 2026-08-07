type props = {
  ...CommonTypes.truncatedTextWithTooltipV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TruncatedTextWithTooltipV2"
