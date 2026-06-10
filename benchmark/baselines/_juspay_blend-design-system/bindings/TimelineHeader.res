type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenTitle,
  title: string,
  children?: React.element,
  status?: TimelineTypes.timelineNodeStatus,
  timestamp?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TimelineHeader"
