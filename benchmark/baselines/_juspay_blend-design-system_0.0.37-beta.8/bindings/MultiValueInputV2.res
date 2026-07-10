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
  tags?: EditorSharedTypes.inputsV2TagsConfig,
  onChange?: string => unit,
  onTagAdd?: string => unit,
  onTagRemove?: string => unit,
  size?: EditorSharedTypes.inputSizeV2,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  leftSlot?: React.element,
  rightSlot?: React.element,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiValueInputV2"
