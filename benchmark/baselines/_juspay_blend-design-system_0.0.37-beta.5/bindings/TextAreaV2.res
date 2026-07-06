type props = {
  ...HtmlAttrs.textareaHTMLAttributesOmitAutoFocusClassNameColsDisabledOnBlurOnChangeOnFocusPlaceholderRequiredRowsStyleValue,
  size?: EditorSharedTypes.inputSizeV2,
  value: string,
  placeholder: string,
  disabled?: bool,
  autoFocus?: bool,
  onChange: ReactEvent.Form.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  rows?: int,
  label?: string,
  sublabel?: string,
  hintText?: string,
  helpIconText?: string,
  required?: bool,
  error?: EditorSharedTypes.inputsV2ErrorConfig,
  resize?: InputsTypes.inputsResize,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TextAreaV2"
