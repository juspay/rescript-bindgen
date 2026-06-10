type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnBlurOnChangeOnFocusSizeStepStyleValue,
  value: float,
  onChange: ReactEvent.Form.t => unit,
  step?: int,
  error?: bool,
  errorMessage?: string,
  size?: InputsTypes.numberInputSize,
  label?: string,
  sublabel?: string,
  helpIconHintText?: string,
  hintText?: string,
  preventNegative?: bool,
  onBlur?: ReactEvent.Focus.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "NumberInput"
