type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnBlurOnChangeOnFocusSizeStepStyleValue,
  value: Nullable.t<float>,
  onChange: ReactEvent.Form.t => unit,
  step?: float,
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
