type props = {
  ...TimelineTypes.timelineShowMoreProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system") @scope("Timeline")
external make: React.component<props> = "ShowMore"
