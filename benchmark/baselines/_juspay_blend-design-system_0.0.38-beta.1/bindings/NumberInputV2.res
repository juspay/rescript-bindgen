type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameMaxMinNameOnBlurOnChangeOnFocusSizeSlotStepStyleValue,
  slot?: HighchartsSharedTypes.inputsV2SlotConfig,
  value: Nullable.t<float>,
  unit?: string,
  onChange: ReactEvent.Form.t => unit,
  min?: float,
  max?: float,
  step?: float,
  error?: HighchartsSharedTypes.inputsV2ErrorConfig,
  size?: HighchartsSharedTypes.inputSizeV2,
  label?: HighchartsSharedTypes.inputsV2LabelConfig,
  unitDirection?: HighchartsSharedTypes.numberInputV2Direction,
  helpIconText?: string,
  hintText?: string,
  name?: string,
  preventNegative?: bool,
  onBlur?: ReactEvent.Focus.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "NumberInputV2"
