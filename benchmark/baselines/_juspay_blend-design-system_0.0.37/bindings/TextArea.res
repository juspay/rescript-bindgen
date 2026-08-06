type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitAutoFocusClassNameColsDisabledOnBlurOnChangeOnFocusPlaceholderRequiredRowsStyleValueWrap,
  value: string,
  placeholder: string,
  disabled?: bool,
  autoFocus?: bool,
  onChange: ReactEvent.Form.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  rows?: int,
  cols?: int,
  label?: string,
  sublabel?: string,
  hintText?: string,
  helpIconHintText?: string,
  helpIconText?: string,
  required?: bool,
  error?: bool,
  errorMessage?: string,
  resize?: InputsTypes.inputsResize,
  wrap?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TextArea"
