type props = {
  ...HtmlAttrs.htmlAttributesOmitTitle,
  title: string,
  isNestedUnderHeader?: bool,
  showIndicator?: bool,
  description?: string,
  timestamp?: string,
  rightSlot?: React.element,
  datetimeLeftSlot?: React.element,
  datetimeRightSlot?: React.element,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system") @scope("Timeline")
external make: React.component<props> = "Substep"
