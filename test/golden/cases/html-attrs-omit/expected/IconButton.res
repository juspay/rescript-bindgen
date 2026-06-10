type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitClassNameStyle,
  icon?: string,
}

@module("demo")
external make: React.component<props> = "IconButton"
