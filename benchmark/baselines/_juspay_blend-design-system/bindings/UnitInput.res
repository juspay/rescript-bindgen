type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnBlurOnChangeOnFocusRequiredSizeStepStyleValue,
  value: float,
  onChange: ReactEvent.Form.t => unit,
  step?: int,
  error?: bool,
  errorMessage?: string,
  required?: bool,
  size?: InputsTypes.unitInputSize,
  label?: string,
  sublabel?: string,
  helpIconHintText?: string,
  hintText?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  unit: string,
  unitPosition?: InputsTypes.unitPosition,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "UnitInput"
