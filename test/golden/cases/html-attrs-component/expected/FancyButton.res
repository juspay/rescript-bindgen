type props = {
  ...HtmlAttrs.buttonHTMLAttributes,
  text?: string,
  loading?: bool,
}

@module("demo")
external make: React.component<props> = "FancyButton"
