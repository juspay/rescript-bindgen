type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameDisabledOnBlurOnChangeOnFocusSizeStyleValue,
  value?: string,
  label?: string,
  sublabel?: string,
  helpIconHintText?: string,
  error?: bool,
  errorMessage?: string,
  hintText?: string,
  disabled?: bool,
  tags?: array<string>,
  onTagAdd?: string => unit,
  onTagRemove?: string => unit,
  onChange?: string => unit,
  size?: InputsTypes.textInputSize,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  leftSlot?: React.element,
  rightSlot?: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiValueInput"
