type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  children: React.element,
  className?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Timeline"

// Compound statics — zero-cost aliases; use <Timeline.Header />
module Header = TimelineHeader
module Label = TimelineLabel
module Node = TimelineNode
module ShowMore = TimelineShowMore
module Substep = TimelineSubstep
