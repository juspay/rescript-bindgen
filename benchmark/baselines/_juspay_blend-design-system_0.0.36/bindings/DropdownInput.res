type props = {
  ...HtmlAttrs.inputHTMLAttributesOmitClassNameOnBlurOnChangeOnFocusSizeSlotStyleValue,
  label?: string,
  sublabel?: string,
  helpIconHintText?: string,
  error?: bool,
  errorMessage?: string,
  hintText?: string,
  value?: string,
  onChange?: ReactEvent.Form.t => unit,
  slot?: React.element,
  size?: InputsTypes.textInputSize,
  dropDownValue?: string,
  onDropDownChange?: string => unit,
  dropDownItems: array<SelectTypes.selectMenuGroupType>,
  dropdownName?: string,
  onDropdownOpen?: unit => unit,
  onDropdownClose?: unit => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  onFocus?: ReactEvent.Focus.t => unit,
  dropdownPosition?: InputsTypes.dropdownPosition,
  maxMenuHeight?: float,
  minMenuWidth?: float,
  maxMenuWidth?: float,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "DropdownInput"
