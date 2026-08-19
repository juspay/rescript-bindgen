type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameDisabledOnBlurOnChangeOnFocusRequiredSizeStyleValue,
  leftSlot?: React.element,
  rightSlot?: React.element,
  error?: bool,
  value?: string,
  onChange?: ReactEvent.Form.t => unit,
  allowClear?: bool,
  onClear?: unit => unit,
  clearIcon?: React.element,
  disabled?: bool,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SearchInputV2"
