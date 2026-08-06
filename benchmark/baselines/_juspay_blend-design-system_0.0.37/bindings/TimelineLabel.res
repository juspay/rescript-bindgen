type props = {
  ...TimelineTypes.timelineLabelProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TimelineLabel"
