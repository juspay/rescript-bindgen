type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenTitle,
  variant?: CardV2Types.cardV2Variant,
  orientation?: CardV2Types.cardV2Orientation,
  padding?: CardV2Types.cardV2Padding,
  title?: React.element,
  truncateTitle?: bool,
  subtitle?: React.element,
  description?: React.element,
  eyebrow?: React.element,
  media?: React.element,
  mediaWidth?: string,
  mediaHeight?: string,
  mediaMinHeight?: string,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  footer?: React.element,
  actions?: ButtonV2Types.CardV2Actions.t,  // ⓘ was `ButtonV2Props | ButtonV2Props[]` — opaque; build with CardV2Actions.fromButtonV2Props / CardV2Actions.fromButtonV2Propss
  actionPlacement?: CardV2Types.cardV2ActionPlacement,
  centered?: bool,
  interactive?: bool,
  selected?: bool,
  skeleton?: CardV2Types.cardV2SkeletonProps,
  width?: string,
  minWidth?: string,
  maxWidth?: string,
  height?: string,
  minHeight?: string,
  maxHeight?: string,
  scrollable?: bool,
  children?: React.element,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2"

// Compound statics — zero-cost aliases; use <CardV2.Actions />
module Actions = CardV2Actions
module Body = CardV2Body
module Content = CardV2Content
module Footer = CardV2Footer
module Header = CardV2Header
module Media = CardV2Media
module Meta = CardV2Meta
module Skeleton = CardV2Skeleton
