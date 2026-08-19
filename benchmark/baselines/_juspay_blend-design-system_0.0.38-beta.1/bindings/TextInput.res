type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnBlurOnChangeOnFocusSizeStyleValue,
  label?: string,
  sublabel?: string,
  hintText?: string,
  helpIconHintText?: string,
  error?: bool,
  errorMessage?: string,
  size?: InputsTypes.textInputSize,
  leftSlot?: React.element,
  rightSlot?: React.element,
  value: string,
  onChange: ReactEvent.Form.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
  cursor?: InputsTypes.inputsCursor,
  passwordToggle?: bool,
  textInputGroupPosition?: InputsTypes.textInputGroupPosition,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "TextInput"
