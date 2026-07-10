type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenTitle,
  title: string,
  children?: React.element,
  status?: TimelineTypes.timelineNodeStatus,
  timestamp?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system") @scope("Timeline")
external make: React.component<props> = "Header"
