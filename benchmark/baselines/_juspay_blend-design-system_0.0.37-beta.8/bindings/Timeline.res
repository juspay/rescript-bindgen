type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  children: React.element,
  className?: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Timeline"

// Compound statics — zero-cost aliases; use <Timeline.Header />
module Header = TimelineHeader2
module Label = TimelineLabel2
module Node = TimelineNode2
module ShowMore = TimelineShowMore2
module Substep = TimelineSubstep2
