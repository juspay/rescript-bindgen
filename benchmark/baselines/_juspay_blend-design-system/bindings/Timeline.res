type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyle,
  children: React.element,
  className?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "Timeline"
