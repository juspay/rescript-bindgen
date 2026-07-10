type props = {
  ...TooltipV2Types.tooltipV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TooltipV2"
