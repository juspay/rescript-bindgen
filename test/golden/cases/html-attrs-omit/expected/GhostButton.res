type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle,
  ghost?: bool,
}

@module("demo")
external make: React.component<props> = "GhostButton"
