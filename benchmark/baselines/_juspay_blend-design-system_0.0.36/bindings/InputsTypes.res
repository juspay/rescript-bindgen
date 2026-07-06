type textInputSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type inputsCursor =
  | @as("text") Text
  | @as("default") Default
  | @as("not-allowed") NotAllowed
  | @as("pointer") Pointer
type textInputGroupPosition =
  | @as("center") Center
  | @as("left") Left
  | @as("right") Right
type numberInputSize =
  | @as("md") Md
  | @as("lg") Lg
type dropdownPosition =
  | @as("left") Left
  | @as("right") Right
type unitInputSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type unitPosition =
  | @as("left") Left
  | @as("right") Right
type inputsResize =
  | @as("none") None
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
  | @as("block") Block
  | @as("inline") Inline
  | @as("both") Both
type inputsTextInputTokensTypePlaceholderConfig = {
  color: string,
  fontWeight: string,
}
type inputsTextInputTokensTypeLabelColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsTextInputTokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: inputsTextInputTokensTypeLabelColorConfig,
}
type inputsTextInputTokensTypeHelpIconConfig = {
  width: string,
  color: inputsTextInputTokensTypeLabelColorConfig,
}
type inputsTextInputTokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type inputsTextInputTokensTypeRequiredConfig = {
  color: string,
}
type inputsTextInputTokensTypeInputContainerFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsTextInputTokensTypeInputContainerPaddingConfig = {
  x: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  y: inputsTextInputTokensTypeInputContainerFontSizeConfig,
}
type inputsTextInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type textInputTokensType = {
  placeholder: inputsTextInputTokensTypePlaceholderConfig,
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsTextInputTokensTypeInputContainerConfig,
}
type responsiveTextInputTokens = {
  sm: textInputTokensType,
  lg: textInputTokensType,
}
type inputsNumberInputTokensTypeInputContainerStepperButtonIconConfig = {
  color: inputsTextInputTokensTypeLabelColorConfig,
  width: inputsTextInputTokensTypeInputContainerFontSizeConfig,
}
type inputsNumberInputTokensTypeInputContainerStepperButtonConfig = {
  width: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
  icon: inputsNumberInputTokensTypeInputContainerStepperButtonIconConfig,
}
type inputsNumberInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
  stepperButton: inputsNumberInputTokensTypeInputContainerStepperButtonConfig,
}
type numberInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsNumberInputTokensTypeInputContainerConfig,
}
type responsiveNumberInputTokens = {
  sm: numberInputTokensType,
  lg: numberInputTokensType,
}
type inputsDropdownInputTokensTypeInputContainerConfig = {
  gap: string,
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  borderRadius?: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type dropdownInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  inputContainer: inputsDropdownInputTokensTypeInputContainerConfig,
}
type responsiveDropdownInputTokens = {
  sm: dropdownInputTokensType,
  lg: dropdownInputTokensType,
}
type inputsSearchInputTokensTypeInputContainerPaddingConfig = {
  x: string,
  y: string,
}
type inputsSearchInputTokensTypeInputContainerConfig = {
  padding: inputsSearchInputTokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  borderBottom: inputsTextInputTokensTypeLabelColorConfig,
  outline: string,
  boxShadow: string,
  color: inputsTextInputTokensTypeLabelColorConfig,
  fontSize: string,
  fontWeight: string,
}
type inputsSearchInputTokensTypeIconConfig = {
  color: inputsTextInputTokensTypeLabelColorConfig,
  width: string,
}
type searchInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsSearchInputTokensTypeInputContainerConfig,
  icon: inputsSearchInputTokensTypeIconConfig,
}
type responsiveSearchInputTokens = {
  sm: searchInputTokensType,
  lg: searchInputTokensType,
}
type inputsOTPInputTokensTypeInputContainerInputConfig = {
  height: string,
  width: string,
  fontSize: string,
  fontWeight: string,
  color: inputsTextInputTokensTypeLabelColorConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type inputsOTPInputTokensTypeInputContainerConfig = {
  gap: string,
  input: inputsOTPInputTokensTypeInputContainerInputConfig,
}
type otpInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsOTPInputTokensTypeInputContainerConfig,
}
type responsiveOTPInputTokens = {
  sm: otpInputTokensType,
  lg: otpInputTokensType,
}
type inputsUnitInputTokensTypeInputContainerUnitConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  padding: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type inputsUnitInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  borderRadius: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  boxShadow: string,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
  unit: inputsUnitInputTokensTypeInputContainerUnitConfig,
}
type unitInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsUnitInputTokensTypeInputContainerConfig,
}
type responsiveUnitInputTokens = {
  sm: unitInputTokensType,
  lg: unitInputTokensType,
}
type inputsMultiValueInputTokensTypeInputContainerConfig = {
  fontSize: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  fontWeight: inputsTextInputTokensTypeInputContainerFontSizeConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: inputsTextInputTokensTypeLabelColorConfig,
  padding: inputsTextInputTokensTypeInputContainerPaddingConfig,
  border: inputsTextInputTokensTypeLabelColorConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type multiValueInputTokensType = {
  gap: string,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsMultiValueInputTokensTypeInputContainerConfig,
}
type responsiveMultiValueInputTokens = {
  sm: multiValueInputTokensType,
  lg: multiValueInputTokensType,
}
type inputsTextAreaTokensTypePlaceholderConfig = {
  color?: string,
  fontWeight?: string,
}
type inputsTextAreaTokensTypeInputContainerConfig = {
  fontSize: string,
  fontWeight: string,
  padding: inputsSearchInputTokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsTextInputTokensTypeLabelColorConfig,
  color: inputsTextInputTokensTypeLabelColorConfig,
  backgroundColor: inputsTextInputTokensTypeLabelColorConfig,
}
type textAreaTokensType = {
  gap: string,
  placeholder?: inputsTextAreaTokensTypePlaceholderConfig,
  label: inputsTextInputTokensTypeLabelConfig,
  subLabel: inputsTextInputTokensTypeLabelConfig,
  helpIcon: inputsTextInputTokensTypeHelpIconConfig,
  hintText: inputsTextInputTokensTypeLabelConfig,
  errorMessage: inputsTextInputTokensTypeErrorMessageConfig,
  required: inputsTextInputTokensTypeRequiredConfig,
  inputContainer: inputsTextAreaTokensTypeInputContainerConfig,
}
type responsiveTextAreaTokens = {
  sm: textAreaTokensType,
  lg: textAreaTokensType,
}
