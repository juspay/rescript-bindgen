type props = {
  ...HtmlAttrs.anchorHTMLAttributesOmitChildrenClassNameDangerouslySetInnerHTMLHrefRelStyleTarget,
  ...ButtonV2Types.buttonBaseProps,
  href: string,
  target?: string,
  rel?: string,
  disabled?: bool,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "LinkButton"
