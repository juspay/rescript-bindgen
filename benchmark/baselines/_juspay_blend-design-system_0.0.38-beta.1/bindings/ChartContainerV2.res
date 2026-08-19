type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  children: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ChartContainerV2"
