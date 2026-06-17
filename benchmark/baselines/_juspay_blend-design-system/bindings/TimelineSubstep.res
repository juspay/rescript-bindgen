type props = {
  ...HtmlAttrs.htmlAttributesOmitTitle,
  title?: string,
  isNestedUnderHeader?: bool,
  showIndicator?: bool,
  description?: string,
  timestamp?: string,
  rightSlot?: React.element,
  datetimeLeftSlot?: React.element,
  datetimeRightSlot?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TimelineSubstep"
