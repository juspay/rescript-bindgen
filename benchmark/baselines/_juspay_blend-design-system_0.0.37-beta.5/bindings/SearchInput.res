type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnChangeSizeStyleValue,
  leftSlot?: React.element,
  rightSlot?: React.element,
  error?: bool,
  value?: string,
  onChange?: ReactEvent.Form.t => unit,
  allowClear?: bool,
  onClear?: unit => unit,
  clearIcon?: React.element,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SearchInput"
