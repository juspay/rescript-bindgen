type props = {
  ...HtmlAttrs.buttonHTMLAttributesOmitOnClick,
  onClick?: (string, float) => unit,
  label?: string,
}

@module("demo")
external make: React.component<props> = "ClickyButton"
